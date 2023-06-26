import 'package:furniture_store/core/data/generate_all_gpoduct.dart';
import 'package:furniture_store/data/datasources/local/feature_local_data_source.dart';
import 'package:furniture_store/data/models/product_model.dart';

class FeatureLocalDataSourceImpl extends FeatureLocalDataSource {

FeatureLocalDataSourceImpl();

@override
Future<List<ProductModel>> gatAllProducts(int page) async {
  List<ProductModel> result = GenerateAllProduct.instance.getAllProducts();
  return await Future<List<ProductModel>>.delayed(const Duration(seconds: 2),
        () => result,);
}

@override
Future<List<ProductModel>> searchProduct(int id) async {
  List<ProductModel> result = GenerateAllProduct.instance.getAllProducts();
  return await Future<List<ProductModel>>.delayed(const Duration(seconds: 2),
        () => [result[id]],);
}


}
