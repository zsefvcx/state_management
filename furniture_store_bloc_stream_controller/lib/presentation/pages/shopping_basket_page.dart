import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:furniture_store/domain/bloc/bloc.dart';
import 'package:furniture_store/presentation/pages/store_home_page.dart';
import 'package:furniture_store/presentation/pages/widget/error_time_out_widget.dart';
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
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: AppBarTitleWidget(title: widget.title),
        centerTitle: true,
      ),
      //Использовать Visibility
      body: SafeArea(
        child: StreamBuilder<MainBlocState>(
          stream: context.read<MainBloc>().state,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final state = snapshot.data;
              if (state != null) {
                return state.map(
                  loading: (value) {
                    return const Center(child: CircularProgressIndicator());
                  },
                  error: (value) {
                    return const ErrorTimeOutWidget();
                  },
                  timeOut: (value) {
                    return const ErrorTimeOutWidget();
                  },
                  loaded: (value) {
                    // context
                    //     .read<FavoritesBloc>()
                    //     .add(const FavoritesBlocEvent.init());
                    // context
                    //     .read<ShoppingBasketBloc>()
                    //     .add(const ShoppingBasketBlocEvent.init());
                    return const StoreHomeWidget();
                  },
                );
              }
            }
            return const StoreHomeWidget();
          },
        ),
      ),

      bottomNavigationBar: const NavigatorWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.small(
        tooltip: 'Оплатить',
        onPressed: () => _showDialog(),
        backgroundColor: Colors.blue.withOpacity(0.8),
        child: const Center(
            child: Icon(
          Icons.payments_outlined,
        )),
      ),
    );
  }

  void _showDialog() {
    BuildContext? contextGlobal = _scaffoldKey.currentContext;

    if (contextGlobal != null) {
      int cont = contextGlobal.read<ShoppingBasketBloc>().model.getLength;
      if (cont == 0) return;
      showDialog(
        // flutter defined function
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
                  context
                      .read<ShoppingBasketBloc>()
                      .add(const ShoppingBasketBlocEvent.remAll());
                  RouteGenerator.currentIndex.index = 0;
                  Navigator.of(context).pushReplacementNamed(
                    StoreHomePage.routeName,
                    arguments: {
                      'TabIndex': RouteGenerator.currentIndex.index,
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

class StoreHomeWidget extends StatelessWidget {
  const StoreHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var mainBloc = context.read<MainBloc>();
    return RefreshIndicator(
      onRefresh: () async => context
          .read<MainBloc>()
          .add(const MainBlocEvent.getAllProducts(page: 0)),
      child: ScrollConfiguration(
        // + windows
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: StreamBuilder<ShoppingBasketBlocState>(
            stream: context.read<ShoppingBasketBloc>().state,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final state = snapshot.data;
                if (state != null) {
                  return state.map(loading: (value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }, loaded: (value) {
                    return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 550,
                          mainAxisExtent:
                              200, // here set custom Height You Want
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1,
                        ),
                        //padding: const EdgeInsets.only(top: 16),
                        itemCount: value.model.getLength,
                        itemBuilder: (_, index) {
                          return CardProductWidget(
                            productEntity: mainBloc
                                .mainModel.lpAll[value.model.getList[index].id],
                            type: 1,
                            count: value.model.getList[index].count,
                          );
                        });
                  });
                }
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
