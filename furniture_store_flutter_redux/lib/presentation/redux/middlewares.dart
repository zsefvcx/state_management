
import 'package:furniture_store/domain/bloc/bloc.dart';
import 'package:furniture_store/domain/bloc/shopping_basket_bloc.dart';
import 'package:furniture_store/presentation/redux/action_favorites.dart';
import 'package:furniture_store/presentation/redux/action_main.dart';
import 'package:furniture_store/presentation/redux/action_shopping_basket.dart';
import 'package:furniture_store/presentation/redux/app_state.dart';
import 'package:redux/redux.dart';

final FavoritesBloc _favoritesBloc = BlocFactory.instance.get<FavoritesBloc>();
final ShoppingBasketBloc _shoppingBasketBloc = BlocFactory.instance.get<ShoppingBasketBloc>();
final MainBloc _mainBloc = BlocFactory.instance.get<MainBloc>();

void loaderMiddleWare(
  Store<AppState>? store, dynamic action, NextDispatcher nextDispatcher){

  if(action is ReadFavAction) {
    _favoritesBloc.fav().then((value) => store?.dispatch(FavAction(model: _favoritesBloc.model)));
  } else if(action is AddFavAction){
    _favoritesBloc.addFav(action.id).then((_) => store?.dispatch(FavAction(model: _favoritesBloc.model)));
  } else if(action is RemFavAction){
    _favoritesBloc.remFav(action.id).then((_) => store?.dispatch(FavAction(model: _favoritesBloc.model)));
  }

  else if(action is ReadBasAction) {
    _shoppingBasketBloc.bas().then((value) => store?.dispatch(BasAction(model: _shoppingBasketBloc.model)));
  } else if(action is RemBasAction){
    _shoppingBasketBloc.remBas(action.id).then((_) => store?.dispatch(BasAction(model: _shoppingBasketBloc.model)));
  } else if(action is SetCountBasAction){
    _shoppingBasketBloc.setCountBas(action.id, action.value).then((_) => store?.dispatch(BasAction(model: _shoppingBasketBloc.model)));
  } else if(action is RemAllAction){
    _shoppingBasketBloc.remAll().then((_) => store?.dispatch(BasAction(model: _shoppingBasketBloc.model)));
  }else if(action is AddBasAction){
    _shoppingBasketBloc.addBas(action.id).then((_) => store?.dispatch(BasAction(model: _shoppingBasketBloc.model)));

  }
  nextDispatcher(action);
}

void loaderMiddleWareMain(
    Store<MainAppState>? store, dynamic action, NextDispatcher nextDispatcher){

  if(action is GetAllProductsAction){
    _mainBloc.getAllProducts(action.page).then((_) => store?.dispatch(ReadAllProductsAction(
      lpAll: _mainBloc.lpAll,
      isTimeOut: _mainBloc.isTimeOut,
      isError: _mainBloc.isError,
      e: _mainBloc.e==null?'':_mainBloc.e.runtimeType.toString(),
    )));
  }



  nextDispatcher(action);
}