
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store/core/error/failure.dart';
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:furniture_store/domain/repositories/repositories.dart';

class MainBloc extends StateNotifier<int> {

  final FeatureRepository _featureRepository;

  bool _timeOut = true;
  bool _loading = false;
  List<ProductEntity> _lpAll = [];
  List<ProductEntity> _lpSingle = [];

  Failure? _e;

  bool get isLoaded => _lpAll.isNotEmpty;
  bool get isLoading => _loading;
  bool get isTimeOut => _timeOut;
  bool get isLoadedSingle => _lpSingle.isNotEmpty;
  bool get isError => e!=null;
  List<ProductEntity> get lpAll => _lpAll;
  List<ProductEntity> get lpSingle => _lpSingle;
  Failure? get e => _e;

  MainBloc({
    required FeatureRepository featureRepository,
  }) : _featureRepository = featureRepository, super(0) {
    getAllProducts(0);
  }

  Future<void> getAllProducts(int page) async {
    _lpAll.clear();
    var(Failure? e , List<ProductEntity>? lp) = await _getProduct(() => _featureRepository.getAllProducts(page));

    if(lp!=null){_lpAll = lp; state++; return;}
    if(e !=null){ _e = e;     state++; return;}
  }

  Future<void> searchProduct(int id) async {
    _lpSingle.clear();
    var(Failure? e , List<ProductEntity>? lp) = await _getProduct(() => _featureRepository.searchProduct(id));

    if(lp!=null){_lpSingle = lp; state++; return;}
    if(e!=null){ _e = e;         state++; return;}
  }

  Future<(Failure?, List<ProductEntity>?)> _getProduct(Future<(Failure?, List<ProductEntity>?)> Function() getProducts) async {
    try {
      _timeOut = false; _e = null; _loading = true;
      var (Failure? e, List<ProductEntity>? lp) = await getProducts()
         .timeout(const Duration(seconds: 5),
           onTimeout: () {
             _timeOut  = true; _loading = false;
             return ( MainBlocFailure(),  null);
           });
      _loading = false;
      if (lp != null) {
        return (null, lp);
      }
      if (e != null) {
        return (e, null);
      }
    } catch (e){//все ошибки отловим
      //что то тут сделаем но потом...
      return ( MainBlocFailure(),  null);
    }
    return (null ,null);//что то пошло не так
  }

}