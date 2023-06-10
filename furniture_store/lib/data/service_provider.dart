

import 'package:furniture_store/data/datasources/remote/feature_remote_data_source_impl.dart';
import 'package:furniture_store/data/repositories/feature_repository_impl.dart';
import 'package:furniture_store/domain/repositories/feature_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../core/platform/network_info.dart';
import 'datasources/local/feature_local_data_source.dart';
import 'datasources/local/feature_local_data_source_impl.dart';
import 'datasources/remote/feature_remote_data_source.dart';

class ServiceProvider{
  static final _getIt = GetIt.I;

  final FeatureRemoteDataSource featureRemoteDataSource = FeatureRemoteDataSourceImpl();
  final FeatureLocalDataSource featureLocalDataSource = FeatureLocalDataSourceImpl();
  final NetworkInfo networkInfo = NetworkInfoImp(internetConnectionChecker: InternetConnectionChecker());

  T get<T extends Object>() => _getIt.get<T>();

  static final instance = ServiceProvider();

  void initialize(){
    _getIt.registerLazySingleton<FeatureRepository>(
          () => FeatureRepositoryImpl(networkInfo: networkInfo,
            featureLocalDataSource: featureLocalDataSource,
            featureRemoteDataSource: featureRemoteDataSource,
          ),
    );
  }
}