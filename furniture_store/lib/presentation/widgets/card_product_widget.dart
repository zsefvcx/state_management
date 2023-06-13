import 'package:flutter/material.dart';
import 'package:furniture_store/domain/entities/entities.dart';

class CardProductWidget extends StatelessWidget {
  const CardProductWidget({
    super.key,
    required ProductEntity productEntity
  }) : _productEntity = productEntity;

  final ProductEntity _productEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Column(
        children: [
          const Expanded(
            flex: 3,
            child: SizedBox(
                height: 200,
                width: 200,
                child: Placeholder()),
          ),
          Expanded(
            flex: 1,
            child: Text(
              _productEntity.title,
            ),
          ),
          Row(
            children: [
              Text('Цена: ${_productEntity.price}'),
              //ElevatedButton(onPressed: onPressed, child: Text)
            ],
          )
        ],
      ),
    );
  }
}