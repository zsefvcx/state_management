
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:provider/provider.dart';

import '../../domain/bloc/favorites_bloc.dart';

class ImageProductWidget extends StatelessWidget {
  const ImageProductWidget({
    super.key,
    required ProductEntity productEntity,
  }): _productEntity = productEntity;

  final ProductEntity _productEntity;

  @override
  Widget build(BuildContext context) {
    final favoritesBloc = Provider.of<FavoritesBloc>(context);

    return Center(
      child: SizedBox(
        width: 200,
        child: Stack(children: [
          const Placeholder(),
          Observer(builder: (_) {
            bool status = favoritesBloc.status(_productEntity.id);
            return IconButton(
              onPressed: () async {
                status? await favoritesBloc.remSingle(_productEntity.id):
                await favoritesBloc.addSingle(_productEntity.id);
              },
              icon: Icon(status?Icons.favorite:Icons.favorite_border,
                color: Colors.blue,
                size: 24,
              ),
            );
          }
          ),
        ],
        ),
      ),
    );
  }
}