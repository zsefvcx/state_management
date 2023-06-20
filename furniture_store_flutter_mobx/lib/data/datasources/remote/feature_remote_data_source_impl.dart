import 'package:furniture_store/data/datasources/remote/feature_remote_data_source.dart';
import 'package:furniture_store/data/models/product_model.dart';

class FeatureRemoteDataSourceImpl extends FeatureRemoteDataSource {

  FeatureRemoteDataSourceImpl();

  @override
  Future<List<ProductModel>> getAllProducts(int page) async {
    List<ProductModel> result = [
      const ProductModel(
        id: 0,
        parentId: null,
        trademarkId: 0,
        title: 'Шкаф',
        pictures: [],
        url: null,
        price: 15000,
      ),
      const ProductModel(
        id: 1,
        parentId: null,
        trademarkId: 0,
        title: 'Стул',
        pictures: [],
        url: null,
        price: 2000,
      ),
      const ProductModel(
        id: 2,
        parentId: null,
        trademarkId: 0,
        title: 'Стол',
        pictures: [],
        url: null,
        price: 5000,
      ),
      const ProductModel(
        id: 3,
        parentId: null,
        trademarkId: 0,
        title: 'Кровать',
        pictures: [],
        url: null,
        price: 15000,
      ),
      const ProductModel(
        id: 4,
        parentId: null,
        trademarkId: 0,
        title: 'Матрас',
        pictures: [],
        url: null,
        price: 13000,
      ),
    ];
    return await Future<List<ProductModel>>.delayed(const Duration(seconds: 2),
          () => result,);
  }

  @override
  Future<List<ProductModel>> searchProduct(int id) async {
    List<ProductModel> result = [
      const ProductModel(
        id: 0,
        parentId: null,
        trademarkId: 0,
        title: 'Шкаф',
        pictures: [],
        url: null,
        price: 15000,
      ),
      const ProductModel(
        id: 1,
        parentId: null,
        trademarkId: 0,
        title: 'Стул',
        pictures: [],
        url: null,
        price: 2000,
      ),
      const ProductModel(
        id: 2,
        parentId: null,
        trademarkId: 0,
        title: 'Стол',
        pictures: [],
        url: null,
        price: 5000,
      ),
      const ProductModel(
        id: 3,
        parentId: null,
        trademarkId: 0,
        title: 'Кровать',
        pictures: [],
        url: null,
        price: 15000,
      ),
      const ProductModel(
        id: 4,
        parentId: null,
        trademarkId: 0,
        title: 'Матрас',
        pictures: [],
        url: null,
        price: 13000,
      ),
    ];
    return await Future<List<ProductModel>>.delayed(const Duration(seconds: 5),
          () => [result[id]],);
  }

}
