
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furniture_store/domain/bloc/shopping_basket_bloc.dart';
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:furniture_store/presentation/pages/store_home_page.dart';
import 'package:furniture_store/presentation/route_generator.dart';
import 'package:provider/provider.dart';

class UniPayButtonWidget extends StatelessWidget {
  const UniPayButtonWidget({
    super.key,
    required ProductEntity productEntity,
    required int type,
  }) : _productEntity = productEntity, _type = type;

  final int _type;
  final ProductEntity _productEntity;

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingBasketBloc>(builder: (_, shoppingBasketBloc, __) {
      final TextEditingController controller = TextEditingController();
      bool status = shoppingBasketBloc.model.getStatus(id: _productEntity.id);
      controller.value = TextEditingValue(text: shoppingBasketBloc.model.getCount(id: _productEntity.id).toString());
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: status?MainAxisAlignment.spaceBetween:MainAxisAlignment.end,
        children: [
          if(status)Stack(
            alignment: Alignment.center,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                height: 30,
                width: 90,
                child: TextField(
                  controller: controller,
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
                      value = 0;
                      await shoppingBasketBloc.remBas(_productEntity.id);
                    } else {
                      controller.value =
                          TextEditingValue(text: value.toString());
                      await shoppingBasketBloc.setCountBas(
                          _productEntity.id, value);
                    }
                  },
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                ),
              ),
              Positioned(
                top: -8,
                left: 0,
                child: IconButton(
                  onPressed: () async {
                    int value = int.parse(controller.value.text);
                    value--;
                    if(value <= 0) {
                      value = 0;
                      await shoppingBasketBloc.remBas(_productEntity.id);
                    } else {
                      controller.value = TextEditingValue(
                          text: value.toString());
                      await shoppingBasketBloc.setCountBas(
                          _productEntity.id, value);
                    }
                  }, icon: const Icon(Icons.remove),
                ),
              ),
              Positioned(
                top: -8,
                right: 0,
                child: IconButton(
                  onPressed: () async {
                    int value = int.parse(controller.value.text);
                    value++;
                    if(value > 999) value = 999;
                    controller.value = TextEditingValue(text: value.toString());
                    await shoppingBasketBloc.setCountBas(_productEntity.id, value);
                  }, icon: const Icon(Icons.add),
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                status?Colors.grey:Colors.white,
              ),
              maximumSize: MaterialStateProperty.all(const Size(150, 30)),
              minimumSize: MaterialStateProperty.all(const Size(150, 30)),
            ),
            onPressed: () {
              if(_type==1) {
                showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Оплатить'),
                    content: const Text(''),
                    actions: [
                      ElevatedButton(
                        child: const Text('Ok'),
                        onPressed: () {
                          shoppingBasketBloc.remBas(_productEntity.id);
                          RouteGenerator.currentIndex.index = 0;
                          Navigator.of(context).
                          pushReplacementNamed(StoreHomePage.routeName,
                            arguments: {
                              'TabIndex':RouteGenerator.currentIndex.index,
                            },
                          );
                        },
                      ),
                      ElevatedButton(
                        child: const Text('Отмена'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
              } else {
                status? shoppingBasketBloc.remBas(_productEntity.id):
                shoppingBasketBloc.addBas(_productEntity.id);
              }
            },
            child: Row(
              children: [
                Icon(status?Icons.shopping_basket:Icons.shopping_basket_outlined),
                Center(
                  child: FittedBox(
                    child: _type==0?Text(
                      status?'  В корзинe':'  В корзину', textDirection: TextDirection.ltr,
                      style: TextStyle(color: status?Colors.white:Colors.blueAccent),
                    ):Text(
                      '  Оплатить', textDirection: TextDirection.ltr,
                      style: TextStyle(color: status?Colors.white:Colors.blueAccent),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}