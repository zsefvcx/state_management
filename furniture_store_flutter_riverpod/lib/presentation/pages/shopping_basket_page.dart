import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store/presentation/pages/store_home_page.dart';
import 'package:furniture_store/presentation/route_generator.dart';
import 'package:furniture_store/presentation/store_app.dart';
import 'package:furniture_store/presentation/widgets/navigator_widget.dart';
import 'package:furniture_store/presentation/widgets/widgets.dart';

class ShoppingBasketPage extends ConsumerWidget {
  static const routeName = '/shopping_basket_page';

  const ShoppingBasketPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: AppBarTitleWidget(title: title),
        centerTitle: true,
      ),
      //Использовать Visibility
      body:SafeArea(
        child: Consumer(builder: (_, ref, __) {
          final mainBloc = ref.read(mainBlocProvider.notifier);
          final mainBlocStatus =  ref.watch(mainBlocProvider);
          ref.watch(mainBlocProvider);
          if (mainBlocStatus.timeOut || mainBlocStatus.isError){
            return Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('isTimeOut  :${mainBlocStatus.timeOut.toString()}'),
                Text('isError    :${mainBlocStatus.isError.toString()}'),
                Text('isErrorType:${mainBlocStatus.e.runtimeType}'),
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
          } if (!mainBlocStatus.isLoaded) {
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
                      final shoppingBasketBlocModel =  ref.watch(shoppingBasketProvider);
                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 550,
                          mainAxisExtent: 200, // here set custom Height You Want
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1,
                        ),
                        //padding: const EdgeInsets.only(top: 16),
                        itemCount: shoppingBasketBlocModel.model.length,
                        itemBuilder: (_, index) {
                            return CardProductWidget(productEntity: mainBlocStatus.lpAll[
                            shoppingBasketBlocModel.model.values.toList()[index].id
                            ],
                            type: 1, count: shoppingBasketBlocModel.model.values.toList()[index].count,);
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
        onPressed: ()  {
          BuildContext? contextGlobal = scaffoldKey.currentContext;
          if(contextGlobal != null) {
            int cont = ref.watch(shoppingBasketProvider).model.length;
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
                        ref.read(shoppingBasketProvider.notifier).remAll();
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
        },
        backgroundColor: Colors.blue.withOpacity(0.8),
        child: const Center(child: Icon(Icons.payments_outlined, )),
      ),
    );


  }
}

