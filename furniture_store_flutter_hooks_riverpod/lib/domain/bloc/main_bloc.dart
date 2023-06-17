
import 'package:furniture_store/core/error/failure.dart';
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:furniture_store/domain/repositories/repositories.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainStatus {

  final bool timeOut;
  final List<ProductEntity> lpAll;
  final List<ProductEntity> lpSingle;
  final Failure e;

  MainStatus({
    required this.timeOut,
    required this.lpAll,
    required this.lpSingle,
    required this.e
  });

  bool get isLoaded => lpAll.isNotEmpty;
  bool get isLoadedSingle => lpSingle.isNotEmpty;
  bool get isError => e!=NoFailure();

  MainStatus copyWith({
    bool? timeOut,
    List<ProductEntity>? lpAll,
    List<ProductEntity>? lpSingle,
    Failure? e,
  }) {
    return MainStatus(
      timeOut: timeOut ?? this.timeOut,
      lpAll: lpAll ?? this.lpAll,
      lpSingle: lpSingle ?? this.lpSingle,
      e: e ?? this.e,
    );
  }


}



class MainBloc extends StateNotifier<MainStatus> {

  final FeatureRepository _featureRepository;

  MainBloc({
    required FeatureRepository featureRepository,
  }) : _featureRepository = featureRepository, super(
      MainStatus(
        e: NoFailure(), timeOut: false, lpAll: [], lpSingle: []
      )
  ) {
    getAllProducts(0);
  }



  Future<void> getAllProducts(int page) async {

    var(Failure? err , List<ProductEntity>? lp, bool timeOut) = await _getProduct(() => _featureRepository.getAllProducts(page));

    if(lp!=null){state = state.copyWith(lpAll: lp, timeOut: timeOut, e: NoFailure()); return;}
    if(err !=null){state = state.copyWith(timeOut: timeOut, e: err); return;}
  }

  Future<void> searchProduct(int id) async {

    var(Failure? err , List<ProductEntity>? lp, bool timeOut) = await _getProduct(() => _featureRepository.searchProduct(id));

    if(lp!=null){state = state.copyWith(lpSingle: lp, timeOut: timeOut, e: NoFailure()); return;}
    if(err!=null){state = state.copyWith(timeOut: timeOut, e: err); return;}
  }

  Future<(Failure?, List<ProductEntity>?, bool)> _getProduct(Future<(Failure?, List<ProductEntity>?)> Function() getProducts) async {
    try {
      bool timeOut = false;
      var (Failure? e, List<ProductEntity>? lp,) = await getProducts()
         .timeout(const Duration(seconds: 5),
           onTimeout: () {
             timeOut  = true;
             return ( MainBlocFailure(),  null);
           });
      if (lp != null) {
        return (null, lp, timeOut);
      }
      if (e != null) {
        return (e, null, timeOut);
      }
    } catch (e){//все ошибки отловим
      //что то тут сделаем но потом...
      return ( MainBlocFailure(),  null, true);
    }
    return (null, null, false);//что то пошло не так
  }

}