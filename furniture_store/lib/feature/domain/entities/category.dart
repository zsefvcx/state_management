
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'category.g.dart';

@JsonSerializable(explicitToJson: true)
class Category extends Equatable{
  final int id;
  @JsonKey(defaultValue: 'Default')
  final String title;
  @JsonKey(name: 'parent_id')
  final int? parentId;

  @JsonKey(defaultValue: [])
  final List<String> pictures;

  const Category({
    required this.id,
    required this.title,
    required this.parentId,
    required this.pictures,
  });

  @override
  List<Object?> get props => [id, title, parentId, pictures.toSet(),];

  @override
  bool get stringify => true;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
