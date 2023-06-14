// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_basket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingBasketModel _$ShoppingBasketModelFromJson(Map<String, dynamic> json) =>
    ShoppingBasketModel(
      id: json['id'] as int,
    )..count = json['count'] as int? ?? 1;

Map<String, dynamic> _$ShoppingBasketModelToJson(
        ShoppingBasketModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'count': instance.count,
    };
