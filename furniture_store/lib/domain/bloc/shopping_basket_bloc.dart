

import 'package:flutter/material.dart';
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:furniture_store/domain/repositories/repositories.dart';


class ShoppingBasketBloc  with ChangeNotifier{

  final ShoppingBasketRepository _shoppingBasketRepository;

  Set<ShoppingBasketEntity> favoritesModel = {};

  ShoppingBasketBloc({
    required ShoppingBasketRepository shoppingBasketRepository,
  }) : _shoppingBasketRepository= shoppingBasketRepository{
    bas();
  }

  Future<void> bas() async {
    favoritesModel = await _shoppingBasketRepository.bas();
    notifyListeners();
  }

  bool statusBas(int id) => _shoppingBasketRepository.status(id);

  Future<void> addBas(int id) async {
    await _shoppingBasketRepository.add(id);
    notifyListeners();
  }

  Future<void> remBas(int id) async {
    await _shoppingBasketRepository.rem(id);
    notifyListeners();
  }

  Future<void> setCountBas(int id, int value) async {
    await _shoppingBasketRepository.setCountBas(id, value);
    notifyListeners();
  }

  int getCountBas(int id) => _shoppingBasketRepository.getCountBas(id);

}