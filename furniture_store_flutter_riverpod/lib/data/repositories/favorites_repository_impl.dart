

import 'package:furniture_store/data/datasources/local/feature_favorites_data_source.dart';
import 'package:furniture_store/domain/entities/favorites.dart';
import 'package:furniture_store/domain/repositories/repositories.dart';

class FavoritesRepositoryImpl extends FavoritesRepository {

  final FeatureFavoritesDataSource featureFavoritesDataSource;


  FavoritesRepositoryImpl({required this.featureFavoritesDataSource});

  @override
  Future<void> add(int id) async {
    await featureFavoritesDataSource.add(id);
  }

  @override
  Future<Map<int, FavoritesEntity>> fav() async {
    return await featureFavoritesDataSource.fav();
  }

  @override
  Future<void> rem(int id) async {
    await featureFavoritesDataSource.rem(id);
  }

  @override
  bool status(int id) {
    return featureFavoritesDataSource.status(id);
  }


}