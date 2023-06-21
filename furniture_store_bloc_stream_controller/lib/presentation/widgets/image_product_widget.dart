
import 'package:flutter/material.dart';
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
    return Center(
      child: SizedBox(
        width: 200,
        child: Stack(children: [
          const Placeholder(),
          StreamBuilder<FavoritesBlocState>(
              stream: context.read<FavoritesBloc>().state,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final state = snapshot.data;
                  if (state != null) {
                    return state.map(
                        loading: (_) {
                          return const Center(child: CircularProgressIndicator(),);
                        },
                        loaded: (value) {
                          bool status = value.model.getStatus(id: _productEntity.id);
                          return IconButton(
                            onPressed: () {
                              var favBloc = context.read<FavoritesBloc>();
                              status? favBloc.add(FavoritesBlocEvent.remFav(id: _productEntity.id)):
                                      favBloc.add(FavoritesBlocEvent.addFav(id: _productEntity.id));
                            },
                            icon: Icon(status?Icons.favorite:Icons.favorite_border,
                              color: Colors.blue,
                              size: 24,
                            ),
                          );
                        },
                    );
                  }
                }
                return const Center(child: CircularProgressIndicator(),);
              },
          ),
        ],
        ),
      ),
    );
  }
}