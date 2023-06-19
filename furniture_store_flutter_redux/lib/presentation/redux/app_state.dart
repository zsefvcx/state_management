
import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';

class FavoritesAppState extends Equatable{
  final Map<int, FavoritesEntity> model;
  final bool isLoaded;
  final List<bool> isFav;

  const FavoritesAppState({required this.model, required this.isLoaded, required this.isFav});

  factory FavoritesAppState.initial() => const FavoritesAppState(model: {}, isLoaded: false, isFav: []);

  FavoritesAppState copyWith({
    Map<int, FavoritesEntity>? model,
    bool? isLoaded,
    List<bool>? isFav,
  }) {
    return FavoritesAppState(
      model: model ?? this.model,
      isLoaded: isLoaded ?? this.isLoaded,
      isFav: isFav ?? this.isFav,

    );
  }

  @override
  List<Object?> get props => [model, isLoaded];

  @override
  bool get stringify => true;

  // @override
  // String toString() {
  //   return '$id) $title - $price';
  // }
}