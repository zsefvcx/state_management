

import 'package:furniture_store/data/models/product_model.dart';

class GenerateAllProduct{
  List<String> name = [
    'Шкаф',
    'Стул',
    'Стол',
    'Кровать',
  ];
  List<double> price = [
    15000,
    2000,
    5000,
    13000,
    10000,
  ];

  static final instance = GenerateAllProduct();


  List<ProductModel> getAllProducts(){
    return <ProductModel>[
      ...List.generate(1000, (index) =>
          ProductModel(
            id: index,
            parentId: null,
            trademarkId: 0,
            title: '${name[index%name.length]} - $index',
            pictures: const <String>[],
            url: null,
            price: price[index%name.length],
          ),

      ),
    ];
  }
}