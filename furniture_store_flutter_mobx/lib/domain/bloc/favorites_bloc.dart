import 'package:furniture_store/domain/entities/entities.dart';
import 'package:furniture_store/domain/repositories/repositories.dart';

import 'package:mobx/mobx.dart';

class FavoritesBloc {

  final FavoritesRepository _favoritesRepository;

  Set<FavoritesEntity> model = {};

  FavoritesBloc({
    required FavoritesRepository favoritesRepository,
  }) : _favoritesRepository= favoritesRepository{
    init();
  }

  Future<void> init() async {
    model = await _favoritesRepository.fav();
  }

  bool status(int id) => _favoritesRepository.status(id);

  Future<void> addSingle(int id) async {
    await _favoritesRepository.add(id);
    await init();
  }

  Future<void> remSingle(int id) async {
    await _favoritesRepository.rem(id);
    await init();
  }

  int getCount(int id) {
    // TODO: implement getCount
    throw UnimplementedError();
  }

  Future<void> remAll() {
    // TODO: implement remAll
    throw UnimplementedError();
  }

  Future<void> setCount(int id, int value) {
    // TODO: implement setCount
    throw UnimplementedError();
  }

}