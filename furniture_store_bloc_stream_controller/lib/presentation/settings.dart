import 'package:flutter/cupertino.dart';

class Settings {

  final ScrollController controller = ScrollController();
  final PageStorageKey shoppingKey = const PageStorageKey<String>('shoppingKey');
  final PageStorageKey basketKey = const PageStorageKey<String>('basketKey');

  static final instance = Settings();

}