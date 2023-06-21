// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trademark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrademarkEntity _$TrademarkEntityFromJson(Map<String, dynamic> json) =>
    TrademarkEntity(
      id: json['id'] as int,
      title: json['title'] as String,
      pictures: (json['pictures'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$TrademarkEntityToJson(TrademarkEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'pictures': instance.pictures,
    };
