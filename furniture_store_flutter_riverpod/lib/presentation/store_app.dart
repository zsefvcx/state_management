
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store/domain/bloc/bloc.dart';
import 'package:furniture_store/domain/bloc/shopping_basket_bloc.dart';
import 'package:furniture_store/presentation/route_generator.dart';

final MainBloc _mainBloc = BlocFactory.instance.get<MainBloc>();
final FavoritesBloc _favoritesBloc = BlocFactory.instance.get<FavoritesBloc>();
final ShoppingBasketBloc _shoppingBasketBloc = BlocFactory.instance.get<ShoppingBasketBloc>();
final StateProvider mainBlocProvider = StateProvider<MainBloc>((ref) => _mainBloc);
final StateProvider favoritesProvider = StateProvider<FavoritesBloc>((ref) => _favoritesBloc);
final StateProvider shoppingBasketProvider = StateProvider<ShoppingBasketBloc>((ref) => _shoppingBasketBloc);

class StoreApp extends ConsumerWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
