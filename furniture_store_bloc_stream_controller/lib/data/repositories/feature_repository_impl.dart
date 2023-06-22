import 'package:furniture_store/core/core.dart';
import 'package:furniture_store/core/error/exception.dart';
import 'package:furniture_store/data/datasources/local/feature_local_data_source.dart';
import 'package:furniture_store/data/datasources/remote/feature_remote_data_source.dart';
import 'package:furniture_store/domain/entities/product.dart';
import 'package:furniture_store/domain/repositories/repositories.dart';


class FeatureRepositoryImpl extends FeatureRepository {

  final FeatureRemoteDataSource featureRemoteDataSource;
  final FeatureLocalDataSource featureLocalDataSource;
  final NetworkInfo networkInfo;

	FeatureRepositoryImpl({
    required this.featureLocalDataSource,
    required this.networkInfo,
    required this.featureRemoteDataSource,
  });

  @override
  Future<(Failure?, List<ProductEntity>?)> getAllProducts(int page) async {
    return await _getProduct(() => featureRemoteDataSource.getAllProducts(page));
  }

  @override
  Future<(Failure?, List<ProductEntity>?)> searchProduct(int id) async {
    return await _getProduct(() => featureRemoteDataSource.searchProduct(id));
  }

  Future<(Failure?, List<ProductEntity>?)> _getProduct(Future<List<ProductEntity>> Function() getProducts) async {
    if(await networkInfo.isConnected){
      try {
        final remoteProduct = await getProducts();
        // сохранить в кеш
        return (null, remoteProduct);
      } on ServerException {
        return (ServerFailure(), null);
      }
    } else {
      try {
        final localProduct = await getProducts();
        return (null, localProduct);
      } on ServerException {
        return (CacheFailure(), null);
      }
    }
  }

  @override
  bool isBusy() {
    return false;
  }


}
