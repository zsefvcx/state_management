import 'package:furniture_store/domain/entities/entities.dart';

abstract class ShoppingBasketRepository {

  Future<void> add(int id);

  Future<void> rem(int id);

  bool status(int id);

  Future<Map<int, ShoppingBasketEntity>> bas();

  Future<void> setCountBas(int id, int value);

  int getCountBas(int id);

  Future<void> remAll();

  bool isBusy();
}