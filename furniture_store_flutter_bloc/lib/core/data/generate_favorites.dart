

import 'dart:math';

import 'package:furniture_store/data/models/favorites_model.dart';

class GenerateFavorites {
  late Map<int, FavoritesModel> favoritesModel;

  GenerateFavorites(){
    List<int> idS = List.generate(15, (index) => Random().nextInt(1000));
    favoritesModel = { for (var element in idS) element : FavoritesModel(id: element) };
  }

  static final instance = GenerateFavorites();

}