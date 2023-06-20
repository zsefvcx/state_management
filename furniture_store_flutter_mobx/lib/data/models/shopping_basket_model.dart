import 'package:furniture_store/domain/entities/entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shopping_basket_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ShoppingBasketModel extends ShoppingBasketEntity{

  ShoppingBasketModel({required int id, int count = 1}) : super(id = id, count = count);

  factory ShoppingBasketModel.fromJson(Map<String, dynamic> json) => _$ShoppingBasketModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShoppingBasketModelToJson(this);
}