
import 'package:furniture_store/domain/entities/entities.dart';

class ReadAllProductsAction{
  final List<ProductEntity> lpAll;
  final bool isTimeOut;
  final bool isError;
  final String e;

  ReadAllProductsAction({
    required this.e,
    required this.lpAll,
    required this.isTimeOut,
    required this.isError});
}

class GetAllProductsAction{
  int page;

  GetAllProductsAction({required this.page});
}


class SearchProductAction{
  int page;

  SearchProductAction({required this.page});
}



