
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store/data/models/favorites_model.dart';
import 'package:furniture_store/domain/repositories/repositories.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'favorites_bloc.freezed.dart';

@injectable
class MapFavoritesModel {
  final Map<int, FavoritesModel> model;

  const MapFavoritesModel({
    required this.model,
  });

  bool getStatus({required int id}) => model[id]!=null?true:false;
  int getLength() => model.length;

  MapFavoritesModel copyWith({
    required Map<int, FavoritesModel>? model,
  }){
    return MapFavoritesModel(
      model: model ?? this.model,
    );
  }
}

@freezed
class FavoritesBlocState with _$FavoritesBlocState{
  const factory FavoritesBlocState.loading() = _loadingState;
  const factory FavoritesBlocState.loaded({required MapFavoritesModel model}) = _loadedState;
}

// @freezed
// class FavoritesBlocEvent with _$FavoritesBlocEvent{
//   const factory FavoritesBlocEvent.init() = _initEvent;
//   const factory FavoritesBlocEvent.addFav({required int id}) = _addFavSetEvent;
//   const factory FavoritesBlocEvent.remFav({required int id}) = _remFavSetEvent;
// }

@injectable
class FavoritesBloc extends BlocBase<FavoritesBlocState>{

  final FavoritesRepository _favoritesRepository;

  MapFavoritesModel model = const MapFavoritesModel(model: {});

  FavoritesBloc( {
    required FavoritesRepository favoritesRepository,
  }) : _favoritesRepository= favoritesRepository, super(const FavoritesBlocState.loading())
  {
    // on<FavoritesBlocEvent>((event, emit) async {
    //   await event.map<FutureOr<void>>(
    //       init: (_) async {
    //         emit(const FavoritesBlocState.loading());
    //         await _init().whenComplete(() =>
    //             emit(FavoritesBlocState.loaded(model: model))
    //         );
    //       },
    //       addFav: (value) async {
    //         if(_favoritesRepository.isBusy()) return;
    //          await _addFav(value.id).whenComplete(() =>
    //              emit(FavoritesBlocState.loaded(model: model))
    //          );
    //       },
    //       remFav: (value) async {
    //         if(_favoritesRepository.isBusy()) return;
    //         await _remFav(value.id).whenComplete(() =>
    //             emit(FavoritesBlocState.loaded(model: model))
    //         );
    //       },
    //     );
    // },);
  }

  Future<void> init() async {
           emit(const FavoritesBlocState.loading());
           await _init0().whenComplete(() =>
               emit(FavoritesBlocState.loaded(model: model))
           );
  }

  Future<void> _init0() async {
    model = model.copyWith(model: await _favoritesRepository.fav());
  }

  Future<void> addFav({required int id}) async {
    if (_favoritesRepository.isBusy()) return;
    await _addFav0(id).whenComplete(() =>
        emit(FavoritesBlocState.loaded(model: model))
    );
  }

  Future<void> _addFav0(int id) async {
    await _favoritesRepository.add(id);
    model = model.copyWith(model: await _favoritesRepository.fav());
  }

  Future<void> remFav({required int id}) async {
    if (_favoritesRepository.isBusy()) return;
    await _remFav0(id).whenComplete(() =>
        emit(FavoritesBlocState.loaded(model: model))
    );
  }

  Future<void> _remFav0(int id) async {
    await _favoritesRepository.rem(id);
    model = model.copyWith(model: await _favoritesRepository.fav());
  }
}