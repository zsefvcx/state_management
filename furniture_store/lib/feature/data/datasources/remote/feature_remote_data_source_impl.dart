import 'package:furniture_store/feature/data/datasources/remote/feature_remote_data_source.dart';
import 'package:furniture_store/feature/data/models/product_model.dart';

class FeatureRemoteDataSourceImpl extends FeatureRemoteDataSource {

  FeatureRemoteDataSourceImpl();

  @override
  Future<List<ProductModel>> gatAllProducts(int page) async {
    List<ProductModel> result = [
      ProductModel(
        id: 0,
        parentId: null,
        trademarkId: 0,
        title: 'Шкаф',
        pictures: [],
        url: null,
        price: 15000,
      ),
      ProductModel(
        id: 1,
        parentId: null,
        trademarkId: 0,
        title: 'Стул',
        pictures: [],
        url: null,
        price: 2000,
      ),
      ProductModel(
        id: 2,
        parentId: null,
        trademarkId: 0,
        title: 'Стол',
        pictures: [],
        url: null,
        price: 5000,
      ),
      ProductModel(
        id: 3,
        parentId: null,
        trademarkId: 0,
        title: 'Кровать',
        pictures: [],
        url: null,
        price: 15000,
      ),
      ProductModel(
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
          () => result,);
  }

  @override
  Future<List<ProductModel>> searchProduct(int id) async {
    List<ProductModel> result = [
      ProductModel(
        id: 0,
        parentId: null,
        trademarkId: 0,
        title: 'Шкаф',
        pictures: [],
        url: null,
        price: 15000,
      ),
      ProductModel(
        id: 1,
        parentId: null,
        trademarkId: 0,
        title: 'Стул',
        pictures: [],
        url: null,
        price: 2000,
      ),
      ProductModel(
        id: 2,
        parentId: null,
        trademarkId: 0,
        title: 'Стол',
        pictures: [],
        url: null,
        price: 5000,
      ),
      ProductModel(
        id: 3,
        parentId: null,
        trademarkId: 0,
        title: 'Кровать',
        pictures: [],
        url: null,
        price: 15000,
      ),
      ProductModel(
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
