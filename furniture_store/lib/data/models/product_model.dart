
import 'package:json_annotation/json_annotation.dart';
import 'package:furniture_store/domain/entities/entities.dart';

part 'product_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductModel extends ProductEntity{
  const ProductModel({
    required id,
    required trademarkId,
    required parentId,
    required title,
    required url,
    required price,
    required pictures,
  }) : super(
      id: id,
      trademarkId:
      trademarkId,
      parentId: parentId,
      title: title,
      url: url,
      price: price,
      pictures: pictures
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}