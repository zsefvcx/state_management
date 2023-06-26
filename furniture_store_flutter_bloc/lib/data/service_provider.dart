
import 'package:furniture_store/core/core.dart';
import 'package:furniture_store/data/datasources/data_source.dart';
import 'package:furniture_store/data/repositories/repositories.dart';
import 'package:furniture_store/domain/repositories/repositories.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';


class ServiceProvider{
  static final _getIt = GetIt.I;

  final FeatureRemoteDataSource featureRemoteData = FeatureRemoteDataSourceImpl();
  final FeatureLocalDataSource featureLocalData = FeatureLocalDataSourceImpl();
  final FeatureFavoritesDataSource featureFavoritesData = FeatureFavoritesDataSourceImp();
  final FeatureShoppingBasketDataSource featureShoppingBasketData = FeatureShoppingBasketDataSourceImp();
  final NetworkInfo networkInfo = NetworkInfoImp(internetConnectionChecker: InternetConnectionChecker());


  T get<T extends Object>() => _getIt.get<T>();

  static final instance = ServiceProvider();

  void initialize(){
    _getIt.registerLazySingleton<FeatureRepository>(
          () => FeatureRepositoryImpl(networkInfo: networkInfo,
            featureLocalDataSource: featureLocalData,
            featureRemoteDataSource: featureRemoteData,
          ),
    );
    _getIt.registerLazySingleton<FavoritesRepository>(
          () => FavoritesRepositoryImpl(featureFavoritesDataSource: featureFavoritesData),
    );
    _getIt.registerLazySingleton<ShoppingBasketRepository>(
          () => ShoppingBasketRepositoryImpl(featureShoppingBasketDataSource: featureShoppingBasketData),
    );
  }
}