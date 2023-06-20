import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:furniture_store/presentation/redux/app_state.dart';

class NumberIconWidget<T> extends StatelessWidget {
  const NumberIconWidget({
    super.key,
    required Icon icon,
  }) : _icon = icon;
  final Icon _icon;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<T,T>(
        converter: (store) => store.state,
        builder: (context, vm) {
      int num = 0;
      if (vm is AppState) {
        if(vm is ShoppingBasketAppState){
          num = vm.model.values.toSet().toList().fold(0, (previousValue, element) => previousValue + element.count);
        } else{
          num = vm.model.length;
        }

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