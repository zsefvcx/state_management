

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:furniture_store/presentation/redux/action_favorites.dart';
import 'package:furniture_store/presentation/redux/app_state.dart';

class ImageProductWidget extends StatelessWidget {
  const ImageProductWidget({
    super.key,
    required ProductEntity productEntity,
  }): _productEntity = productEntity;

  final ProductEntity _productEntity;

  @override
  Widget build(BuildContext context) {
    var action = StoreProvider.of<FavoritesAppState>(context);
    action.dispatch(ReadFavAction());
    return Center(
      child: SizedBox(
        width: 200,
        child: Stack(children: [
          const Placeholder(),
          StoreConnector<FavoritesAppState,FavoritesAppState>(
          converter: (store) => store.state,
          builder: (context, vm) {
            bool status = vm.model.keys.contains(_productEntity.id);
            return IconButton(
              onPressed: () {
                status? action.dispatch(RemFavAction(id: _productEntity.id)):
                action.dispatch(AddFavAction(id: _productEntity.id));
              },
              icon: Icon(status?Icons.favorite:Icons.favorite_border,
                color: Colors.blue,
                size: 24,
              ),
            );
          }),
        ],
        ),
      ),
    );
  }
}