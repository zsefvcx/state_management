
import 'package:flutter/material.dart';
import 'package:furniture_store/domain/entities/entities.dart';


class DetailProductEntityWidget extends StatelessWidget {
  const DetailProductEntityWidget({
    super.key,
    required ProductEntity productEntity,
    required int count,
  }) : _productEntity = productEntity, _count = count==0?1:count;
  final int _count;
  final ProductEntity _productEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _productEntity.title,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500
          ),
        ),
        Text(
          '${(_productEntity.price*_count).toInt()} ₽',
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500
          ),
        ),
      ],
    );
  }
}
