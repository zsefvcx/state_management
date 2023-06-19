
import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';

class FavoritesAppState extends Equatable{
  final Map<int, FavoritesEntity> model;
  final bool isLoaded;

  bool statusFav(int id) => model[id]!=null;

  const FavoritesAppState({required this.model, required this.isLoaded});

  factory FavoritesAppState.initial() => const FavoritesAppState(model: {}, isLoaded: false);

  FavoritesAppState copyWith({
    Map<int, FavoritesEntity>? model,
    bool? isLoaded,
  }) {
    return FavoritesAppState(
      model: model ?? this.model,
      isLoaded: isLoaded ?? this.isLoaded,
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