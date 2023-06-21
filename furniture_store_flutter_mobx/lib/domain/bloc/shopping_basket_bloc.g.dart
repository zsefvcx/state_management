// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_basket_bloc.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ShoppingBasketBloc on ShoppingBasketBlocBase, Store {
  late final _$shoppingBasketRepositoryAtom = Atom(
      name: 'ShoppingBasketBlocBase.shoppingBasketRepository',
      context: context);

  @override
  ShoppingBasketRepository get shoppingBasketRepository {
    _$shoppingBasketRepositoryAtom.reportRead();
    return super.shoppingBasketRepository;
  }

  @override
  set shoppingBasketRepository(ShoppingBasketRepository value) {
    _$shoppingBasketRepositoryAtom
        .reportWrite(value, super.shoppingBasketRepository, () {
      super.shoppingBasketRepository = value;
    });
  }

  late final _$modelAtom =
      Atom(name: 'ShoppingBasketBlocBase.model', context: context);

  @override
  ShoppingBasketModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(ShoppingBasketModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$addSingleAsyncAction =
      AsyncAction('ShoppingBasketBlocBase.addSingle', context: context);

  @override
  Future<void> addSingle(int id) {
    return _$addSingleAsyncAction.run(() => super.addSingle(id));
  }

  late final _$remSingleAsyncAction =
      AsyncAction('ShoppingBasketBlocBase.remSingle', context: context);

  @override
  Future<void> remSingle(int id) {
    return _$remSingleAsyncAction.run(() => super.remSingle(id));
  }

  late final _$setCountAsyncAction =
      AsyncAction('ShoppingBasketBlocBase.setCount', context: context);

  @override
  Future<void> setCount(int id, int value) {
    return _$setCountAsyncAction.run(() => super.setCount(id, value));
  }

  late final _$remAllAsyncAction =
      AsyncAction('ShoppingBasketBlocBase.remAll', context: context);

  @override
  Future<void> remAll() {
    return _$remAllAsyncAction.run(() => super.remAll());
  }

  @override
  String toString() {
    return '''
shoppingBasketRepository: ${shoppingBasketRepository},
model: ${model}
    ''';
  }
}
