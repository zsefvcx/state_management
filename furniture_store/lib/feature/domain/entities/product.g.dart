// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int,
      trademarkId: json['trademark_id'] as int?,
      parentId: json['parent_id'] as int?,
      title: json['title'] as String,
      url: json['url'] as String?,
      price: (json['price'] as num?)?.toDouble() ?? 0,
      pictures: (json['pictures'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'trademark_id': instance.trademarkId,
      'parent_id': instance.parentId,
      'title': instance.title,
      'url': instance.url,
      'price': instance.price,
      'pictures': instance.pictures,
    };
