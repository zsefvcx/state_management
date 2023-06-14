

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:furniture_store/presentation/store_app.dart';
import 'package:window_manager/window_manager.dart';

import 'domain/bloc/bloc.dart';

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
      // await windowManager.setPosition(settingsApp.positionStart);
      // await windowManager.setMaximumSize(SettingsApp.maxSizeLite);
      // await windowManager.setMinimumSize(SettingsApp.minSizeLite);
      // await windowManager.setSize(SettingsApp.sizeLite);
      // await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
      // await windowManager.setResizable(true);
      // await windowManager.setMinimizable(true);
      // await windowManager.setMaximizable(true);
      // await windowManager.setAsFrameless();
      await windowManager.show();
      await windowManager.focus();
    });
  }


  BlocFactory.instance.initialize();
  runApp(const StoreApp());
}