
import 'package:flutter/material.dart';
import 'package:furniture_store/domain/bloc/bloc.dart';
import 'package:furniture_store/domain/bloc/shopping_basket_bloc.dart';
import 'package:furniture_store/presentation/route_generator.dart';
import 'package:provider/provider.dart';



class StoreApp extends StatefulWidget {
  const StoreApp({super.key});

  @override
  State<StoreApp> createState() => _StoreAppState();
}

class _StoreAppState extends State<StoreApp> {
  late final MainBloc _mainBloc;
  late final FavoritesBloc _favoritesBloc;
  late final ShoppingBasketBloc _shoppingBasketBloc;
  @override
  void initState() {
    super.initState();
    _mainBloc = BlocFactory.instance.get<MainBloc>();
    _favoritesBloc = BlocFactory.instance.get<FavoritesBloc>();
    _shoppingBasketBloc = BlocFactory.instance.get<ShoppingBasketBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainBloc>(
            create: (_) =>
            _mainBloc),
        Provider<FavoritesBloc>(
            create: (_) =>
            _favoritesBloc),
        Provider<ShoppingBasketBloc>(
            create: (_) =>
            _shoppingBasketBloc),
      ],
      child: MaterialApp(
        title: 'Store Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RouteGenerator.initialRoute,
        onGenerateRoute: (RouteSettings settings)=>RouteGenerator.generateRoute(settings),
      ),
    );
  }
}
