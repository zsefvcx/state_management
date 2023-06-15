

import 'package:furniture_store/data/datasources/local/feature_shopping_basket_source.dart';
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:furniture_store/domain/repositories/repositories.dart';

class ShoppingBasketRepositoryImpl extends ShoppingBasketRepository {

  final FeatureShoppingBasketDataSource featureShoppingBasketDataSource;

  ShoppingBasketRepositoryImpl({required this.featureShoppingBasketDataSource});

  @override
  Future<void> add(int id) async {
    await featureShoppingBasketDataSource.add(id);
  }

  @override
  Future<Set<ShoppingBasketEntity>> bas() async {
    return await featureShoppingBasketDataSource.bas();
  }

  @override
  Future<void> rem(int id) async {
    await featureShoppingBasketDataSource.rem(id);
  }

  @override
  bool status(int id) => featureShoppingBasketDataSource.status(id);

  @override
  int getCountBas(int id) => featureShoppingBasketDataSource.getCountBas(id);

  @override
  Future<void> setCountBas(int id, int value) async{
    await featureShoppingBasketDataSource.setCountBas(id, value);
  }




}