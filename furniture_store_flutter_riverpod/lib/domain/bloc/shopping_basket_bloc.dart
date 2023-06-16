
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:furniture_store/domain/repositories/repositories.dart';

class ShoppingBasketBloc {

  final ShoppingBasketRepository _shoppingBasketRepository;

  Set<ShoppingBasketEntity> model = {};

  ShoppingBasketBloc({
    required ShoppingBasketRepository shoppingBasketRepository,
  }) : _shoppingBasketRepository= shoppingBasketRepository{
    bas();
  }

  Future<void> bas() async {
    model = await _shoppingBasketRepository.bas();
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