import 'package:furniture_store/core/error/failure.dart';
import 'package:furniture_store/domain/entities/entities.dart';

abstract class FeatureRepository {
  Future<(Failure?, List<ProductEntity>?)> getAllProducts(int page);//с пагинацией
  Future<(Failure?, List<ProductEntity>?)> searchProduct(int id);// поиск по id, должен выдавать 1 продукт, но мы перестрахуемся
}
