

import 'dart:math';

import 'package:furniture_store/data/models/shopping_basket_model.dart';

class GenerateShoppingBasket {
  late Map<int, ShoppingBasketModel> shoppingBasketModel;

  GenerateShoppingBasket(){
    List<int> idS = List.generate(20, (index) => Random().nextInt(1000));
    shoppingBasketModel = {
      for (var element in idS)
        element : ShoppingBasketModel(
            id: element,
            count: Random().nextInt(10)+1
        )
    };
  }

  static final instance = GenerateShoppingBasket();

}