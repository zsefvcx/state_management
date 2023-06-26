

import 'package:json_annotation/json_annotation.dart';

abstract class ShoppingBasketEntity{

  final int id;

  @JsonKey(defaultValue: 1)
  int count;

  ShoppingBasketEntity(this.id, [this.count = 1]);

  @override
  String toString() {
    return '$id';
  }
}