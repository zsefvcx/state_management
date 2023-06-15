import 'package:flutter/material.dart';
import 'package:furniture_store/domain/bloc/bloc.dart';
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
      String text = '0';
      if (bloc is MyBloc) {
        text = bloc.model.length.toString();
      }
      return Stack(children: [_icon, Positioned(
        top: -4,
        child: Text(text,
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w900,
              backgroundColor: Colors.white.withOpacity(0.2),
              color: Colors.black),
        ),
      ),]);
    });
  }
}