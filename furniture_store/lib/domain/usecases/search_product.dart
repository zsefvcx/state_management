
import 'package:equatable/equatable.dart';
import 'package:furniture_store/core/core.dart';
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:furniture_store/domain/repositories/feature_repository.dart';

class SearchProducts extends UseCase<List<ProductEntity>?, SearchProductParams>{
  final FeatureRepository featureRepository;

  SearchProducts(this.featureRepository);

  @override
  Future<(Failure?, List<ProductEntity>?)> call(SearchProductParams params) async {
    return await featureRepository.gatAllProducts(params.id);
  }

}

class SearchProductParams extends Equatable {
  final int id;

  const SearchProductParams({required this.id});

  @override
  List<Object?> get props => [id];
}