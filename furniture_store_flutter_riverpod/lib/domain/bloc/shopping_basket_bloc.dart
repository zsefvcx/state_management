
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:furniture_store/domain/repositories/repositories.dart';

class ShoppingBasket{

  Set<ShoppingBasketEntity> model;

  void updateState(Set<ShoppingBasketEntity> data){

  }

  ShoppingBasket(this.model);
}


class ShoppingBasketBloc extends StateNotifier<ShoppingBasket>{

  final ShoppingBasketRepository _shoppingBasketRepository;


  ShoppingBasketBloc({
    required ShoppingBasketRepository shoppingBasketRepository,
  }) : _shoppingBasketRepository= shoppingBasketRepository, super(ShoppingBasket({})){
    bas();
  }

  Future<void> bas() async {
    state.model = await _shoppingBasketRepository.bas();
  }

  bool statusBas(int id) => _shoppingBasketRepository.status(id);

  Future<void> addBas(int id) async {
    await _shoppingBasketRepository.add(id);
    await bas();
  }

  Future<void> remBas(int id) async {
    await _shoppingBasketRepository.rem(id);
    await bas();
  }

  Future<void> setCountBas(int id, int value) async {
    await _shoppingBasketRepository.setCountBas(id, value);
    await bas();
  }

  Future<void> remAll() async {
    await _shoppingBasketRepository.remAll();
    await bas();
  }

  int getCountBas(int id) => _shoppingBasketRepository.getCountBas(id);

}