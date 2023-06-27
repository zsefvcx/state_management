import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store/domain/bloc/bloc.dart';
import 'package:furniture_store/presentation/pages/store_home_page.dart';
import 'package:furniture_store/presentation/pages/widget/error_time_out_widget.dart';
import 'package:furniture_store/presentation/pages/widget/grid_view_widget.dart';
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
    context.read<FavoritesBloc>().add(const FavoritesBlocEvent.init());
    context.read<ShoppingBasketBloc>().add(const ShoppingBasketBlocEvent.init());
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
        child: BlocBuilder<MainBloc, MainBlocState>(
          builder: (context, state) {
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
    return RefreshIndicator(
      onRefresh: () async {
        Future block = context.read<MainBloc>().stream.first;
        context.read<MainBloc>().add(const MainBlocEvent.getAllProducts(page: 0));
        return await block;
      },
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
          child: BlocBuilder<ShoppingBasketBloc, ShoppingBasketBlocState>(
            builder: (context, state) {
              var model = context.read<ShoppingBasketBloc>().model;
                  state.map(loading: (value) {
                    //ничего не делаем, зачем что то делать
                  }, loaded: (value) {
                    model = value.model;
                  });
              return GridViewWidget(model: model);
            },
          ),
        ),
      ),
    );
  }
}

