// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trademark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trademark _$TrademarkFromJson(Map<String, dynamic> json) => Trademark(
      id: json['id'] as int,
      title: json['title'] as String,
      pictures: (json['pictures'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$TrademarkToJson(Trademark instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'pictures': instance.pictures,
    };
