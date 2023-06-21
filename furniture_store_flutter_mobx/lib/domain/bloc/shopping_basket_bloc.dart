
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:furniture_store/domain/repositories/repositories.dart';

import 'package:mobx/mobx.dart';

part 'shopping_basket_bloc.g.dart';

class ShoppingBasketBloc = ShoppingBasketBlocBase with _$ShoppingBasketBloc;

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

abstract class ShoppingBasketBlocBase with Store {

  @observable
  ShoppingBasketRepository shoppingBasketRepository;

  @observable
  ShoppingBasketModel model = const ShoppingBasketModel(model: {});

  ShoppingBasketBlocBase({
    required this.shoppingBasketRepository,
  }) {
    init();
  }

  Future<void> init() async {
    model = model.copyWith(model: await shoppingBasketRepository.bas());
  }

  @action
  Future<void> addSingle(int id) async {
    await shoppingBasketRepository.add(id);
    await init();
  }

  @action
  Future<void> remSingle(int id) async {
    await shoppingBasketRepository.rem(id);
    await init();
  }

  @action
  Future<void> setCount(int id, int value) async {
    await shoppingBasketRepository.setCountBas(id, value);
    await init();
  }

  @action
  Future<void> remAll() async {
    await shoppingBasketRepository.remAll();
    await init();
  }

}