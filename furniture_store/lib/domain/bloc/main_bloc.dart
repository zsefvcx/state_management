
import 'package:flutter/material.dart';
import 'package:furniture_store/core/error/failure.dart';
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:furniture_store/domain/repositories/feature_repository.dart';

class MainBloc  with ChangeNotifier{
  final FeatureRepository _featureRepository;

  bool get isLoaded => _lpAll.isNotEmpty;
  bool get isLoadedSingle => _lpSingle.isNotEmpty;

  List<ProductEntity> _lpAll = [];
  List<ProductEntity> _lpSingle = [];
  Failure? _e;

  List<ProductEntity> get lpAll => _lpAll;
  List<ProductEntity> get lpSingle => _lpSingle;
  Failure? get e => _e;

  MainBloc({
    required FeatureRepository featureRepository,
  }) : _featureRepository = featureRepository;

  Future<void> getAllProducts(int page) async {
    var(Failure? e , List<ProductEntity>? lp) = await _getProduct(() => _featureRepository.getAllProducts(page));
    _lpAll.clear();
    if(lp!=null){_lpAll = lp;notifyListeners(); return;}
    if(e!=null){ _e = e;notifyListeners();return;}
  }
  Future<void> searchProduct(int id) async {
    var(Failure? e , List<ProductEntity>? lp) = await _getProduct(() => _featureRepository.searchProduct(id));
    _lpSingle.clear();
    if(lp!=null){_lpSingle = lp;notifyListeners(); return;}
    if(e!=null){ _e = e;notifyListeners();return;}
  }

  Future<(Failure?, List<ProductEntity>?)> _getProduct(Future<(Failure?, List<ProductEntity>?)> Function() getProducts) async {
    var(Failure? e , List<ProductEntity>? lp) = await getProducts();
    if(lp!=null){return (null, lp);}
    if(e!=null) {return (e,  null);}
    throw('Что-то пошло не так...');
  }

}