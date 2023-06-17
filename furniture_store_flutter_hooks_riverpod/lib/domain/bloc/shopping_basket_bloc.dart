
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:furniture_store/domain/repositories/repositories.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ShoppingBasket{

  final Map<int, ShoppingBasketEntity> model;

  const ShoppingBasket({required this.model});

  bool statusBas(int id) => model[id]!=null;

  ShoppingBasket copyWith({
    Map<int, ShoppingBasketEntity>? model,
  }) {
    return ShoppingBasket(
      model: model ?? this.model,
    );
  }
}


class ShoppingBasketBloc extends StateNotifier<ShoppingBasket>{

  final ShoppingBasketRepository _shoppingBasketRepository;


  ShoppingBasketBloc({
    required ShoppingBasketRepository shoppingBasketRepository,
  }) : _shoppingBasketRepository= shoppingBasketRepository, super(const ShoppingBasket(model: {})){
    bas();
  }

  Future<void> bas() async {
    Map<int, ShoppingBasketEntity> data = await _shoppingBasketRepository.bas();
    state = state.copyWith(model: data);
  }

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