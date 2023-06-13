import 'package:furniture_store/domain/entities/entities.dart';

abstract class FavoritesRepository {

  Future<void> add(int id);

  Future<void> rem(int id);

  bool status(int id);

  Future<Set<FavoritesEntity>> fav();

}