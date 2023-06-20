import 'package:furniture_store/data/models/product_model.dart';

abstract class FeatureRemoteDataSource {

  Future<List<ProductModel>> getAllProducts(int page);//с пагинацией

  Future<List<ProductModel>> searchProduct(int id);// поиск по id, должен выдавать 1 продукт, но мы перестрахуемся
}
