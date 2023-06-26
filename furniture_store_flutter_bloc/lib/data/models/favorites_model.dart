
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favorites_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FavoritesModel extends FavoritesEntity{

  FavoritesModel({required int id}) : super(id = id);

  factory FavoritesModel.fromJson(Map<String, dynamic> json) => _$FavoritesModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavoritesModelToJson(this);
}