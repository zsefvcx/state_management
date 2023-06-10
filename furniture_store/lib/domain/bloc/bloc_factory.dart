import 'package:furniture_store/data/service_provider.dart';
import 'package:get_it/get_it.dart';

class BlocFactory {
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  static final instance = BlocFactory();

  void initialize(){
    ServiceProvider.instance.initialize();
    // _getIt.registerLazySingleton<MainBloc>(
    //       () => MainBloc(
    //     abstractClassIncrement:  ServiceProvider.instance.get<AbstractClassIncrement>(),
    //   ),
    // );
  }


}