
import 'package:furniture_store/data/models/favorites_model.dart';

abstract class FeatureFavoritesDataSource {

   Future<void> add(int id);

   Future<void> rem(int id);

   Future<Set<FavoritesModel>> fav();

   bool status(int id);

}