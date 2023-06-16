import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store/domain/bloc/main_bloc.dart';
import 'package:furniture_store/domain/bloc/shopping_basket_bloc.dart';
import 'package:furniture_store/presentation/pages/store_home_page.dart';
import 'package:furniture_store/presentation/route_generator.dart';
import 'package:furniture_store/presentation/widgets/navigator_widget.dart';
import 'package:furniture_store/presentation/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ShoppingBasketPage extends StatefulWidget {
  static const routeName = '/shopping_basket_page';

  const ShoppingBasketPage({super.key, required this.title});

  final String title;

  @override
  State<ShoppingBasketPage> createState() => _ShoppingBasketPageState();
}

class _ShoppingBasketPageState extends State<ShoppingBasketPage> {

  int currentTabIndex = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('build MyHomePage');
    }
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: AppBarTitleWidget(title: widget.title),
        centerTitle: true,
      ),
      //Использовать Visibility
      body:SafeArea(
        child: Consumer<MainBloc>(builder: (_, mainBloc, __) {
          if (kDebugMode) {
            print(mainBloc.lpAll.join('\t'));
            print('isLoaded : ${mainBloc.isLoaded.toString()}');
            print('isTimeOut:${mainBloc.isTimeOut.toString()}');
            print('isError  :${mainBloc.isError.toString()}');
            print('isErrorType  :${mainBloc.e.runtimeType}');
          }
          //;
          if (mainBloc.isTimeOut || mainBloc.isError){
            return Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('isTimeOut  :${mainBloc.isTimeOut.toString()}'),
                Text('isError    :${mainBloc.isError.toString()}'),
                Text('isErrorType:${mainBloc.e.runtimeType}'),
                const SizedBox(height: 50,),
                TextButton(
                    onPressed: () {
                      mainBloc.getAllProducts(0);
                      setState(() {
                      });
                    },
                    child: const Text('Try again')
                ),
              ],
            ));
          } if (!mainBloc.isLoaded) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return
              RefreshIndicator(
                onRefresh: () async => await mainBloc.getAllProducts(0),
                child: ScrollConfiguration(// + windows
                  behavior: ScrollConfiguration.of(context).copyWith(
                    dragDevices: {
                      PointerDeviceKind.touch,
                      PointerDeviceKind.mouse,
                    },
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Consumer<ShoppingBasketBloc>(builder: (_, shoppingBasketBloc, __) {
                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 550,
                          mainAxisExtent: 200, // here set custom Height You Want
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1,
                        ),
                        //padding: const EdgeInsets.only(top: 16),
                        itemCount: shoppingBasketBloc.model.length,
                        itemBuilder: (_, index) {
                        if (kDebugMode) print('Build CardProductWidget Basket $index');
                            return CardProductWidget(productEntity: mainBloc.lpAll[
                              shoppingBasketBloc.model.toList()[index].id
                            ],
                            type: 1, count: shoppingBasketBloc.model.toList()[index].count,);
                      });                          //
                      },
                    ),
                  ),
                ),
              );
          }
        }),
      ),

      bottomNavigationBar: const NavigatorWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.small(
        tooltip: 'Оплатить',
        onPressed: () => _showDialog(),
        backgroundColor: Colors.blue.withOpacity(0.8),
        child: const Center(child: Icon(Icons.payments_outlined, )),
      ),
    );
  }

  void _showDialog() {
    BuildContext? contextGlobal = _scaffoldKey.currentContext;

    if(contextGlobal != null) {
      int cont = Provider.of<ShoppingBasketBloc>(context, listen: false).model.length;
      if(cont == 0) return;
      showDialog(// flutter defined function
      context: contextGlobal,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: const Text('Оплатить'),
          content: const Text(''),
          actions: [
            ElevatedButton(
              child: const Text('Ok'),
              onPressed: () {
                Provider.of<ShoppingBasketBloc>(context, listen: false).remAll();
                RouteGenerator.currentIndex.index = 0;
                Navigator.of(context).
                pushReplacementNamed(StoreHomePage.routeName,
                  arguments: {
                    'TabIndex':RouteGenerator.currentIndex.index,
                  },
                );
              },
            ),
            ElevatedButton(
              child: const Text('Отмена'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    }
  }
}

