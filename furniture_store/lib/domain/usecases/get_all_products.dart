
import 'package:equatable/equatable.dart';
import 'package:furniture_store/core/core.dart';
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:furniture_store/domain/repositories/feature_repository.dart';

class GatAllProducts extends UseCase<List<ProductEntity>, PageProductParams>{
  final FeatureRepository featureRepository;

  GatAllProducts(this.featureRepository);

  @override
  Future<(Failure, List<ProductEntity>)> call(PageProductParams params) async {
    return await featureRepository.gatAllProducts(params.page);
  }

}

class PageProductParams extends Equatable {
  final int page;

  const PageProductParams({required this.page});

  @override
  List<Object?> get props => [page];
}