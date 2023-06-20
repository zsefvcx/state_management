import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:furniture_store/presentation/pages/store_home_page.dart';
import 'package:furniture_store/presentation/redux/action_shopping_basket.dart';
import 'package:furniture_store/presentation/redux/app_state.dart';
import 'package:furniture_store/presentation/route_generator.dart';


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
    var action = StoreProvider.of<ShoppingBasketAppState>(context);
    action.dispatch(ReadBasAction());
    return StoreConnector<ShoppingBasketAppState,ShoppingBasketAppState>(
        converter: (store) => store.state,
        builder: (context, vm) {
      final TextEditingController controller = TextEditingController();

      bool status = vm.model.keys.contains(_productEntity.id);
      var model = vm.model[_productEntity.id];
      var count = model==null?0:model.count;

      controller.value = TextEditingValue(text: count.toString());
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
                  onChanged: (v) async {
                    int value = int.parse(v);
                    if(value > 999) value = 0;
                    if(value <= 0){
                      value = 0;
                      action.dispatch(RemBasAction(id: _productEntity.id));
                    } else {
                      controller.value =
                          TextEditingValue(text: value.toString());
                       action.dispatch(SetCountBasAction(
                           id: _productEntity.id,
                        value: value
                       ));
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
                  onPressed: () async {
                    int value = int.parse(controller.value.text);
                    value--;
                    if(value <= 0) {
                      value = 0;
                      action.dispatch(RemBasAction(id: _productEntity.id));
                    } else {
                      controller.value = TextEditingValue(
                          text: value.toString());
                      action.dispatch(SetCountBasAction(
                           id: _productEntity.id,
                           value: value
                      ));
                    }
                  }, icon: const Icon(Icons.remove),
                ),
              ),
              Positioned(
                top: -3,
                right: 0,
                child: IconButton(
                  onPressed: () async {
                    int value = int.parse(controller.value.text);
                    value++;
                    if(value > 999) value = 999;
                    controller.value = TextEditingValue(text: value.toString());
                      action.dispatch(SetCountBasAction(
                         id: _productEntity.id,
                         value: value
                      ));
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
                          action.dispatch(RemBasAction(id: _productEntity.id));
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
                status? action.dispatch(RemBasAction(id: _productEntity.id)):
                action.dispatch(AddBasAction(id: _productEntity.id));
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