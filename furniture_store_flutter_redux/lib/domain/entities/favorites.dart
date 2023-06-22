
abstract class FavoritesEntity{

  int id;

  FavoritesEntity(this.id);


  @override
  bool operator ==(Object other) {
    return identical(this, other);
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return '$id';
  }
}