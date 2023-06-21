

import 'package:furniture_store/data/models/favorites_model.dart';

abstract class FavoritesRepository {

  Future<void> add(int id);

  Future<void> rem(int id);

  bool status(int id);

  Future<Map<int, FavoritesModel>> fav();

  bool isBusy();

}