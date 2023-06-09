
import 'package:furniture_store/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<(Failure, Type)> call(Params params);
}