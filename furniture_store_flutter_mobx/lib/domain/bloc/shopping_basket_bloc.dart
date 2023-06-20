
import 'package:furniture_store/domain/bloc/bloc.dart';
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:furniture_store/domain/repositories/repositories.dart';

class ShoppingBasketBloc {

  final ShoppingBasketRepository _shoppingBasketRepository;

  Set<ShoppingBasketEntity> model = {};

  ShoppingBasketBloc({
    required ShoppingBasketRepository shoppingBasketRepository,
  }) : _shoppingBasketRepository= shoppingBasketRepository{
    init();
  }


  Future<void> init() async {
    model = await _shoppingBasketRepository.bas();
  }


  bool status(int id) => _shoppingBasketRepository.status(id);


  Future<void> addSingle(int id) async {
    await _shoppingBasketRepository.add(id);
    await init();
  }


  Future<void> remSingle(int id) async {
    await _shoppingBasketRepository.rem(id);
    await init();
  }

  Future<void> setCount(int id, int value) async {
    await _shoppingBasketRepository.setCountBas(id, value);
    await init();
  }

  Future<void> remAll() async {
    await _shoppingBasketRepository.remAll();
    await init();
  }


  int getCount(int id) => _shoppingBasketRepository.getCountBas(id);

}