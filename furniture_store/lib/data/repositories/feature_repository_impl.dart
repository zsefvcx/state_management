import 'package:furniture_store/core/core.dart';
import 'package:furniture_store/core/error/exception.dart';
import 'package:furniture_store/data/datasources/local/feature_local_data_source.dart';
import 'package:furniture_store/data/datasources/remote/feature_remote_data_source.dart';
import 'package:furniture_store/domain/entities/product.dart';
import 'package:furniture_store/domain/repositories/feature_repository.dart';

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
    return await _getPersons(() => featureRemoteDataSource.getAllProducts(page));
  }

  @override
  Future<(Failure?, List<ProductEntity>?)> searchProduct(int id) async {
    return await _getPersons(() => featureRemoteDataSource.searchProduct(id));
  }

  Future<(Failure?, List<ProductEntity>?)> _getPersons(Future<List<ProductEntity>> Function() getPersons) async {
    if(await networkInfo.isConnected){
      try {
        final remoteProduct = await getPersons();
        // сохранить в кеш
        return (null, remoteProduct);
      } on ServerException {
        return (ServerFailure(), null);
      }
    } else {
      try {
        final localProduct = await getPersons();
        return (null, localProduct);
      } on ServerException {
        return (CacheFailure(), null);
      }
    }
  }


}
