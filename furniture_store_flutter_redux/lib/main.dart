import 'dart:io';

import 'package:flutter/material.dart';
import 'package:furniture_store/presentation/redux/reducers.dart';
import 'package:furniture_store/presentation/store_app.dart';
import 'package:window_manager/window_manager.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'domain/bloc/bloc.dart';
import 'presentation/redux/app_state.dart';
import 'presentation/redux/middlewares.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isMacOS   || Platform.isLinux || Platform.isWindows) {
    await windowManager.ensureInitialized();
    WindowOptions windowOptions = const WindowOptions(
      minimumSize: Size(400, 600),
      size: Size(800, 600),
      center: true,
      alwaysOnTop: false,
      skipTaskbar: false,
      fullScreen: false,
      backgroundColor: Colors.transparent,
      title: 'Store',
      titleBarStyle: TitleBarStyle.normal,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }


  BlocFactory.instance.initialize();

 final Store<FavoritesAppState> storeFavorites = Store(reducerFav,
   middleware: [
     loaderMiddleWare
   ],
   initialState: FavoritesAppState.initial(),

 );

  final Store<ShoppingBasketAppState> storeShoppingBasket= Store(reducerBas,
    middleware: [
      loaderMiddleWare
    ],
    initialState: ShoppingBasketAppState.initial(),

  );

  final Store<MainAppState> storeMain= Store(reducerMain,
    middleware: [
      loaderMiddleWareMain
    ],
    initialState: MainAppState.initial(),

  );
  runApp(
      StoreProvider(             store: storeMain,
        child: StoreProvider(    store: storeShoppingBasket,
            child: StoreProvider(store: storeFavorites, child: const StoreApp())),
      ));
}