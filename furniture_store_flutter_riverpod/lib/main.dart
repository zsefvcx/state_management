import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store/domain/bloc/bloc.dart';
import 'package:furniture_store/presentation/store_app.dart';
import 'package:window_manager/window_manager.dart';

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
  runApp(const ProviderScope(child: StoreApp()));
}