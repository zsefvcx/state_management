// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorites_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavoritesBlocState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(MapFavoritesModel model) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(MapFavoritesModel model)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(MapFavoritesModel model)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_LoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_LoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_LoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritesBlocStateCopyWith<$Res> {
  factory $FavoritesBlocStateCopyWith(
          FavoritesBlocState value, $Res Function(FavoritesBlocState) then) =
      _$FavoritesBlocStateCopyWithImpl<$Res, FavoritesBlocState>;
}

/// @nodoc
class _$FavoritesBlocStateCopyWithImpl<$Res, $Val extends FavoritesBlocState>
    implements $FavoritesBlocStateCopyWith<$Res> {
  _$FavoritesBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_loadingStateCopyWith<$Res> {
  factory _$$_loadingStateCopyWith(
          _$_loadingState value, $Res Function(_$_loadingState) then) =
      __$$_loadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_loadingStateCopyWithImpl<$Res>
    extends _$FavoritesBlocStateCopyWithImpl<$Res, _$_loadingState>
    implements _$$_loadingStateCopyWith<$Res> {
  __$$_loadingStateCopyWithImpl(
      _$_loadingState _value, $Res Function(_$_loadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_loadingState implements _loadingState {
  const _$_loadingState();

  @override
  String toString() {
    return 'FavoritesBlocState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_loadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(MapFavoritesModel model) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(MapFavoritesModel model)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(MapFavoritesModel model)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_LoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_LoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_LoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _loadingState implements FavoritesBlocState {
  const factory _loadingState() = _$_loadingState;
}

/// @nodoc
abstract class _$$_LoadedStateCopyWith<$Res> {
  factory _$$_LoadedStateCopyWith(
          _$_LoadedState value, $Res Function(_$_LoadedState) then) =
      __$$_LoadedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({MapFavoritesModel model});
}

/// @nodoc
class __$$_LoadedStateCopyWithImpl<$Res>
    extends _$FavoritesBlocStateCopyWithImpl<$Res, _$_LoadedState>
    implements _$$_LoadedStateCopyWith<$Res> {
  __$$_LoadedStateCopyWithImpl(
      _$_LoadedState _value, $Res Function(_$_LoadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$_LoadedState(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as MapFavoritesModel,
    ));
  }
}

/// @nodoc

class _$_LoadedState implements _LoadedState {
  const _$_LoadedState({required this.model});

  @override
  final MapFavoritesModel model;

  @override
  String toString() {
    return 'FavoritesBlocState.loaded(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadedState &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedStateCopyWith<_$_LoadedState> get copyWith =>
      __$$_LoadedStateCopyWithImpl<_$_LoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(MapFavoritesModel model) loaded,
  }) {
    return loaded(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(MapFavoritesModel model)? loaded,
  }) {
    return loaded?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(MapFavoritesModel model)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_LoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_LoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_LoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _LoadedState implements FavoritesBlocState {
  const factory _LoadedState({required final MapFavoritesModel model}) =
      _$_LoadedState;

  MapFavoritesModel get model;
  @JsonKey(ignore: true)
  _$$_LoadedStateCopyWith<_$_LoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FavoritesBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fav,
    required TResult Function(int id) addFav,
    required TResult Function(int id) remFav,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fav,
    TResult? Function(int id)? addFav,
    TResult? Function(int id)? remFav,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fav,
    TResult Function(int id)? addFav,
    TResult Function(int id)? remFav,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FavEvent value) fav,
    required TResult Function(_AddFavSetEvent value) addFav,
    required TResult Function(_RemFavSetEvent value) remFav,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FavEvent value)? fav,
    TResult? Function(_AddFavSetEvent value)? addFav,
    TResult? Function(_RemFavSetEvent value)? remFav,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FavEvent value)? fav,
    TResult Function(_AddFavSetEvent value)? addFav,
    TResult Function(_RemFavSetEvent value)? remFav,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritesBlocEventCopyWith<$Res> {
  factory $FavoritesBlocEventCopyWith(
          FavoritesBlocEvent value, $Res Function(FavoritesBlocEvent) then) =
      _$FavoritesBlocEventCopyWithImpl<$Res, FavoritesBlocEvent>;
}

/// @nodoc
class _$FavoritesBlocEventCopyWithImpl<$Res, $Val extends FavoritesBlocEvent>
    implements $FavoritesBlocEventCopyWith<$Res> {
  _$FavoritesBlocEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_FavEventCopyWith<$Res> {
  factory _$$_FavEventCopyWith(
          _$_FavEvent value, $Res Function(_$_FavEvent) then) =
      __$$_FavEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FavEventCopyWithImpl<$Res>
    extends _$FavoritesBlocEventCopyWithImpl<$Res, _$_FavEvent>
    implements _$$_FavEventCopyWith<$Res> {
  __$$_FavEventCopyWithImpl(
      _$_FavEvent _value, $Res Function(_$_FavEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_FavEvent implements _FavEvent {
  const _$_FavEvent();

  @override
  String toString() {
    return 'FavoritesBlocEvent.fav()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_FavEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fav,
    required TResult Function(int id) addFav,
    required TResult Function(int id) remFav,
  }) {
    return fav();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fav,
    TResult? Function(int id)? addFav,
    TResult? Function(int id)? remFav,
  }) {
    return fav?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fav,
    TResult Function(int id)? addFav,
    TResult Function(int id)? remFav,
    required TResult orElse(),
  }) {
    if (fav != null) {
      return fav();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FavEvent value) fav,
    required TResult Function(_AddFavSetEvent value) addFav,
    required TResult Function(_RemFavSetEvent value) remFav,
  }) {
    return fav(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FavEvent value)? fav,
    TResult? Function(_AddFavSetEvent value)? addFav,
    TResult? Function(_RemFavSetEvent value)? remFav,
  }) {
    return fav?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FavEvent value)? fav,
    TResult Function(_AddFavSetEvent value)? addFav,
    TResult Function(_RemFavSetEvent value)? remFav,
    required TResult orElse(),
  }) {
    if (fav != null) {
      return fav(this);
    }
    return orElse();
  }
}

abstract class _FavEvent implements FavoritesBlocEvent {
  const factory _FavEvent() = _$_FavEvent;
}

/// @nodoc
abstract class _$$_AddFavSetEventCopyWith<$Res> {
  factory _$$_AddFavSetEventCopyWith(
          _$_AddFavSetEvent value, $Res Function(_$_AddFavSetEvent) then) =
      __$$_AddFavSetEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_AddFavSetEventCopyWithImpl<$Res>
    extends _$FavoritesBlocEventCopyWithImpl<$Res, _$_AddFavSetEvent>
    implements _$$_AddFavSetEventCopyWith<$Res> {
  __$$_AddFavSetEventCopyWithImpl(
      _$_AddFavSetEvent _value, $Res Function(_$_AddFavSetEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_AddFavSetEvent(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_AddFavSetEvent implements _AddFavSetEvent {
  const _$_AddFavSetEvent({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'FavoritesBlocEvent.addFav(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddFavSetEvent &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddFavSetEventCopyWith<_$_AddFavSetEvent> get copyWith =>
      __$$_AddFavSetEventCopyWithImpl<_$_AddFavSetEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fav,
    required TResult Function(int id) addFav,
    required TResult Function(int id) remFav,
  }) {
    return addFav(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fav,
    TResult? Function(int id)? addFav,
    TResult? Function(int id)? remFav,
  }) {
    return addFav?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fav,
    TResult Function(int id)? addFav,
    TResult Function(int id)? remFav,
    required TResult orElse(),
  }) {
    if (addFav != null) {
      return addFav(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FavEvent value) fav,
    required TResult Function(_AddFavSetEvent value) addFav,
    required TResult Function(_RemFavSetEvent value) remFav,
  }) {
    return addFav(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FavEvent value)? fav,
    TResult? Function(_AddFavSetEvent value)? addFav,
    TResult? Function(_RemFavSetEvent value)? remFav,
  }) {
    return addFav?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FavEvent value)? fav,
    TResult Function(_AddFavSetEvent value)? addFav,
    TResult Function(_RemFavSetEvent value)? remFav,
    required TResult orElse(),
  }) {
    if (addFav != null) {
      return addFav(this);
    }
    return orElse();
  }
}

abstract class _AddFavSetEvent implements FavoritesBlocEvent {
  const factory _AddFavSetEvent({required final int id}) = _$_AddFavSetEvent;

  int get id;
  @JsonKey(ignore: true)
  _$$_AddFavSetEventCopyWith<_$_AddFavSetEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RemFavSetEventCopyWith<$Res> {
  factory _$$_RemFavSetEventCopyWith(
          _$_RemFavSetEvent value, $Res Function(_$_RemFavSetEvent) then) =
      __$$_RemFavSetEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_RemFavSetEventCopyWithImpl<$Res>
    extends _$FavoritesBlocEventCopyWithImpl<$Res, _$_RemFavSetEvent>
    implements _$$_RemFavSetEventCopyWith<$Res> {
  __$$_RemFavSetEventCopyWithImpl(
      _$_RemFavSetEvent _value, $Res Function(_$_RemFavSetEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_RemFavSetEvent(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_RemFavSetEvent implements _RemFavSetEvent {
  const _$_RemFavSetEvent({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'FavoritesBlocEvent.remFav(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemFavSetEvent &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RemFavSetEventCopyWith<_$_RemFavSetEvent> get copyWith =>
      __$$_RemFavSetEventCopyWithImpl<_$_RemFavSetEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fav,
    required TResult Function(int id) addFav,
    required TResult Function(int id) remFav,
  }) {
    return remFav(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fav,
    TResult? Function(int id)? addFav,
    TResult? Function(int id)? remFav,
  }) {
    return remFav?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fav,
    TResult Function(int id)? addFav,
    TResult Function(int id)? remFav,
    required TResult orElse(),
  }) {
    if (remFav != null) {
      return remFav(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FavEvent value) fav,
    required TResult Function(_AddFavSetEvent value) addFav,
    required TResult Function(_RemFavSetEvent value) remFav,
  }) {
    return remFav(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FavEvent value)? fav,
    TResult? Function(_AddFavSetEvent value)? addFav,
    TResult? Function(_RemFavSetEvent value)? remFav,
  }) {
    return remFav?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FavEvent value)? fav,
    TResult Function(_AddFavSetEvent value)? addFav,
    TResult Function(_RemFavSetEvent value)? remFav,
    required TResult orElse(),
  }) {
    if (remFav != null) {
      return remFav(this);
    }
    return orElse();
  }
}

abstract class _RemFavSetEvent implements FavoritesBlocEvent {
  const factory _RemFavSetEvent({required final int id}) = _$_RemFavSetEvent;

  int get id;
  @JsonKey(ignore: true)
  _$$_RemFavSetEventCopyWith<_$_RemFavSetEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
