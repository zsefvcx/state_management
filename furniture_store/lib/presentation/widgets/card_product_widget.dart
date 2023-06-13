import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store/domain/bloc/bloc.dart';
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:provider/provider.dart';

class CardProductWidget extends StatelessWidget {
  const CardProductWidget({
    super.key,
    required ProductEntity productEntity,
  }) : _productEntity = productEntity;

  final ProductEntity _productEntity;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) print('Build ${_productEntity.id}');
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.deepOrange.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SizedBox(
                      width: 200,
                      child: Stack(children: [
                          const Placeholder(),
                          Consumer<FavoritesBloc>(builder: (_, favoritesBloc, __) {
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
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10,0,10,0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          _productEntity.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10,0,10,0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FittedBox(
                      child: Text('${_productEntity.price.toInt()} ₽', style: const TextStyle(fontSize: 14),),
                    ),
                  ],
                ),
              ),
            ),
            FittedBox(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10,0,10,0),
                child: ElevatedButton(onPressed: () => print('В Корзину id:${_productEntity.id}'),
                    child: const Row(
                      children: [
                        Icon(Icons.shopping_basket_outlined),
                        Center(
                          child: FittedBox(
                            child: Text(' В корзину', textDirection: TextDirection.ltr,),
                          ),
                        ),
                      ],
                    ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}