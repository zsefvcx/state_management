
import 'package:equatable/equatable.dart';
import 'package:furniture_store/domain/entities/entities.dart';


abstract class AppState<T> extends Equatable{

  final Map<int, T> model;

  const AppState({required this.model});

  AppState<T> copyWith({
    Map<int, T>? model,
  });

  @override
  List<Object?> get props => [model];

  @override
  bool get stringify => true;

// @override
// String toString() {
//   return '$id) $title - $price';
// }
}

class FavoritesAppState extends AppState<FavoritesEntity>{

  const FavoritesAppState({required super.model});

  factory FavoritesAppState.initial() => const FavoritesAppState(model: {});

  @override
  FavoritesAppState copyWith({
    Map<int, FavoritesEntity>? model,
  }) {
    return FavoritesAppState(
      model: model ?? this.model,
    );
  }


}

class ShoppingBasketAppState extends AppState<ShoppingBasketEntity>{

  const ShoppingBasketAppState({required super.model});

  factory ShoppingBasketAppState.initial() => const ShoppingBasketAppState(model: {});

  @override
  ShoppingBasketAppState copyWith({
    Map<int, ShoppingBasketEntity>? model,
  }) {
    return ShoppingBasketAppState(
      model: model ?? this.model,
    );
  }

  @override
  List<Object?> get props => [model];

  @override
  bool get stringify => true;

// @override
// String toString() {
//   return '$id) $title - $price';
// }
}

class MainAppState extends Equatable{

  final bool isTimeOut;
  final bool isError;
  final List<ProductEntity> lpAll;
  final List<ProductEntity> lpSingle;
  final String e;

  bool get isLoaded => lpAll.isNotEmpty;

  const MainAppState({
    required this.e,
    required this.isTimeOut,
    required this.isError,
    required this.lpAll,
    required this.lpSingle
  });

  factory MainAppState.initial() => const MainAppState(
    isError: false,
    isTimeOut: false,
    lpAll: [],
    lpSingle: [],
    e: '',
  );

  MainAppState copyWith({
    bool? isTimeOut,
    bool? isError,
    List<ProductEntity>? lpAll,
    List<ProductEntity>? lpSingle,
    String? e,
  }) {
    return MainAppState(
      lpAll: lpAll ?? this.lpAll,
      lpSingle: lpSingle ?? this.lpAll,
      isError: isError ?? this.isError,
      isTimeOut:   isTimeOut ?? this.isTimeOut,
      e: e ?? this.e,
    );
  }

  @override
  List<Object?> get props => [isTimeOut, isError, lpAll, lpSingle];

  @override
  bool get stringify => true;

// @override
// String toString() {
//   return '$id) $title - $price';
// }

}