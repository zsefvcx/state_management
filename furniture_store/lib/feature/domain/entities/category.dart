
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'category.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryEntity extends Equatable{
  final int id;
  @JsonKey(defaultValue: 'Default')
  final String title;
  @JsonKey(name: 'parent_id')
  final int? parentId;

  @JsonKey(defaultValue: [])
  final List<String> pictures;

  const CategoryEntity({
    required this.id,
    required this.title,
    required this.parentId,
    required this.pictures,
  });

  @override
  List<Object?> get props => [id, title, parentId, pictures.toSet(),];

  @override
  bool get stringify => true;

  factory CategoryEntity.fromJson(Map<String, dynamic> json) => _$CategoryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryEntityToJson(this);
}
