

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store/domain/bloc/bloc.dart';
import 'package:furniture_store/presentation/pages/widget/store_home_widget.dart';
import 'package:furniture_store/presentation/widgets/navigator_widget.dart';
import 'package:furniture_store/presentation/widgets/widgets.dart';

import 'widget/error_time_out_widget.dart';

class StoreHomePage extends StatefulWidget {
  static const routeName = '/';

  const StoreHomePage({super.key, required this.title});

  final String title;

  @override
  State<StoreHomePage> createState() => _StoreHomePageState();
}

class _StoreHomePageState extends State<StoreHomePage> {
  @override
  Widget build(BuildContext context) {
    context.read<FavoritesBloc>().add(const FavoritesBlocEvent.init());
    context.read<ShoppingBasketBloc>().add(const ShoppingBasketBlocEvent.init());
    return Scaffold(
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
       )
      ),
      bottomNavigationBar: const NavigatorWidget(),
    );
  }
}
