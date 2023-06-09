
import 'package:furniture_store/core/error/failure.dart';
import 'package:furniture_store/feature/domain/entities/entities.dart';
import 'package:furniture_store/feature/domain/repositories/feature_repository.dart';

class SearchProducts {
  final FeatureRepository featureRepository;

  SearchProducts(this.featureRepository);

  Future<(Failure, List<ProductEntity>)> call(int page) async {
    return await featureRepository.gatAllProducts(page);
  }

}