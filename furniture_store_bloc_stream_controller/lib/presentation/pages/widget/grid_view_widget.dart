
import 'package:flutter/material.dart';
import 'package:furniture_store/domain/bloc/bloc.dart';
import 'package:furniture_store/presentation/settings.dart';
import 'package:furniture_store/presentation/widgets/widgets.dart';
import 'package:provider/provider.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    super.key,
    required this.model,
  });

  final ShoppingBasketModel model;

  @override
  Widget build(BuildContext context) {
    var mainBloc = context.read<MainBloc>();
    return GridView.builder(
      controller: Settings.instance.controller,
        key: Settings.instance.basketKey,
        gridDelegate:
        const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 550,
          mainAxisExtent:
          200, // here set custom Height You Want
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        //padding: const EdgeInsets.only(top: 16),
        itemCount: model.getLength,
        itemBuilder: (_, index) {
          return CardProductWidget(
            productEntity: mainBloc
                .mainModel.lpAll[model.getList[index].id],
            type: 1,
            count: model.getList[index].count,
          );
        });
  }
}