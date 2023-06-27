
import 'dart:async';

import 'package:furniture_store/core/error/failure.dart';
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:furniture_store/domain/repositories/repositories.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'main_bloc.freezed.dart';

@injectable
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

@freezed
class MainBlocState with _$MainBlocState{
  const factory MainBlocState.loading() = _loadingState;
  const factory MainBlocState.loaded({required MainModel model}) = _loadedState;
  const factory MainBlocState.error() = _errorState;
  const factory MainBlocState.timeOut() = _timeOut;
}

@freezed
class MainBlocEvent with _$MainBlocEvent{
  const factory MainBlocEvent.init({Completer? completer}) = _initEvent;
  const factory MainBlocEvent.getAllProducts({required int page, Completer? completer}) = _getAllProductsEvent;
  const factory MainBlocEvent.searchProduct({required int id, Completer? completer}) = _searchProductEvent;
}

@injectable
class MainBloc {
  final FeatureRepository featureRepository;

  MainModel mainModel = const MainModel(
    timeOut: false,
    lpAll: [],
    lpSingle: [],
    e: '',
    error: false,
  );

  final StreamController<MainBlocEvent> _eventsController = StreamController();
  final StreamController<MainBlocState> _stateController = StreamController.broadcast();

  Stream<MainBlocState> get state => _stateController.stream;

  MainBloc({
    required this.featureRepository,
  }) {
    _eventsController.stream.listen((event) {
      event.map<void>(
          init: (value) async {
            final completer = value.completer;
            _stateController.add(const MainBlocState.loading());
            await _getAllProducts(0);
            if (mainModel.isTimeOut){
              _stateController.add(const MainBlocState.timeOut());
            } else if (mainModel.isError){
              _stateController.add(const MainBlocState.error());
            } else {
              _stateController.add(MainBlocState.loaded(model: mainModel));
            }
            if(completer!=null)completer.complete();
          },
          getAllProducts: (value) async {
            final completer = value.completer;
            if(featureRepository.isBusy()) return;
            //_stateController.add(const MainBlocState.loading());
            await _getAllProducts(value.page);
            if (mainModel.isTimeOut){
              _stateController.add(const MainBlocState.timeOut());
            } else if (mainModel.isError){
              _stateController.add(const MainBlocState.error());
            } else {
              _stateController.add(MainBlocState.loaded(model: mainModel));
            }
            if(completer!=null)completer.complete();
          },
          searchProduct: ( value) async {
            final completer = value.completer;
            if(featureRepository.isBusy()) return;
            //_stateController.add(const MainBlocState.loading());
            await _searchProduct(value.id);
            if (mainModel.isTimeOut){
              _stateController.add(const MainBlocState.timeOut());
            } else if (mainModel.isError){
              _stateController.add(const MainBlocState.error());
            } else {
              _stateController.add(MainBlocState.loaded(model: mainModel));
            }
            if(completer!=null)completer.complete();
          }
      );
    });
  }


  void add(MainBlocEvent event){
    if(_eventsController.isClosed) return;
    _eventsController.add(event);
  }

  void dispose(){
    _eventsController.close();
    _stateController.close();
  }

  Future<void> _getAllProducts(int page) async {
    var(Failure? e , List<ProductEntity>? lp, bool timeOut) = await _getProduct(() => featureRepository.getAllProducts(page));
    if(lp!=null){mainModel = mainModel.copyWith(error: false, timeOut: false,   e: '', lpAll: lp,); return;}
    if(e !=null){mainModel = mainModel.copyWith(error: true,  timeOut: timeOut,e: e.runtimeType.toString());
    return;
    }
  }

  Future<void> _searchProduct(int id) async {
    var(Failure? e , List<ProductEntity>? lp, bool timeOut) = await _getProduct(() => featureRepository.searchProduct(id));
    if(lp!=null){mainModel = mainModel.copyWith(error: false, timeOut: false,   e: '', lpSingle: lp,);return;}
    if(e!=null){mainModel = mainModel.copyWith(error: true,  timeOut: timeOut,e: e.runtimeType.toString());
    return;
    }
  }

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