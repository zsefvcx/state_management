// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_bloc.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainBloc on MainBlocBase, Store {
  late final _$featureRepositoryAtom =
      Atom(name: 'MainBlocBase.featureRepository', context: context);

  @override
  FeatureRepository get featureRepository {
    _$featureRepositoryAtom.reportRead();
    return super.featureRepository;
  }

  @override
  set featureRepository(FeatureRepository value) {
    _$featureRepositoryAtom.reportWrite(value, super.featureRepository, () {
      super.featureRepository = value;
    });
  }

  late final _$mainModelAtom =
      Atom(name: 'MainBlocBase.mainModel', context: context);

  @override
  MainModel get mainModel {
    _$mainModelAtom.reportRead();
    return super.mainModel;
  }

  @override
  set mainModel(MainModel value) {
    _$mainModelAtom.reportWrite(value, super.mainModel, () {
      super.mainModel = value;
    });
  }

  late final _$getAllProductsAsyncAction =
      AsyncAction('MainBlocBase.getAllProducts', context: context);

  @override
  Future<void> getAllProducts(int page) {
    return _$getAllProductsAsyncAction.run(() => super.getAllProducts(page));
  }

  late final _$searchProductAsyncAction =
      AsyncAction('MainBlocBase.searchProduct', context: context);

  @override
  Future<void> searchProduct(int id) {
    return _$searchProductAsyncAction.run(() => super.searchProduct(id));
  }

  late final _$_getProductAsyncAction =
      AsyncAction('MainBlocBase._getProduct', context: context);

  @override
  Future<(Failure?, List<ProductEntity>?, bool)> _getProduct(
      Future<(Failure?, List<ProductEntity>?)> Function() getProducts) {
    return _$_getProductAsyncAction.run(() => super._getProduct(getProducts));
  }

  @override
  String toString() {
    return '''
featureRepository: ${featureRepository},
mainModel: ${mainModel}
    ''';
  }
}
