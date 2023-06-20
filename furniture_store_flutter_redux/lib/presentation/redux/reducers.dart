import 'package:furniture_store/presentation/redux/action_favorites.dart';
import 'package:furniture_store/presentation/redux/action_main.dart';
import 'package:furniture_store/presentation/redux/action_shopping_basket.dart';
import 'package:furniture_store/presentation/redux/app_state.dart';


FavoritesAppState reducerFav(FavoritesAppState state, dynamic action){
  if(action is FavAction){
      return state.copyWith(model: action.model);
  }
 return state;
}

ShoppingBasketAppState reducerBas(ShoppingBasketAppState state, dynamic action){
  if(action is BasAction){
      return state.copyWith(model: action.model);
  }
  return state;
}

MainAppState reducerMain(MainAppState state, dynamic action){
  if(action is ReadAllProductsAction){
     return state.copyWith(
       lpAll: action.lpAll,
       isTimeOut: action.isTimeOut,
       isError: action.isError,
     );
  }
  return state;
}