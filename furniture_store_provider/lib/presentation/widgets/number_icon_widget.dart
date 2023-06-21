import 'package:flutter/material.dart';
import 'package:furniture_store/domain/bloc/bloc.dart';
import 'package:furniture_store/domain/bloc/shopping_basket_bloc.dart';
import 'package:provider/provider.dart';

class NumberIconWidget<T> extends StatelessWidget {
  const NumberIconWidget({
    super.key,
    required Icon icon,
  }) : _icon = icon;
  final Icon _icon;

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(builder: (_, bloc, __){
      int num = 0;
        if(bloc is ShoppingBasketBloc){
          num = bloc.model.getAllCount;
        } else if(bloc is FavoritesBloc){
          num = bloc.model.getLength();
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
}