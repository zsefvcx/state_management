
import 'package:furniture_store/domain/entities/entities.dart';

abstract class FeatureShoppingBasketDataSource {

  Future<void> remAll();

  Future<void> add(int id);

  Future<void> rem(int id);

  Future<Map<int, ShoppingBasketEntity>> bas();

  bool status(int id);

  int getCountBas(int id);

  Future<void> setCountBas(int id, int value);

}