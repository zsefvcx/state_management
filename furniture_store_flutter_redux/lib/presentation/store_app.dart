
import 'package:flutter/material.dart';
import 'package:furniture_store/domain/bloc/bloc.dart';
import 'package:furniture_store/domain/bloc/shopping_basket_bloc.dart';
import 'package:furniture_store/presentation/route_generator.dart';

// final mainBlocProvider = StateNotifierProvider<MainBloc, MainStatus>((ref) => BlocFactory.instance.get<MainBloc>());
// final favoritesProvider = StateNotifierProvider<FavoritesBloc ,Favorites>((ref) => BlocFactory.instance.get<FavoritesBloc>());
// final shoppingBasketProvider = StateNotifierProvider<ShoppingBasketBloc, ShoppingBasket>((ref) => BlocFactory.instance.get<ShoppingBasketBloc>());
//https://habr.com/ru/articles/481624/
enum Actions {
  bas,
  addBas,
  remBas,
  setCountBas,
  remAll,
  getCountBas,
  statusBas,
}

 int shoppingBasketReducer(int state, dynamic action) {
   return action == Actions.Increment ? state + 1 : state;
 }

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Store Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RouteGenerator.initialRoute,
        onGenerateRoute: (RouteSettings settings)=>RouteGenerator.generateRoute(settings),
    );
  }
}
