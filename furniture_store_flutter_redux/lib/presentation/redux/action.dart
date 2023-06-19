import 'package:equatable/equatable.dart';
import 'package:furniture_store/domain/entities/entities.dart';

class ReadFavAction {}

class FavAction  extends Equatable{
  Map<int, FavoritesEntity> model;

  FavAction({required this.model});

  @override
  List<Object?> get props => [model];

  @override
  bool get stringify => true;
}

class StatusFavAction {
  int id;

  StatusFavAction({required this.id});
}

class AddFavAction {
  int id;

  AddFavAction({required this.id});
}

class RemFavAction {
  int id;

  RemFavAction({required this.id});
}