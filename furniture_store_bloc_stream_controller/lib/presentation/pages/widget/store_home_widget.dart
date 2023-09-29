import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:furniture_store/domain/bloc/bloc.dart';
import 'package:furniture_store/presentation/widgets/card_product_widget.dart';
import 'package:provider/provider.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

final bucketGlobal = PageStorageBucket();

class StoreHomeWidget extends StatefulWidget {
  const StoreHomeWidget({
    super.key,
  });

  @override
  State<StoreHomeWidget> createState() => _StoreHomeWidgetState();
}

class _StoreHomeWidgetState extends State<StoreHomeWidget> {
  @override
  Widget build(BuildContext context) {
    var mainBloc = context.read<MainBloc>();
    return PageStorage(
      bucket: bucketGlobal,
      child: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          context.read<MainBloc>().add(MainBlocEvent.getAllProducts(page: 0, completer: completer));
          return completer.future;
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
            key: const PageStorageKey('storeHomeWidget'),
            padding: const EdgeInsets.all(10.0),
            child: ReorderableGridView.builder(
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
                final elem = mainBloc.mainModel.lpAll[index];
                return CardProductWidget(
                  key: ObjectKey(elem),
                  productEntity: elem,
                  type: 0,
                  count: 1,
                );
              }, onReorder: (int oldIndex, int newIndex) {
                    final element = mainBloc.mainModel.lpAll.removeAt(oldIndex);
                    mainBloc.mainModel.lpAll.insert(newIndex, element);
                    //После изменений надо сохранить в базу данных незабыть....
            },
            ),
          ),
        ),
      ),
    );
  }
}
