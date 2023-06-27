
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
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

@injectable
class MainBloc extends BlocBase<MainBlocState>{
  final FeatureRepository featureRepository;

  MainModel mainModel = const MainModel(
    timeOut: false,
    lpAll: [],
    lpSingle: [],
    e: '',
    error: false,
  );

  MainBloc({
    required this.featureRepository,
  }) : super(const MainBlocState.loading());

  Future<void> init() async {
    emit(const MainBlocState.loading());
    await _getAllProducts0(0).whenComplete(() {
      if (mainModel.isTimeOut) {
        emit(const MainBlocState.timeOut());
      } else if (mainModel.isError) {
        emit(const MainBlocState.error());
      } else {
        emit(MainBlocState.loaded(model: mainModel));
      }
    });
  }

  Future<void> getAllProducts({required int page}) async {
    if (featureRepository.isBusy()) return;
    //emit(const MainBlocState.loading());
    await _getAllProducts0(page).whenComplete(() {
      if (mainModel.isTimeOut) {
        emit(const MainBlocState.timeOut());
      } else if (mainModel.isError) {
        emit(const MainBlocState.error());
      } else {
        emit(MainBlocState.loaded(model: mainModel));
      }
    });
  }

  Future<void> searchProduct({required int page}) async {
    if (featureRepository.isBusy()) return;
    //emit(const MainBlocState.loading());
    await _searchProduct0(page).whenComplete(() {
      if (mainModel.isTimeOut) {
        emit(const MainBlocState.timeOut());
      } else if (mainModel.isError) {
        emit(const MainBlocState.error());
      } else {
        emit(MainBlocState.loaded(model: mainModel));
      }
    });
  }

  Future<void> _getAllProducts0(int page) async {
    var(Failure? e , List<ProductEntity>? lp, bool timeOut) = await _getProduct(() => featureRepository.getAllProducts(page));
    if(lp!=null){mainModel = mainModel.copyWith(error: false, timeOut: false,   e: '', lpAll: lp,); return;}
    if(e !=null){mainModel = mainModel.copyWith(error: true,  timeOut: timeOut,e: e.runtimeType.toString());
    return;
    }
  }

  Future<void> _searchProduct0(int id) async {
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