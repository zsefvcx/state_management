
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class ProductEntity extends Equatable{
  final int id;
  @JsonKey(name: 'trademark_id')
  final int? trademarkId;
  @JsonKey(name: 'parent_id')
  final int? parentId;
  final String title;
  final String? url;
  @JsonKey(defaultValue: 0)
  final double price;
  @JsonKey(defaultValue: [])
  final List<String> pictures;

  const ProductEntity({
    required this.id,
    required this.trademarkId,
    required this.parentId,
    required this.title,
    required this.url,
    required this.price,
    required this.pictures,
  });

  @override
  List<Object?> get props => [id, trademarkId, parentId, title, url, pictures.toSet(), price];

  @override
  bool get stringify => true;
}