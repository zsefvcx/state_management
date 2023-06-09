// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'],
      trademarkId: json['trademark_id'],
      parentId: json['parent_id'],
      title: json['title'],
      url: json['url'],
      price: json['price'] ?? 0,
      pictures: json['pictures'] ?? [],
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trademark_id': instance.trademarkId,
      'parent_id': instance.parentId,
      'title': instance.title,
      'url': instance.url,
      'price': instance.price,
      'pictures': instance.pictures,
    };
