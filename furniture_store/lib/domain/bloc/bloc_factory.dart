import 'package:furniture_store/data/service_provider.dart';
import 'package:furniture_store/domain/bloc/main_bloc.dart';
import 'package:furniture_store/domain/repositories/feature_repository.dart';
import 'package:get_it/get_it.dart';

class BlocFactory {
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  static final instance = BlocFactory();

  void initialize(){
    ServiceProvider.instance.initialize();
    _getIt.registerLazySingleton<MainBloc>(
          () => MainBloc(
        featureRepository:  ServiceProvider.instance.get<FeatureRepository>(),
      ),
    );
  }


}