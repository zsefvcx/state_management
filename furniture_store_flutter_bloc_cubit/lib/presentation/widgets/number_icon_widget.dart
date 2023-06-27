import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store/domain/bloc/bloc.dart';

class NumberIconWidget extends StatelessWidget {
  const NumberIconWidget({
    super.key,
    required Icon icon,
    required int type,
  }) : _icon = icon, _type = type;
  final Icon _icon;
  final int _type;

  @override
  Widget build(BuildContext context) {
    var state = _type==0?context.read<ShoppingBasketBloc>():
    context.read<FavoritesBloc>();

    if (state is ShoppingBasketBloc){
      return BlocBuilder<ShoppingBasketBloc, ShoppingBasketBlocState>(
          builder: (context, state) {
                  return state.map(
                      loading: (value) {
                        return _icon;
                      },
                      loaded: (value) {
                        int num = 0;
                        if(_type==0){
                           num = value.model.getAllCount;
                        }
                        else if(_type==1){
                         // num = value.model.getLength();
                        }
                          return Stack(children: [Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: _icon,
                          ), if(num!=0)Positioned(
                            right: 0,
                            child: Text(num.toString(),
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black),
                            ),
                          ),]);

                      });
                }
        );
    } else if (state is FavoritesBloc){
      return BlocBuilder<FavoritesBloc, FavoritesBlocState>(
          builder: (context, state) {
                return state.map(
                    loading: (value) {
                      return _icon;
                    },
                    loaded: (value) {
                      int num = 0;
                      if(_type==0){
                        //num = value.model.getAllCount;
                      }
                      else if(_type==1){
                        num = value.model.getLength();
                      }
                      return Stack(children: [Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: _icon,
                      ), if(num!=0)Positioned(
                        right: 0,
                        child: Text(num.toString(),
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                              color: Colors.black),
                        ),
                      ),]);

                    });
          }
      );
    }
    return _icon;
  }
}
