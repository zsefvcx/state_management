
import 'package:furniture_store/core/error/failure.dart';
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:furniture_store/domain/repositories/repositories.dart';

import 'package:mobx/mobx.dart';

part 'main_bloc.g.dart';

class MainBloc = MainBlocBase with _$MainBloc;

class MainModel {

  final bool timeOut;
  final List<ProductEntity> lpAll;
  final List<ProductEntity> lpSingle;
  final bool error;
  final String e;

  bool get isLoaded => lpAll.isNotEmpty;
  bool get isTimeOut => timeOut;
  bool get isLoadedSingle => lpSingle.isNotEmpty;
  bool get isError => error;

  const MainModel({
    required this.lpAll,
    required this.lpSingle,
    required this.e,
    required this.timeOut,
    required this.error,
  });

  MainModel copyWith({
    List<ProductEntity>? lpAll,
    List<ProductEntity>? lpSingle,
    String? e,
    bool? timeOut,
    bool? error,
  }){
    return MainModel(
      lpAll: lpAll ?? this.lpAll,
      lpSingle: lpSingle ?? this.lpSingle,
      e: e ?? this.e,
      timeOut: timeOut ?? this.timeOut,
      error: error ?? this.error,
    );
  }
}

abstract class MainBlocBase with Store {
  @observable
  FeatureRepository featureRepository;

  @observable
  MainModel mainModel = const MainModel(
      timeOut: false,
      lpAll: [],
      lpSingle: [],
      e: '',
      error: false,
  );

  MainBlocBase({
    required this.featureRepository,
  }) {
    getAllProducts(0);
  }

  @action
  Future<void> getAllProducts(int page) async {
    var(Failure? e , List<ProductEntity>? lp, bool timeOut) = await _getProduct(() => featureRepository.getAllProducts(page));
    if(lp!=null){mainModel = mainModel.copyWith(error: false, timeOut: false,   e: '', lpAll: lp,);return;}
    if(e !=null){mainModel = mainModel.copyWith(error: true,  timeOut: timeOut,e: e.runtimeType.toString());
      return;
    }
  }

  @action
  Future<void> searchProduct(int id) async {
    var(Failure? e , List<ProductEntity>? lp, bool timeOut) = await _getProduct(() => featureRepository.searchProduct(id));
    if(lp!=null){mainModel = mainModel.copyWith(error: false, timeOut: false,   e: '', lpSingle: lp,);return;}
    if(e!=null){mainModel = mainModel.copyWith(error: true,  timeOut: timeOut,e: e.runtimeType.toString());
      return;
    }
  }

  @action
  Future<(Failure?, List<ProductEntity>?, bool)> _getProduct(Future<(Failure?, List<ProductEntity>?)> Function() getProducts) async {
    try {
      mainModel = mainModel.copyWith(e: '', timeOut: false, error: false, lpSingle: [], lpAll: []);
      bool timeOut = false;
      var (Failure? e, List<ProductEntity>? lp) = await getProducts()
         .timeout(const Duration(seconds: 5),
           onTimeout: () {
             timeOut  = true;
             return ( MainBlocFailure(),  null);
           });

      if (lp != null) {
        return (null, lp, false);
      }
      if (e != null) {
        return (e, null, timeOut);
      }
    } catch (e){//все ошибки отловим
      //что то тут сделаем но потом...
      return ( MainBlocFailure(),  null, false);
    }
    return (null ,null, false);//что то пошло не так
  }

}