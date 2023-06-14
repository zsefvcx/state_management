import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:furniture_store/presentation/widgets/detail_product_entity_widget.dart';
import 'package:furniture_store/presentation/widgets/image_product_widget.dart';
import 'package:furniture_store/presentation/widgets/uni_pay_button_widget.dart';

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
              child: ImageProductWidget(productEntity: widget._productEntity),
            ),
            Expanded(
              flex: 2,
              child: DetailProductEntityWidget(productEntity: widget._productEntity),
            ),
            Expanded(
              flex: 2,
              child: UniPayButtonWidget(productEntity: widget._productEntity),
            ),
          ],
        ),
      ),
    );
  }
}
