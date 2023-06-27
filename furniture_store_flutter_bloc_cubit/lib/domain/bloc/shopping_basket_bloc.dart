
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

@injectable
class ShoppingBasketBloc  extends BlocBase<ShoppingBasketBlocState>{

  final ShoppingBasketRepository _shoppingBasketRepository;

  ShoppingBasketModel model = const ShoppingBasketModel(model: {});

  ShoppingBasketBloc({
    required ShoppingBasketRepository shoppingBasketRepository,
  }) : _shoppingBasketRepository= shoppingBasketRepository, super(const ShoppingBasketBlocState.loading());

  Future<void> init() async {
    emit(const ShoppingBasketBlocState.loading());
    await _init0().whenComplete(() =>
        emit(ShoppingBasketBlocState.loaded(model: model)));
  }

  Future<void> addBas({required int id}) async {
    if (_shoppingBasketRepository.isBusy()) return;
    await _addBas0(id).whenComplete(() =>
        emit(ShoppingBasketBlocState.loaded(model: model)));
  }

  Future<void> remBas({required int id}) async {
    if (_shoppingBasketRepository.isBusy()) return;
    await _remBas0(id).whenComplete(() =>
        emit(ShoppingBasketBlocState.loaded(model: model)));
  }

  Future<void> remAll() async {
    if (_shoppingBasketRepository.isBusy()) return;
    await _remAll0().whenComplete(() =>
        emit(ShoppingBasketBlocState.loaded(model: model)));
  }

  Future<void> setCountBas({required int id, required int value}) async {
    if (_shoppingBasketRepository.isBusy()) return;
    await _setCountBas0(id, value).whenComplete(() =>
        emit(ShoppingBasketBlocState.loaded(model: model)));
  }


    Future<void> _init0() async {
      model = model.copyWith(model: await _shoppingBasketRepository.bas());
    }

    Future<void> _addBas0(int id)  async {
      await _shoppingBasketRepository.add(id);
      model = model.copyWith(model: await _shoppingBasketRepository.bas());
    }

    Future<void> _remBas0(int id) async {
      await _shoppingBasketRepository.rem(id);
      model = model.copyWith(model: await _shoppingBasketRepository.bas());
    }

    Future<void> _remAll0() async {
      await _shoppingBasketRepository.remAll();
      model = model.copyWith(model: await _shoppingBasketRepository.bas());
    }

    Future<void> _setCountBas0(int id, int value) async {
      await _shoppingBasketRepository.setCountBas(id, value);
      model = model.copyWith(model: await _shoppingBasketRepository.bas());
    }
}