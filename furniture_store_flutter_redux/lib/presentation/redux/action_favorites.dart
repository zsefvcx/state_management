import 'package:furniture_store/domain/entities/entities.dart';

class ReadFavAction {}

class FavAction {
  Map<int, FavoritesEntity> model;

  FavAction({required this.model});

}

class AddFavAction {
  int id;

  AddFavAction({required this.id});
}

class RemFavAction {
  int id;

  RemFavAction({required this.id});
}