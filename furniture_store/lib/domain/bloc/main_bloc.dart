
import 'package:furniture_store/core/error/failure.dart';
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:furniture_store/domain/repositories/feature_repository.dart';

class MainBloc {
  final FeatureRepository _featureRepository;

  //final StreamController<int> _eventsController = StreamController();

  MainBloc({
    required FeatureRepository featureRepository,
  }) : _featureRepository = featureRepository;

  Future<List<ProductEntity>> getAllProducts(int page) async {
    var(Failure? e , List<ProductEntity>? lp) = await _featureRepository.getAllProducts(page);
    if(lp!=null)return lp;
    if(e!=null) throw(e);
    throw('Что-то пошло не так...');
  }
  Future<List<ProductEntity>> searchProduct(int id) async {
    var(Failure? e , List<ProductEntity>? lp) = await _featureRepository.searchProduct(id);
    if(lp!=null)return lp;
    if(e!=null) throw(e);
    throw('Что-то пошло не так...');
  }
  // void add(int event){
  //   if(_eventsController.isClosed) return;
  //   _eventsController.add(event);
  // }
  //
  // int getIncrementalValue(){
  //   _abstractClassIncrement.incrementValue();
  //   return _abstractClassIncrement.value;
  // }

  void dispose(){
  }
}