import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store/domain/bloc/bloc.dart';
import 'package:furniture_store/domain/bloc/shopping_basket_bloc.dart';

import '../store_app.dart';


class NumberIconWidget extends ConsumerWidget {
  const NumberIconWidget({
    super.key,
    required Icon icon,
    required int type,
  }) : _icon = icon, _type = type;
  final Icon _icon;
  final int _type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (_, ref, __){
      final blocModel =  ref.watch(_type==0?favoritesProvider:shoppingBasketProvider);
      int num = 0;
        if(blocModel is ShoppingBasket){
          num = blocModel.model.values.fold(0, (previousValue, element) => previousValue + element.count);
        } else if(blocModel is Favorites){
          num = blocModel.model.values.length;
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