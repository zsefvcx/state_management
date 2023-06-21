
import 'dart:async';

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
  const factory FavoritesBlocState.loaded({required MapFavoritesModel model}) = _LoadedState;
}

@freezed
class FavoritesBlocEvent with _$FavoritesBlocEvent{
  const factory FavoritesBlocEvent.init() = _initEvent;
  const factory FavoritesBlocEvent.addFav({required int id}) = _AddFavSetEvent;
  const factory FavoritesBlocEvent.remFav({required int id}) = _RemFavSetEvent;
}

@injectable
class FavoritesBloc{

  final FavoritesRepository _favoritesRepository;

  MapFavoritesModel model = const MapFavoritesModel(model: {});

  final StreamController<FavoritesBlocEvent> _eventsController = StreamController();
  final StreamController<FavoritesBlocState> _stateController = StreamController.broadcast();

  Stream<FavoritesBlocState> get state => _stateController.stream;

  FavoritesBloc({
    required FavoritesRepository favoritesRepository,
  }) : _favoritesRepository= favoritesRepository{
    _initial();
    _eventsController.stream.listen((event) {
      event.map<void>(
        init: (_) async {
           _stateController.add(const FavoritesBlocState.loading());
           _stateController.add(FavoritesBlocState.loaded(
             model: model = model.copyWith(model: await _favoritesRepository.fav()),
           ));
        }, addFav: (value) async {
          if(_favoritesRepository.isBusy()) return;
           await _favoritesRepository.add(value.id);
           _stateController.add(FavoritesBlocState.loaded(
             model: model = model.copyWith(model: await _favoritesRepository.fav()),
           ));
        },
        remFav: (value) async {
          if(_favoritesRepository.isBusy()) return;
          await _favoritesRepository.rem(value.id);
          _stateController.add(FavoritesBlocState.loaded(
            model: model = model.copyWith(model: await _favoritesRepository.fav()),
          ));
        },
      );
    });
  }

  void _initial() async {
    model = model.copyWith(model: await _favoritesRepository.fav());
  }

  void add(FavoritesBlocEvent event){
    if(_eventsController.isClosed) return;
    _eventsController.add(event);
  }

  void dispose(){
    _eventsController.close();
    _stateController.close();
  }
}