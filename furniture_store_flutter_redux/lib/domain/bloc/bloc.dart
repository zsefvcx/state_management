import 'package:flutter/foundation.dart';

export 'bloc_factory.dart';
export 'main_bloc.dart';
export 'favorites_bloc.dart';
export 'shopping_basket_bloc.dart';

abstract class MyBloc<T> with ChangeNotifier{

  Map<int, T> model = {};

}