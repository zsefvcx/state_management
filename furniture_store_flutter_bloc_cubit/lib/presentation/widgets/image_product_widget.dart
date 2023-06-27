
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store/domain/bloc/bloc.dart';
import 'package:furniture_store/domain/entities/entities.dart';

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
                status? context.read<FavoritesBloc>().remFav(id: _productEntity.id):
                context.read<FavoritesBloc>().addFav(id: _productEntity.id);
              },
              icon: BlocBuilder<FavoritesBloc, FavoritesBlocState>(
                builder: (context, state) {
                  status = context.read<FavoritesBloc>().model.getStatus(id: _productEntity.id);
                      state.map(loading: ( value) {
                      //ничего не делаем, зачем что то делать
                      }, loaded: (value) {
                        //Загружено читаем статус
                        status = value.model.getStatus(id: _productEntity.id);
                      });
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


