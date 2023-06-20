
import 'package:furniture_store/domain/bloc/bloc.dart';
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:furniture_store/domain/repositories/repositories.dart';

class ShoppingBasketBloc  extends MyBloc<ShoppingBasketEntity>{

  final ShoppingBasketRepository _shoppingBasketRepository;

  ShoppingBasketBloc({
    required ShoppingBasketRepository shoppingBasketRepository,
  }) : _shoppingBasketRepository= shoppingBasketRepository{
    bas();
  }

  Future<void> bas() async {
    model = await _shoppingBasketRepository.bas();
    notifyListeners();
  }

  bool statusBas(int id) => _shoppingBasketRepository.status(id);

  Future<void> addBas(int id) async {
    await _shoppingBasketRepository.add(id);
    await bas();
    notifyListeners();
  }

  Future<void> remBas(int id) async {
    await _shoppingBasketRepository.rem(id);
    await bas();
    notifyListeners();
  }

  Future<void> setCountBas(int id, int value) async {
    await _shoppingBasketRepository.setCountBas(id, value);
    await bas();
    notifyListeners();
  }

  Future<void> remAll() async {
    await _shoppingBasketRepository.remAll();
    await bas();
    notifyListeners();
  }

  int getCountBas(int id) => _shoppingBasketRepository.getCountBas(id);

}