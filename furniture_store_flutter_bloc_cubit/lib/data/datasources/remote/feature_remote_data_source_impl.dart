import 'package:furniture_store/core/data/generate_all_gpoduct.dart';
import 'package:furniture_store/data/datasources/remote/feature_remote_data_source.dart';
import 'package:furniture_store/data/models/product_model.dart';

class FeatureRemoteDataSourceImpl extends FeatureRemoteDataSource {

  FeatureRemoteDataSourceImpl();

  @override
  Future<List<ProductModel>> getAllProducts(int page) async {

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
