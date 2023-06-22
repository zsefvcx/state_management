
import 'package:furniture_store/core/data/generate_shopping_basket.dart';
import 'package:furniture_store/data/datasources/local/feature_shopping_basket_source.dart';
import 'package:furniture_store/data/models/shopping_basket_model.dart';
import 'package:furniture_store/domain/entities/entities.dart';

class FeatureShoppingBasketDataSourceImp extends FeatureShoppingBasketDataSource{

  Map<int, ShoppingBasketModel> shoppingBasketModel = GenerateShoppingBasket.instance.shoppingBasketModel;

  @override
  Future<void> add(int id) async {
    if(shoppingBasketModel.length>999) {
      shoppingBasketModel.remove(
          shoppingBasketModel.keys.toList()[0]
      );
    }
    shoppingBasketModel.putIfAbsent(id, () => ShoppingBasketModel(id: id));
    // if(shoppingBasketModel[id] == null) {
    //   shoppingBasketModel[id] = ShoppingBasketModel(id: id);
    // }
  }

  @override
  Future<Map<int, ShoppingBasketEntity>> bas() async {
    return shoppingBasketModel;
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

  @override
  Future<void> remAll() async{
    shoppingBasketModel.clear();
  }

}