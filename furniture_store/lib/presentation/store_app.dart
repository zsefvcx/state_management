
import 'package:flutter/material.dart';
import 'package:furniture_store/domain/bloc/bloc.dart';
import 'package:furniture_store/presentation/pages/store_home_page.dart';
import 'package:provider/provider.dart';



class StoreApp extends StatefulWidget {
  const StoreApp({super.key});

  @override
  State<StoreApp> createState() => _StoreAppState();
}

class _StoreAppState extends State<StoreApp> {
  late final MainBloc _mainBloc;
  late final FavoritesBloc _favoritesBloc;
  @override
  void initState() {
    super.initState();
    _mainBloc = BlocFactory.instance.get<MainBloc>();
    _favoritesBloc = BlocFactory.instance.get<FavoritesBloc>();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _mainBloc.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainBloc>(
            create: (_) =>
            _mainBloc),
        ChangeNotifierProvider<FavoritesBloc>(
            create: (_) =>
            _favoritesBloc),
      ],
      child: MaterialApp(
        title: 'Store Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const StoreHomePage(title: 'Store'),
      ),
    );
  }
}
