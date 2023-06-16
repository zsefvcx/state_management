
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:furniture_store/domain/repositories/repositories.dart';

class Favorites {

  Set<FavoritesEntity> model;

  Favorites(this.model);

}


class FavoritesBloc extends StateNotifier<Favorites>{

  final FavoritesRepository _favoritesRepository;

  FavoritesBloc({
    required FavoritesRepository favoritesRepository,
  }) : _favoritesRepository= favoritesRepository, super(Favorites({})) {
    fav();
  }

  Future<void> fav() async {
    state.model = await _favoritesRepository.fav();
  }

  bool statusFav(int id) => _favoritesRepository.status(id);

  Future<void> addFav(int id) async {
    await _favoritesRepository.add(id);
    await fav();
  }

  Future<void> remFav(int id) async {
    await _favoritesRepository.rem(id);
    await fav();
  }


}