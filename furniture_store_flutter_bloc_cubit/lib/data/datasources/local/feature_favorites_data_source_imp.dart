
import 'package:furniture_store/core/data/generate_favorites.dart';
import 'package:furniture_store/data/datasources/local/feature_favorites_data_source.dart';
import 'package:furniture_store/data/models/favorites_model.dart';

class FeatureFavoritesDataSourceImp extends FeatureFavoritesDataSource{

  Map<int, FavoritesModel> favoritesModel = GenerateFavorites.instance.favoritesModel;

  @override
  Future<void> add(int id) async {
    favoritesModel.putIfAbsent(id, () => FavoritesModel(id: id));
    // if(favoritesModel[id] == null) {
    //   favoritesModel[id] = FavoritesModel(id: id);
    // }
  }

  @override
  Future<Map<int, FavoritesModel>> fav() async {
    return favoritesModel;
  }

  @override
  Future<void> rem(int id) async {
    favoritesModel.remove(id);
  }

  @override
  bool status(int id) {//Мы берем из оперативки, а в остальных случаях должны сохранять на диск.
    return favoritesModel[id]==null?false:true;
  }

}