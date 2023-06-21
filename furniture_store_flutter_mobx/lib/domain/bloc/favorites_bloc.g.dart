// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_bloc.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoritesBloc on FavoritesBlocBase, Store {
  late final _$favoritesRepositoryAtom =
      Atom(name: 'FavoritesBlocBase.favoritesRepository', context: context);

  @override
  FavoritesRepository get favoritesRepository {
    _$favoritesRepositoryAtom.reportRead();
    return super.favoritesRepository;
  }

  @override
  set favoritesRepository(FavoritesRepository value) {
    _$favoritesRepositoryAtom.reportWrite(value, super.favoritesRepository, () {
      super.favoritesRepository = value;
    });
  }

  late final _$modelAtom =
      Atom(name: 'FavoritesBlocBase.model', context: context);

  @override
  MapFavoritesModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(MapFavoritesModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('FavoritesBlocBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$addSingleAsyncAction =
      AsyncAction('FavoritesBlocBase.addSingle', context: context);

  @override
  Future<void> addSingle(int id) {
    return _$addSingleAsyncAction.run(() => super.addSingle(id));
  }

  late final _$remSingleAsyncAction =
      AsyncAction('FavoritesBlocBase.remSingle', context: context);

  @override
  Future<void> remSingle(int id) {
    return _$remSingleAsyncAction.run(() => super.remSingle(id));
  }

  @override
  String toString() {
    return '''
favoritesRepository: ${favoritesRepository},
model: ${model}
    ''';
  }
}
