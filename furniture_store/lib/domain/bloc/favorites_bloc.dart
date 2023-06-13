import 'package:flutter/material.dart';
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:furniture_store/domain/repositories/repositories.dart';

class FavoritesBloc  with ChangeNotifier{

  final FavoritesRepository _favoritesRepository;

  Set<FavoritesEntity> favoritesModel = {};

  FavoritesBloc({
    required FavoritesRepository favoritesRepository,
  }) : _favoritesRepository= favoritesRepository{
    fav();
  }

  Future<void> fav() async {
    favoritesModel = await _favoritesRepository.fav();
    notifyListeners();
  }

  bool statusFav(int id) => _favoritesRepository.status(id);

  Future<void> addFav(int id) async {
    await _favoritesRepository.add(id);
    notifyListeners();
  }

  Future<void> remFav(int id) async {
    await _favoritesRepository.rem(id);
    notifyListeners();
  }


}