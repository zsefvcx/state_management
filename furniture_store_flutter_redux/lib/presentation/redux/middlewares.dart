
import 'package:furniture_store/domain/bloc/bloc.dart';
import 'package:furniture_store/presentation/redux/action.dart';
import 'package:furniture_store/presentation/redux/app_state.dart';
import 'package:redux/redux.dart';

final FavoritesBloc favoritesBloc = BlocFactory.instance.get<FavoritesBloc>();

void loaderMiddleWare(
  Store<FavoritesAppState>? store, dynamic action, NextDispatcher nextDispatcher){

  if(action is ReadFavAction) {
    favoritesBloc.fav().then((value) => store?.dispatch(FavAction(model: favoritesBloc.model)));
  } else if(action is AddFavAction){
    favoritesBloc.addFav(action.id).then((_) => store?.dispatch(FavAction(model: favoritesBloc.model)));
  } else if(action is RemFavAction){
    favoritesBloc.remFav(action.id).then((_) => store?.dispatch(FavAction(model: favoritesBloc.model)));
  }



  nextDispatcher(action);
}

