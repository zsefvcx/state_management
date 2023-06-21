
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:furniture_store/domain/bloc/bloc.dart';
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:provider/provider.dart';

class ImageProductWidget extends StatelessWidget {
  const ImageProductWidget({
    super.key,
    required ProductEntity productEntity,
  }): _productEntity = productEntity;

  final ProductEntity _productEntity;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        child: Stack(children: [
          const Placeholder(),
          Observer(builder: (context) {
            final favoritesBloc = Provider.of<FavoritesBloc>(context);
            bool status = favoritesBloc.model.getStatus(id: _productEntity.id);
            return IconButton(
              onPressed: () {
                status? favoritesBloc.remSingle(_productEntity.id):
                favoritesBloc.addSingle(_productEntity.id);
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