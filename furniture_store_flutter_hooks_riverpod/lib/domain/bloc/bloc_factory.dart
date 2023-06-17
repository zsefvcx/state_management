import 'package:furniture_store/data/service_provider.dart';
import 'package:furniture_store/domain/bloc/favorites_bloc.dart';
import 'package:furniture_store/domain/bloc/main_bloc.dart';
import 'package:furniture_store/domain/bloc/shopping_basket_bloc.dart';
import 'package:furniture_store/domain/repositories/repositories.dart';
import 'package:get_it/get_it.dart';

class BlocFactory {
  static final _getIt = GetIt.I;

  static bool _statusInit = false;


  T get<T extends Object>() => _getIt.get<T>();

  static final instance = BlocFactory();

  void initialize(){
    if (_statusInit == true) return;

    ServiceProvider.instance.initialize();

    _getIt.registerLazySingleton<MainBloc>(
          () => MainBloc(
        featureRepository:  ServiceProvider.instance.get<FeatureRepository>(),
      ),
    );

    _getIt.registerLazySingleton<FavoritesBloc>(
          () => FavoritesBloc(
        favoritesRepository: ServiceProvider.instance.get<FavoritesRepository>(),
      ),
    );

    _getIt.registerLazySingleton<ShoppingBasketBloc>(
          () => ShoppingBasketBloc(
        shoppingBasketRepository: ServiceProvider.instance.get<ShoppingBasketRepository>(),
      ),
    );

    _statusInit = true;
  }


}