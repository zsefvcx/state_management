

import 'package:furniture_store/core/core.dart';
import 'package:furniture_store/feature/domain/entities/entities.dart';
import 'package:furniture_store/feature/domain/repositories/feature_repository.dart';

class GatAllProducts extends UseCase<List<ProductEntity, Params>>{
  final FeatureRepository featureRepository;

  GatAllProducts(this.featureRepository);

  @override
  Future<(Failure, List<ProductEntity>)> call(int page) async {
    return await featureRepository.gatAllProducts(page);
  }

}