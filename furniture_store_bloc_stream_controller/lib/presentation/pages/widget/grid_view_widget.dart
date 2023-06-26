
import 'package:flutter/material.dart';
import 'package:furniture_store/domain/bloc/bloc.dart';
import 'package:furniture_store/presentation/settings.dart';
import 'package:furniture_store/presentation/widgets/widgets.dart';
import 'package:provider/provider.dart';

class GridViewWidget extends StatefulWidget {
  const GridViewWidget({
    super.key,
    required this.model,
  });

  final ShoppingBasketModel model;

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    var mainBloc = context.read<MainBloc>();
    return GridView.builder(
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
        itemCount: widget.model.getLength,
        itemBuilder: (_, index) {
          return CardProductWidget(
            productEntity: mainBloc
                .mainModel.lpAll[widget.model.getList[index].id],
            type: 1,
            count: widget.model.getList[index].count,
          );
        });
  }
}