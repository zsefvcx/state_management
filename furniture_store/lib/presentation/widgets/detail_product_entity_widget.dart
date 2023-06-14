
import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';

class DetailProductEntityWidget extends StatelessWidget {
  const DetailProductEntityWidget({
    super.key,
    required ProductEntity productEntity,
  }) : _productEntity = productEntity;

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
          '${_productEntity.price.toInt()} ₽',
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500
          ),
        ),
      ],
    );
  }
}
