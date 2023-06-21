
import 'package:flutter/foundation.dart';
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:furniture_store/domain/repositories/repositories.dart';

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


class ShoppingBasketBloc with ChangeNotifier{

  final ShoppingBasketRepository _shoppingBasketRepository;

  ShoppingBasketModel model = const ShoppingBasketModel(model: {});

  ShoppingBasketBloc({
    required ShoppingBasketRepository shoppingBasketRepository,
  }) : _shoppingBasketRepository= shoppingBasketRepository{
    bas();
  }

  Future<void> bas() async {
    var model = await _shoppingBasketRepository.bas();
    this.model = this.model.copyWith(model: model);
    notifyListeners();
  }

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
}