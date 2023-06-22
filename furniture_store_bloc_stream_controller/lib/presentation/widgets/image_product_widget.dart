
import 'package:flutter/material.dart';
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
    bool status = context.read<FavoritesBloc>().model.getStatus(id: _productEntity.id);
    return Center(
      child: SizedBox(
        width: 200,
        child: Stack(children: [
          const Placeholder(),
          IconButton(
              onPressed: () async {
                status? context.read<FavoritesBloc>().add(FavoritesBlocEvent.remFav(id: _productEntity.id)):
                context.read<FavoritesBloc>().add(FavoritesBlocEvent.addFav(id: _productEntity.id));
              },
              icon: StreamBuilder<FavoritesBlocState>(
                stream: context.read<FavoritesBloc>().state,
                builder: (context, snapshot) {
                  status = context.read<FavoritesBloc>().model.getStatus(id: _productEntity.id);
                  if (snapshot.hasData) {
                    final state = snapshot.data;
                    if (state != null) {
                      state.map(loading: ( value) {
                      //ничего не делаем, зачем что то делать
                      }, loaded: (value) {
                        //Загружено читаем статус
                        status = value.model.getStatus(id: _productEntity.id);
                      });
                    }
                  }
                  return Icon(status?Icons.favorite:Icons.favorite_border,
                    color: Colors.blue,
                    size: 24,
                  );
                },
              ),
          ),
        ],
        ),
      ),
    );
  }
}


