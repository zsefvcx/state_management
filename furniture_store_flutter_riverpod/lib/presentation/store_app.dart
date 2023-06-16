
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store/domain/bloc/bloc.dart';
import 'package:furniture_store/domain/bloc/shopping_basket_bloc.dart';
import 'package:furniture_store/presentation/route_generator.dart';

final mainBlocProvider = StateNotifierProvider((ref) => BlocFactory.instance.get<MainBloc>());
final favoritesProvider = StateNotifierProvider<FavoritesBloc ,Favorites>((ref) => BlocFactory.instance.get<FavoritesBloc>());
final shoppingBasketProvider = StateNotifierProvider<ShoppingBasketBloc, ShoppingBasket>((ref) => BlocFactory.instance.get<ShoppingBasketBloc>());

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
