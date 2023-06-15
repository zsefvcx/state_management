
import 'package:furniture_store/domain/bloc/bloc.dart';
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:furniture_store/domain/repositories/repositories.dart';

class FavoritesBloc extends MyBloc<FavoritesEntity> {

  final FavoritesRepository _favoritesRepository;


  FavoritesBloc({
    required FavoritesRepository favoritesRepository,
  }) : _favoritesRepository= favoritesRepository{
    fav();
  }

  Future<void> fav() async {
    model = await _favoritesRepository.fav();
    notifyListeners();
  }

  bool statusFav(int id) => _favoritesRepository.status(id);

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