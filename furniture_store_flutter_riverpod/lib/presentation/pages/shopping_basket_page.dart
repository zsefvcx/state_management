import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store/presentation/store_app.dart';
import 'package:furniture_store/presentation/widgets/navigator_widget.dart';
import 'package:furniture_store/presentation/widgets/widgets.dart';

final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();

class ShoppingBasketPage extends ConsumerWidget {
  static const routeName = '/shopping_basket_page';

  const ShoppingBasketPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (kDebugMode) {
      print('build MyHomePage');
    }
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: AppBarTitleWidget(title: title),
        centerTitle: true,
      ),
      //Использовать Visibility
      body:SafeArea(
        child: Consumer(builder: (_, ref, __) {
          final mainBloc = ref.watch(mainBlocProvider);
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
                      // setState(() {
                      // });
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
                    child: Consumer(builder: (_, ref, __) {
                      final shoppingBasketBloc = ref.watch(shoppingBasketProvider);
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
        onPressed: () {},//_showDialog(),
        backgroundColor: Colors.blue.withOpacity(0.8),
        child: const Center(child: Icon(Icons.payments_outlined, )),
      ),
    );
  }
}

