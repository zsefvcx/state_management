
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:furniture_store/domain/repositories/repositories.dart';

class FavoritesBloc {

  final FavoritesRepository _favoritesRepository;

  Set<FavoritesEntity> model = {};

  FavoritesBloc({
    required FavoritesRepository favoritesRepository,
  }) : _favoritesRepository= favoritesRepository{
    fav();
  }

  Future<void> fav() async {
    model = await _favoritesRepository.fav();
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