import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furniture_store/domain/bloc/bloc.dart';
import 'package:furniture_store/domain/bloc/shopping_basket_bloc.dart';
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:provider/provider.dart';

class CardProductWidget extends StatefulWidget {
  const CardProductWidget({
    super.key,
    required ProductEntity productEntity,
  }) : _productEntity = productEntity;

  final ProductEntity _productEntity;

  @override
  State<CardProductWidget> createState() => _CardProductWidgetState();
}

class _CardProductWidgetState extends State<CardProductWidget> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) print('Build ${widget._productEntity.id}');
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      padding: const EdgeInsets.all(10.0),
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
              flex: 5,
              child: Center(
                child: SizedBox(
                    width: 200,
                    child: Stack(children: [
                        const Placeholder(),
                        Consumer<FavoritesBloc>(builder: (_, favoritesBloc, __) {
                          if (kDebugMode) print('Build favorite ${widget._productEntity.id}');
                          bool status = favoritesBloc.statusFav(widget._productEntity.id);
                          return IconButton(
                            onPressed: () async {
                              status? await favoritesBloc.remFav(widget._productEntity.id):
                                      await favoritesBloc.addFav(widget._productEntity.id);
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
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget._productEntity.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(
                    '${widget._productEntity.price.toInt()} ₽',
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Consumer<ShoppingBasketBloc>(builder: (_, shoppingBasketBloc, __) {
                if (kDebugMode) print('Build button shoppingBasket ${widget._productEntity.id}');
                bool status = shoppingBasketBloc.statusBas(widget._productEntity.id);
                _controller.value = TextEditingValue(text: shoppingBasketBloc.getCountBas(widget._productEntity.id).toString());
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: status?MainAxisAlignment.spaceBetween:MainAxisAlignment.end,
                  children: [
                    if (status)IconButton(
                      onPressed: () async {
                        int value = int.parse(_controller.value.text);
                        value--;
                        if(value <= 0) {
                          value = 0;//и удаляем товар из корзины
                          await shoppingBasketBloc.remBas(widget._productEntity.id);
                        } else {
                          _controller.value = TextEditingValue(
                              text: value.toString());
                          await shoppingBasketBloc.setCountBas(
                              widget._productEntity.id, value);
                        }
                      }, icon: const Icon(Icons.remove),
                    ),
                    if (status)Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                      height: 30,
                      width: 40,
                      child: TextField(
                          controller: _controller,
                          decoration:  const InputDecoration(
                            border: InputBorder.none,
                          ),
                          mouseCursor: SystemMouseCursors.text,
                          maxLines: 1,
                          minLines: 1,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'^[0-9]{1,4}$')),
                          ],
                          onChanged: (v) async {
                            int value = int.parse(v);
                            if(value > 999) value = 0;
                            if(value <= 0){
                              value = 0;//и удаляем товар из корзины
                              await shoppingBasketBloc.remBas(widget._productEntity.id);
                            } else {
                              _controller.value =
                                  TextEditingValue(text: value.toString());
                              await shoppingBasketBloc.setCountBas(
                                  widget._productEntity.id, value);
                            }
                          },
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                      ),
                    ),
                    if (status)IconButton(
                      onPressed: () async {
                        int value = int.parse(_controller.value.text);
                        value++;
                        if(value > 999) value = 999;
                        _controller.value = TextEditingValue(text: value.toString());
                        await shoppingBasketBloc.setCountBas(widget._productEntity.id, value);
                      }, icon: const Icon(Icons.add),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              status?Colors.grey:Colors.white,
                          ),
                        maximumSize: MaterialStateProperty.all(const Size(150, 30)),
                        minimumSize: MaterialStateProperty.all(const Size(150, 30)),
                      ),
                      onPressed: () async {
                        status? await shoppingBasketBloc.remBas(widget._productEntity.id):
                        await shoppingBasketBloc.addBas(widget._productEntity.id);
                      },//print('В Корзину id:${_productEntity.id}');
                      child: Row(
                        children: [
                          Icon(status?Icons.shopping_basket:Icons.shopping_basket_outlined),
                          Center(
                            child: FittedBox(
                              child: Text(
                                status?'  В корзинe':'  В корзину', textDirection: TextDirection.ltr,
                              style: TextStyle(color: status?Colors.white:Colors.blueAccent),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}