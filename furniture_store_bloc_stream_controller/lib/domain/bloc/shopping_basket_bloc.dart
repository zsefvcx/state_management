
import 'dart:async';

import 'package:flutter/foundation.dart';
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
class ShoppingBasketBloc{

  final ShoppingBasketRepository _shoppingBasketRepository;

  ShoppingBasketModel model = const ShoppingBasketModel(model: {});

  final StreamController<ShoppingBasketBlocEvent> _eventsController = StreamController();
  final StreamController<ShoppingBasketBlocState> _stateController = StreamController.broadcast();

  Stream<ShoppingBasketBlocState> get state => _stateController.stream;


  ShoppingBasketBloc({
    required ShoppingBasketRepository shoppingBasketRepository,
  }) : _shoppingBasketRepository= shoppingBasketRepository{
    _eventsController.stream.listen((event) {
      event.map<void>(
        init: (_) async {
          _stateController.add(const ShoppingBasketBlocState.loading());
          _stateController.add(ShoppingBasketBlocState.loaded(
            model: model = model.copyWith(model: await _shoppingBasketRepository.bas()),
          ));
        },
        addBas: (value) async {
        if(_shoppingBasketRepository.isBusy()) return;
        await _shoppingBasketRepository.add(value.id);
        _stateController.add(ShoppingBasketBlocState.loaded(
          model: model = model.copyWith(model: await _shoppingBasketRepository.bas()),
        ));
        },
        remBas: (value) async {
          if(_shoppingBasketRepository.isBusy()) return;
          await _shoppingBasketRepository.rem(value.id);
          _stateController.add(ShoppingBasketBlocState.loaded(
            model: model = model.copyWith(model: await _shoppingBasketRepository.bas()),
          ));
        },
        remAll: (_remAllEvent value) async {
          if(_shoppingBasketRepository.isBusy()) return;
          await _shoppingBasketRepository.remAll();
          _stateController.add(ShoppingBasketBlocState.loaded(
              model: model = model.copyWith(model: await _shoppingBasketRepository.bas()),
          ));
        }, setCountBas: (_setCountBas value) async {
          if(_shoppingBasketRepository.isBusy()) return;
          await _shoppingBasketRepository.setCountBas(value.id, value.value);
          _stateController.add(ShoppingBasketBlocState.loaded(
              model: model = model.copyWith(model: await _shoppingBasketRepository.bas()),
          ));
        },
    );
  });
}

  void add(ShoppingBasketBlocEvent event){
    if(_eventsController.isClosed) return;
    _eventsController.add(event);
  }

  void dispose(){
    _eventsController.close();
    _stateController.close();
  }

}
