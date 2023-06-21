
import 'package:flutter/foundation.dart';
import 'package:furniture_store/data/models/favorites_model.dart';
import 'package:furniture_store/domain/repositories/repositories.dart';

class MapFavoritesModel {
  final Map<int, FavoritesModel> model;

  const MapFavoritesModel({
    required this.model,
  });

  bool getStatus({required int id}) => model[id]!=null?true:false;
  int getLength() => model.length;

  MapFavoritesModel copyWith({
    required Map<int, FavoritesModel>? model,
  }){
    return MapFavoritesModel(
      model: model ?? this.model,
    );
  }
}

class FavoritesBloc with ChangeNotifier{

  final FavoritesRepository _favoritesRepository;

  MapFavoritesModel model = const MapFavoritesModel(model: {});

  FavoritesBloc({
    required FavoritesRepository favoritesRepository,
  }) : _favoritesRepository= favoritesRepository{
    fav();
  }

  Future<void> fav() async {
    var model = await _favoritesRepository.fav();
    this.model = this.model.copyWith(model: model);
    notifyListeners();
  }

  Future<void> addFav(int id) async {
    await _favoritesRepository.add(id);
    await fav();
    notifyListeners();
  }

  Future<void> remFav(int id) async {
    await _favoritesRepository.rem(id);
    await fav();
    notifyListeners();
  }


}