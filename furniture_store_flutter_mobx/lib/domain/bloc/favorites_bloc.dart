import 'package:furniture_store/data/models/favorites_model.dart';
import 'package:furniture_store/domain/repositories/repositories.dart';

import 'package:mobx/mobx.dart';

part 'favorites_bloc.g.dart';

class FavoritesBloc = FavoritesBlocBase with _$FavoritesBloc;

class MapFavoritesModel {
  final Map<int, FavoritesModel> model;

   const MapFavoritesModel({
    required this.model,
  });

  bool getStatus({required int id}) => model[id]!=null?true:false;
  int get getLength => model.length;

  MapFavoritesModel copyWith({
    required Map<int, FavoritesModel>? model,
  }){
    return MapFavoritesModel(
      model: model ?? this.model,
    );
  }
}


abstract class FavoritesBlocBase with Store {

  @observable
  FavoritesRepository favoritesRepository;

  @observable
  MapFavoritesModel model = const MapFavoritesModel(model: {});

  FavoritesBlocBase({
    required this.favoritesRepository,
  }){
    init();
  }

  @action
  Future<void> init() async {
    var model = await favoritesRepository.fav();
    this.model = this.model.copyWith(model: model);
  }

  @action
  Future<void> addSingle(int id) async {
    await favoritesRepository.add(id);
    await init();
  }

  @action
  Future<void> remSingle(int id) async {
    await favoritesRepository.rem(id);
    await init();
  }

}