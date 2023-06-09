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
    return Center(
      child: SizedBox(
        width: 200,
        child: Stack(children: [
          const Placeholder(),
          Consumer(builder: (_, ref, __) {
            final favoritesBloc = ref.read(favoritesProvider.notifier);
            bool status = ref.watch(favoritesProvider).statusFav(_productEntity.id);
            return IconButton(
              onPressed: () async {
                status? await favoritesBloc.remFav(_productEntity.id):
                await favoritesBloc.addFav(_productEntity.id);
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