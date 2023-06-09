// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryEntity _$CategoryEntityFromJson(Map<String, dynamic> json) =>
    CategoryEntity(
      id: json['id'] as int,
      title: json['title'] as String? ?? 'Default',
      parentId: json['parent_id'] as int?,
      pictures: (json['pictures'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$CategoryEntityToJson(CategoryEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'parent_id': instance.parentId,
      'pictures': instance.pictures,
    };
