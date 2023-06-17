


import 'package:furniture_store/data/models/shopping_basket_model.dart';

abstract class FeatureShoppingBasketDataSource {

  Future<void> remAll();

  Future<void> add(int id);

  Future<void> rem(int id);

  Future<Map<int, ShoppingBasketModel>> bas();

  bool status(int id);

  int getCountBas(int id);

  Future<void> setCountBas(int id, int value);

}