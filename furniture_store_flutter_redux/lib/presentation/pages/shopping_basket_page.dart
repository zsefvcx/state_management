import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:furniture_store/presentation/pages/store_home_page.dart';
import 'package:furniture_store/presentation/redux/action_main.dart';
import 'package:furniture_store/presentation/redux/action_shopping_basket.dart';
import 'package:furniture_store/presentation/redux/app_state.dart';
import 'package:furniture_store/presentation/route_generator.dart';
import 'package:furniture_store/presentation/widgets/navigator_widget.dart';
import 'package:furniture_store/presentation/widgets/widgets.dart';

class ShoppingBasketPage extends StatefulWidget {
  static const routeName = '/shopping_basket_page';

  const ShoppingBasketPage({super.key, required this.title});

  final String title;

  @override
  State<ShoppingBasketPage> createState() => _ShoppingBasketPageState();
}

class _ShoppingBasketPageState extends State<ShoppingBasketPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var action = StoreProvider.of<MainAppState>(context);
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
        child: StoreConnector<MainAppState,MainAppState>(
            converter: (store) => store.state,
            builder: (context, mainBloc) {
          if (mainBloc.isTimeOut || mainBloc.isError){
            return Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('isTimeOut  :${mainBloc.isTimeOut.toString()}'),
                Text('isError    :${mainBloc.isError.toString()}'),
                Text('isErrorType:${mainBloc.e}'),
                const SizedBox(height: 50,),
                TextButton(
                    onPressed: () {
                      action.dispatch(GetAllProductsAction(page: 0));
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
                onRefresh: () async {
                  action.dispatch(GetAllProductsAction(page: 0));
                },
                child: ScrollConfiguration(// + windows
                  behavior: ScrollConfiguration.of(context).copyWith(
                    dragDevices: {
                      PointerDeviceKind.touch,
                      PointerDeviceKind.mouse,
                    },
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: StoreConnector<ShoppingBasketAppState,ShoppingBasketAppState>(
                      converter: (store) => store.state,
                      builder: (context, vm) {
                        var model = vm.model.values.toSet().toList();
                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 550,
                          mainAxisExtent: 200, // here set custom Height You Want
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1,
                        ),
                        //padding: const EdgeInsets.only(top: 16),
                        itemCount: model.length,
                        itemBuilder: (_, index) {
                            return CardProductWidget(productEntity: mainBloc.lpAll[
                              model[index].id
                            ],
                            type: 1, count: model[index].count,);
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
      int cont =  StoreProvider.of<ShoppingBasketAppState>(context).state.model.length;
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
                StoreProvider.of<ShoppingBasketAppState>(context).dispatch(RemAllAction());
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

