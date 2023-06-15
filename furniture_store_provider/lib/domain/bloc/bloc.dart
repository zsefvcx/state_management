import 'package:flutter/foundation.dart';

export 'bloc_factory.dart';
export 'main_bloc.dart';
export 'favorites_bloc.dart';

abstract class MyBloc<T> with ChangeNotifier{

  Set<T> model = {};

}