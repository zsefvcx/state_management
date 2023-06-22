
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
    return StreamBuilder<ShoppingBasketBlocState>(
      stream: context.read<ShoppingBasketBloc>().state,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final state = snapshot.data;
          if (state != null) {
            return state.map(loading: ( value) {
              return const Center(child: CircularProgressIndicator(),);
            }, loaded: (value) {
              final TextEditingController controller = TextEditingController();
              bool status = value.model.getStatus(id: _productEntity.id);
              controller.value = TextEditingValue(text: value.model.getCount(id: _productEntity.id).toString());
              return RowLocalWidget(status: status, controller: controller, productEntity: _productEntity, type: _type);
            });
          }
        }
        return const Center(child: CircularProgressIndicator(),);
      },
    );
  }
}

class RowLocalWidget extends StatelessWidget {
  const RowLocalWidget({
    super.key,
    required this.status,
    required this.controller,
    required ProductEntity productEntity,
    required int type,
  }) : _productEntity = productEntity, _type = type;

  final bool status;
  final TextEditingController controller;
  final ProductEntity _productEntity;
  final int _type;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: status?MainAxisAlignment.spaceBetween:MainAxisAlignment.end,
      children: [
        if(status)Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
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
                onChanged: (v) {
                  int value = int.parse(v);
                  if(value > 999) value = 0;
                  if(value <= 0){
                    value = 0;
                    context.read<ShoppingBasketBloc>().add(ShoppingBasketBlocEvent.remBas(id: _productEntity.id));
                  } else {
                    controller.value =
                        TextEditingValue(text: value.toString());
                    context.read<ShoppingBasketBloc>().add(ShoppingBasketBlocEvent.setCountBas(id: _productEntity.id, value: value));
                  }
                },
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
              ),
            ),
            Positioned(
              top: -3,
              left: 0,
              child: IconButton(
                onPressed: ()  {
                  int value = int.parse(controller.value.text);
                  value--;
                  if(value <= 0) {
                    value = 0;
                    context.read<ShoppingBasketBloc>().add(ShoppingBasketBlocEvent.remBas(id: _productEntity.id));
                  } else {
                    controller.value = TextEditingValue(
                        text: value.toString());
                    context.read<ShoppingBasketBloc>().add(ShoppingBasketBlocEvent.setCountBas(id: _productEntity.id, value: value));
                  }
                }, icon: const Icon(Icons.remove),
              ),
            ),
            Positioned(
              top: -3,
              right: 0,
              child: IconButton(
                onPressed: () {
                  int value = int.parse(controller.value.text);
                  value++;
                  if(value > 999) value = 999;
                  controller.value = TextEditingValue(text: value.toString());
                  context.read<ShoppingBasketBloc>().add(ShoppingBasketBlocEvent.setCountBas(id: _productEntity.id, value: value));
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
                        context.read<ShoppingBasketBloc>().add(ShoppingBasketBlocEvent.remBas(id: _productEntity.id));
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
              status? context.read<ShoppingBasketBloc>().add(ShoppingBasketBlocEvent.remBas(id: _productEntity.id)):
              context.read<ShoppingBasketBloc>().add(ShoppingBasketBlocEvent.addBas(id: _productEntity.id));
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
  }
}