import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:furniture_store/domain/entities/entities.dart';

class ReadFavAction {}

@immutable
class FavAction  extends Equatable{
  Map<int, FavoritesEntity> model;

  FavAction({required this.model});

  @override
  List<Object?> get props => [model];

  @override
  bool get stringify => true;
}

class AddFavAction {
  int id;

  AddFavAction({required this.id});
}

class RemFavAction {
  int id;

  RemFavAction({required this.id});
}

class ReadBasAction {}

class BasAction{

}

class RemAction{
  int id;
  RemAction({required this.id});
}

class SetCountAction{
  int id;
  int value;

  SetCountAction({required this.id, required this.value});

}
class RemAllAction{}