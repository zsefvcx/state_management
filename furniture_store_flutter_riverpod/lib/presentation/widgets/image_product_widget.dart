
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:furniture_store/presentation/store_app.dart';

class ImageProductWidget  extends ConsumerWidget {
  const ImageProductWidget({
    super.key,
    required ProductEntity productEntity,
  }): _productEntity = productEntity;

  final ProductEntity _productEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (kDebugMode) print('Build ImageProductWidget ${_productEntity.id}');
    return Center(
      child: SizedBox(
        width: 200,
        child: Stack(children: [
          const Placeholder(),
          Consumer(builder: (_, ref, __) {
            final favoritesBloc = ref.watch(favoritesProvider);
            if (kDebugMode) print('Build favorite ${_productEntity.id}');
            bool status = favoritesBloc.statusFav(_productEntity.id);
            return IconButton(
              onPressed: () async {
                status? await favoritesBloc.remFav(_productEntity.id):
                await favoritesBloc.addFav(_productEntity.id);
              }, //print('Нравиться id:${_productEntity.id}'),
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