import 'package:furniture_store/domain/bloc/bloc.dart';
import 'package:furniture_store/presentation/redux/app_state.dart';

import 'action.dart';

FavoritesAppState reducer(FavoritesAppState state, dynamic action){
  if(action is FavAction){
    return state.copyWith();
  } else if (action is AddFavAction){
    return state.copyWith(model: );
  } else if (action is RemFavAction){
    return state.copyWith(model: );
  }

 return state;
}