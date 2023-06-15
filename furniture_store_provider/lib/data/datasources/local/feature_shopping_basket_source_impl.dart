
import 'package:furniture_store/data/datasources/local/feature_shopping_basket_source.dart';
import 'package:furniture_store/data/models/shopping_basket_model.dart';

class FeatureShoppingBasketDataSourceImp extends FeatureShoppingBasketDataSource{

  Map<int, ShoppingBasketModel> shoppingBasketModel = {
    1:ShoppingBasketModel(id: 1),
    4:ShoppingBasketModel(id: 4, count: 10),
  };

  @override
  Future<void> add(int id) async {
    shoppingBasketModel.putIfAbsent(id, () => ShoppingBasketModel(id: id));
    // if(shoppingBasketModel[id] == null) {
    //   shoppingBasketModel[id] = ShoppingBasketModel(id: id);
    // }
  }

  @override
  Future<Set<ShoppingBasketModel>> bas() async {
    return shoppingBasketModel.values.toSet();
  }

  @override
  Future<void> rem(int id) async {
    shoppingBasketModel.remove(id);
  }

  @override
  bool status(int id) {//Мы берем из оперативки, а в остальных случаях должны сохранять на диск.
    return shoppingBasketModel[id]==null?false:true;
  }

  @override
  int getCountBas(int id) {
    int count = 1;
    if(shoppingBasketModel[id] != null) {
      count = shoppingBasketModel[id]!.count;
    }
    return count;
  }

  @override
  Future<void> setCountBas(int id, int value) async {
    if(shoppingBasketModel[id] != null) {
      shoppingBasketModel[id]!.count = value;
    }
  }

}