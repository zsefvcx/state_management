
import 'package:furniture_store/data/datasources/local/feature_favorites_data_source.dart';
import 'package:furniture_store/data/models/favorites_model.dart';

class FeatureFavoritesDataSourceImp extends FeatureFavoritesDataSource{

  Map<int, FavoritesModel> favoritesModel = {
    0:FavoritesModel(id: 0),
    3:FavoritesModel(id: 3),
  };

  @override
  Future<void> add(int id) async {
    await Future<void>.delayed(const Duration(seconds: 5));
    favoritesModel.putIfAbsent(id, () => FavoritesModel(id: id));
    // if(favoritesModel[id] == null) {
    //   favoritesModel[id] = FavoritesModel(id: id);
    // }
  }

  @override
  Future<Map<int, FavoritesModel>> fav() async {
    await Future<void>.delayed(const Duration(seconds: 5));
    return favoritesModel;
  }

  @override
  Future<void> rem(int id) async {
    await Future<void>.delayed(const Duration(seconds: 5));
    favoritesModel.remove(id);
  }

  @override
  bool status(int id) {//Мы берем из оперативки, а в остальных случаях должны сохранять на диск.
    return favoritesModel[id]==null?false:true;
  }

}