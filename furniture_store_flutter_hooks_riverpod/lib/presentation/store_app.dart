
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_store/domain/bloc/bloc.dart';
import 'package:furniture_store/presentation/route_generator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mainBlocProvider = StateNotifierProvider<MainBloc, MainStatus>((ref) => BlocFactory.instance.get<MainBloc>());
final favoritesProvider = StateNotifierProvider<FavoritesBloc ,Favorites>((ref) => BlocFactory.instance.get<FavoritesBloc>());
final shoppingBasketProvider = StateNotifierProvider<ShoppingBasketBloc, ShoppingBasket>((ref) => BlocFactory.instance.get<ShoppingBasketBloc>());

class StoreApp extends HookWidget {
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
