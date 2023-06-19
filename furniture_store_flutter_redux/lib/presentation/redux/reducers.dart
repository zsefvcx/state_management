import 'package:furniture_store/presentation/redux/app_state.dart';

import 'action.dart';

FavoritesAppState reducer(FavoritesAppState state, dynamic action){
  if(action is FavAction){
    if(!(state.model == action.model)) {
      return state.copyWith(model: action.model);
    }
  } else if (action is StatusFavAction){
    return state.copyWith();
  } else if (action is AddFavAction){
    return state.copyWith();
  } else if (action is RemFavAction){
    return state.copyWith();
  }

 return state;
}