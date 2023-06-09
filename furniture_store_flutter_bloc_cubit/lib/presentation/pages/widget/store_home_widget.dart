import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:furniture_store/domain/bloc/bloc.dart';
import 'package:furniture_store/presentation/widgets/card_product_widget.dart';
import 'package:provider/provider.dart';

class StoreHomeWidget extends StatelessWidget {
  const StoreHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var mainBloc = context.read<MainBloc>();
    return RefreshIndicator(
      onRefresh: () async {
        Future block = context.read<MainBloc>().stream.first;
        context.read<MainBloc>().getAllProducts(page: 0);
        return await block;
      },
      child: ScrollConfiguration(
        // + windows
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 550,
              mainAxisExtent: 200, // here set custom Height You Want
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
            ),
//padding: const EdgeInsets.only(top: 16),
            itemCount: mainBloc.mainModel.lpAll.length,
            itemBuilder: (_, index) {
              return CardProductWidget(
                productEntity: mainBloc.mainModel.lpAll[index],
                type: 0,
                count: 1,
              );
            },
          ),
        ),
      ),
    );
  }
}
