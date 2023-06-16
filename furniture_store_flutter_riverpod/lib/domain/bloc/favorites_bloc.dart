
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:furniture_store/domain/repositories/repositories.dart';

class Favorites {

  final Map<int, FavoritesEntity> model;

  const Favorites({required this.model});

  bool statusFav(int id) => model[id]!=null;

  Favorites copyWith({
    Map<int, FavoritesEntity>? model,
  }) {
    return Favorites(
      model: model ?? this.model,
    );
  }
}


class FavoritesBloc extends StateNotifier<Favorites>{

  final FavoritesRepository _favoritesRepository;

  FavoritesBloc({
    required FavoritesRepository favoritesRepository,
  }) : _favoritesRepository= favoritesRepository, super(const Favorites(model: {})) {
    fav();
  }

  Future<void> fav() async {
    Map<int, FavoritesEntity> data = await _favoritesRepository.fav();
    state = state.copyWith(model: data);
  }

  Future<void> addFav(int id) async {
    await _favoritesRepository.add(id);
    await fav();
  }

  Future<void> remFav(int id) async {
    await _favoritesRepository.rem(id);
    await fav();
  }


}