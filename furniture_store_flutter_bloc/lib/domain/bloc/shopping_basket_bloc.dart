
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:furniture_store/domain/repositories/repositories.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'shopping_basket_bloc.freezed.dart';

@injectable
class ShoppingBasketModel {
  final Map<int, ShoppingBasketEntity> model;

  const ShoppingBasketModel({
    required this.model,
  });

  bool getStatus({required int id}) => model[id]!=null?true:false;
  int  getCount({required int id}) {
    var m = model[id];
    return m!=null?m.count:0;
  }
  int get getAllCount => model.values.fold(0, (p, e) => p + e.count);
  int get getLength => model.length;
  List<ShoppingBasketEntity> get getList => model.values.toList();

  ShoppingBasketModel copyWith({
    required Map<int, ShoppingBasketEntity>? model,
  }){
    return ShoppingBasketModel(
      model: model ?? this.model,
    );
  }
}

@freezed
class ShoppingBasketBlocState with _$ShoppingBasketBlocState{
  const factory ShoppingBasketBlocState.loading() = _loadingState;
  const factory ShoppingBasketBlocState.loaded({required ShoppingBasketModel model}) = _loadedState;
}

@freezed
class ShoppingBasketBlocEvent with _$ShoppingBasketBlocEvent{
  const factory ShoppingBasketBlocEvent.init() = _initEvent;
  const factory ShoppingBasketBlocEvent.remAll() = _remAllEvent;
  const factory ShoppingBasketBlocEvent.addBas({required int id}) = _addBasSetEvent;
  const factory ShoppingBasketBlocEvent.remBas({required int id}) = _remBasSetEvent;
  const factory ShoppingBasketBlocEvent.setCountBas({required int id, required , required int value}) = _setCountBas;
}

@injectable
class ShoppingBasketBloc  extends Bloc<ShoppingBasketBlocEvent, ShoppingBasketBlocState>{

  final ShoppingBasketRepository _shoppingBasketRepository;

  ShoppingBasketModel model = const ShoppingBasketModel(model: {});

  ShoppingBasketBloc({
    required ShoppingBasketRepository shoppingBasketRepository,
  }) : _shoppingBasketRepository= shoppingBasketRepository, super(const ShoppingBasketBlocState.loading())
  {
    on<ShoppingBasketBlocEvent>((event, emit) async {
      await event.map<FutureOr<void>>(
        init: (_) async {
          emit(const ShoppingBasketBlocState.loading());
          await _init().whenComplete(() =>
              emit(ShoppingBasketBlocState.loaded(model: model = model)));
        },
        addBas: (value) async {
        if(_shoppingBasketRepository.isBusy()) return;
        await _addBas(value.id).whenComplete(() =>
            emit(ShoppingBasketBlocState.loaded(model: model)));
        },
        remBas: (value) async {
          if(_shoppingBasketRepository.isBusy()) return;
          await _remBas(value.id).whenComplete(() =>
              emit(ShoppingBasketBlocState.loaded(model: model)));
        },
        remAll: (_) async {
          if(_shoppingBasketRepository.isBusy()) return;
          await _remAll().whenComplete(() =>
              emit(ShoppingBasketBlocState.loaded(model: model)));
        },
        setCountBas: (value) async {
          if(_shoppingBasketRepository.isBusy()) return;
          await _setCountBas(value.id, value.value).whenComplete(() =>
              emit(ShoppingBasketBlocState.loaded(model: model)));
        },
    );
  });
  }

    Future<void> _init() async {
      model = model.copyWith(model: await _shoppingBasketRepository.bas());
    }

    Future<void> _addBas(int id)  async {
      await _shoppingBasketRepository.add(id);
      model = model.copyWith(model: await _shoppingBasketRepository.bas());
    }

    Future<void> _remBas(int id) async {
      await _shoppingBasketRepository.rem(id);
      model = model.copyWith(model: await _shoppingBasketRepository.bas());
    }

    Future<void> _remAll() async {
      await _shoppingBasketRepository.remAll();
      model = model.copyWith(model: await _shoppingBasketRepository.bas());
    }

    Future<void> _setCountBas(int id, int value) async {
      await _shoppingBasketRepository.setCountBas(id, value);
      model = model.copyWith(model: await _shoppingBasketRepository.bas());
    }
}