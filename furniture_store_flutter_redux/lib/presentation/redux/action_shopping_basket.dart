
import 'package:furniture_store/domain/entities/shopping_basket.dart';

class ReadBasAction {}

class BasAction{
  Map<int, ShoppingBasketEntity> model;

  BasAction({required this.model});

}

class AddBasAction{
  int id;
  AddBasAction({required this.id});
}

class RemBasAction{
  int id;
  RemBasAction({required this.id});
}

class SetCountBasAction{
  int id;
  int value;

  SetCountBasAction({required this.id, required this.value});

}

class RemAllAction{}