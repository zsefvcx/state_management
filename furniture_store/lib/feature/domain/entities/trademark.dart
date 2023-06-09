
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trademark.g.dart';

@JsonSerializable(explicitToJson: true)
class Trademark  extends Equatable{
  final int id;
  final String title;
  @JsonKey(defaultValue: [])
  final List<String> pictures;

  const Trademark({
    required this.id,
    required this.title,
    required this.pictures
  });

  @override
  List<Object?> get props => [id, title, pictures.toSet()];

  @override
  bool get stringify => true;

  factory Trademark.fromJson(Map<String, dynamic> json) => _$TrademarkFromJson(json);

  Map<String, dynamic> toJson() => _$TrademarkToJson(this);
}