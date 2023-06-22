// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainBlocState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(ShoppingBasketModel model) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(ShoppingBasketModel model)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ShoppingBasketModel model)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_loadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_loadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_loadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainBlocStateCopyWith<$Res> {
  factory $MainBlocStateCopyWith(
          MainBlocState value, $Res Function(MainBlocState) then) =
      _$MainBlocStateCopyWithImpl<$Res, MainBlocState>;
}

/// @nodoc
class _$MainBlocStateCopyWithImpl<$Res, $Val extends MainBlocState>
    implements $MainBlocStateCopyWith<$Res> {
  _$MainBlocStateCopyWithImpl(this._value, this._then);

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
    extends _$MainBlocStateCopyWithImpl<$Res, _$_loadingState>
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
    return 'MainBlocState.loading()';
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
    required TResult Function(ShoppingBasketModel model) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(ShoppingBasketModel model)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ShoppingBasketModel model)? loaded,
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
    required TResult Function(_loadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_loadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_loadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _loadingState implements MainBlocState {
  const factory _loadingState() = _$_loadingState;
}

/// @nodoc
abstract class _$$_loadedStateCopyWith<$Res> {
  factory _$$_loadedStateCopyWith(
          _$_loadedState value, $Res Function(_$_loadedState) then) =
      __$$_loadedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({ShoppingBasketModel model});
}

/// @nodoc
class __$$_loadedStateCopyWithImpl<$Res>
    extends _$MainBlocStateCopyWithImpl<$Res, _$_loadedState>
    implements _$$_loadedStateCopyWith<$Res> {
  __$$_loadedStateCopyWithImpl(
      _$_loadedState _value, $Res Function(_$_loadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
  }) {
    return _then(_$_loadedState(
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as ShoppingBasketModel,
    ));
  }
}

/// @nodoc

class _$_loadedState implements _loadedState {
  const _$_loadedState({required this.model});

  @override
  final ShoppingBasketModel model;

  @override
  String toString() {
    return 'MainBlocState.loaded(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_loadedState &&
            const DeepCollectionEquality().equals(other.model, model));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(model));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_loadedStateCopyWith<_$_loadedState> get copyWith =>
      __$$_loadedStateCopyWithImpl<_$_loadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(ShoppingBasketModel model) loaded,
  }) {
    return loaded(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(ShoppingBasketModel model)? loaded,
  }) {
    return loaded?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ShoppingBasketModel model)? loaded,
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
    required TResult Function(_loadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_loadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_loadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _loadedState implements MainBlocState {
  const factory _loadedState({required final ShoppingBasketModel model}) =
      _$_loadedState;

  ShoppingBasketModel get model;
  @JsonKey(ignore: true)
  _$$_loadedStateCopyWith<_$_loadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MainBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() remAll,
    required TResult Function(int id) getAllProducts,
    required TResult Function(int id) searchProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? remAll,
    TResult? Function(int id)? getAllProducts,
    TResult? Function(int id)? searchProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? remAll,
    TResult Function(int id)? getAllProducts,
    TResult Function(int id)? searchProduct,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_remAllEvent value) remAll,
    required TResult Function(_getAllProductsEvent value) getAllProducts,
    required TResult Function(_searchProductEvent value) searchProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_remAllEvent value)? remAll,
    TResult? Function(_getAllProductsEvent value)? getAllProducts,
    TResult? Function(_searchProductEvent value)? searchProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_remAllEvent value)? remAll,
    TResult Function(_getAllProductsEvent value)? getAllProducts,
    TResult Function(_searchProductEvent value)? searchProduct,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainBlocEventCopyWith<$Res> {
  factory $MainBlocEventCopyWith(
          MainBlocEvent value, $Res Function(MainBlocEvent) then) =
      _$MainBlocEventCopyWithImpl<$Res, MainBlocEvent>;
}

/// @nodoc
class _$MainBlocEventCopyWithImpl<$Res, $Val extends MainBlocEvent>
    implements $MainBlocEventCopyWith<$Res> {
  _$MainBlocEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_initEventCopyWith<$Res> {
  factory _$$_initEventCopyWith(
          _$_initEvent value, $Res Function(_$_initEvent) then) =
      __$$_initEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_initEventCopyWithImpl<$Res>
    extends _$MainBlocEventCopyWithImpl<$Res, _$_initEvent>
    implements _$$_initEventCopyWith<$Res> {
  __$$_initEventCopyWithImpl(
      _$_initEvent _value, $Res Function(_$_initEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_initEvent implements _initEvent {
  const _$_initEvent();

  @override
  String toString() {
    return 'MainBlocEvent.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_initEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() remAll,
    required TResult Function(int id) getAllProducts,
    required TResult Function(int id) searchProduct,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? remAll,
    TResult? Function(int id)? getAllProducts,
    TResult? Function(int id)? searchProduct,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? remAll,
    TResult Function(int id)? getAllProducts,
    TResult Function(int id)? searchProduct,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_remAllEvent value) remAll,
    required TResult Function(_getAllProductsEvent value) getAllProducts,
    required TResult Function(_searchProductEvent value) searchProduct,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_remAllEvent value)? remAll,
    TResult? Function(_getAllProductsEvent value)? getAllProducts,
    TResult? Function(_searchProductEvent value)? searchProduct,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_remAllEvent value)? remAll,
    TResult Function(_getAllProductsEvent value)? getAllProducts,
    TResult Function(_searchProductEvent value)? searchProduct,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _initEvent implements MainBlocEvent {
  const factory _initEvent() = _$_initEvent;
}

/// @nodoc
abstract class _$$_remAllEventCopyWith<$Res> {
  factory _$$_remAllEventCopyWith(
          _$_remAllEvent value, $Res Function(_$_remAllEvent) then) =
      __$$_remAllEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_remAllEventCopyWithImpl<$Res>
    extends _$MainBlocEventCopyWithImpl<$Res, _$_remAllEvent>
    implements _$$_remAllEventCopyWith<$Res> {
  __$$_remAllEventCopyWithImpl(
      _$_remAllEvent _value, $Res Function(_$_remAllEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_remAllEvent implements _remAllEvent {
  const _$_remAllEvent();

  @override
  String toString() {
    return 'MainBlocEvent.remAll()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_remAllEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() remAll,
    required TResult Function(int id) getAllProducts,
    required TResult Function(int id) searchProduct,
  }) {
    return remAll();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? remAll,
    TResult? Function(int id)? getAllProducts,
    TResult? Function(int id)? searchProduct,
  }) {
    return remAll?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? remAll,
    TResult Function(int id)? getAllProducts,
    TResult Function(int id)? searchProduct,
    required TResult orElse(),
  }) {
    if (remAll != null) {
      return remAll();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_remAllEvent value) remAll,
    required TResult Function(_getAllProductsEvent value) getAllProducts,
    required TResult Function(_searchProductEvent value) searchProduct,
  }) {
    return remAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_remAllEvent value)? remAll,
    TResult? Function(_getAllProductsEvent value)? getAllProducts,
    TResult? Function(_searchProductEvent value)? searchProduct,
  }) {
    return remAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_remAllEvent value)? remAll,
    TResult Function(_getAllProductsEvent value)? getAllProducts,
    TResult Function(_searchProductEvent value)? searchProduct,
    required TResult orElse(),
  }) {
    if (remAll != null) {
      return remAll(this);
    }
    return orElse();
  }
}

abstract class _remAllEvent implements MainBlocEvent {
  const factory _remAllEvent() = _$_remAllEvent;
}

/// @nodoc
abstract class _$$_getAllProductsEventCopyWith<$Res> {
  factory _$$_getAllProductsEventCopyWith(_$_getAllProductsEvent value,
          $Res Function(_$_getAllProductsEvent) then) =
      __$$_getAllProductsEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_getAllProductsEventCopyWithImpl<$Res>
    extends _$MainBlocEventCopyWithImpl<$Res, _$_getAllProductsEvent>
    implements _$$_getAllProductsEventCopyWith<$Res> {
  __$$_getAllProductsEventCopyWithImpl(_$_getAllProductsEvent _value,
      $Res Function(_$_getAllProductsEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_getAllProductsEvent(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_getAllProductsEvent implements _getAllProductsEvent {
  const _$_getAllProductsEvent({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'MainBlocEvent.getAllProducts(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_getAllProductsEvent &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_getAllProductsEventCopyWith<_$_getAllProductsEvent> get copyWith =>
      __$$_getAllProductsEventCopyWithImpl<_$_getAllProductsEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() remAll,
    required TResult Function(int id) getAllProducts,
    required TResult Function(int id) searchProduct,
  }) {
    return getAllProducts(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? remAll,
    TResult? Function(int id)? getAllProducts,
    TResult? Function(int id)? searchProduct,
  }) {
    return getAllProducts?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? remAll,
    TResult Function(int id)? getAllProducts,
    TResult Function(int id)? searchProduct,
    required TResult orElse(),
  }) {
    if (getAllProducts != null) {
      return getAllProducts(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_remAllEvent value) remAll,
    required TResult Function(_getAllProductsEvent value) getAllProducts,
    required TResult Function(_searchProductEvent value) searchProduct,
  }) {
    return getAllProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_remAllEvent value)? remAll,
    TResult? Function(_getAllProductsEvent value)? getAllProducts,
    TResult? Function(_searchProductEvent value)? searchProduct,
  }) {
    return getAllProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_remAllEvent value)? remAll,
    TResult Function(_getAllProductsEvent value)? getAllProducts,
    TResult Function(_searchProductEvent value)? searchProduct,
    required TResult orElse(),
  }) {
    if (getAllProducts != null) {
      return getAllProducts(this);
    }
    return orElse();
  }
}

abstract class _getAllProductsEvent implements MainBlocEvent {
  const factory _getAllProductsEvent({required final int id}) =
      _$_getAllProductsEvent;

  int get id;
  @JsonKey(ignore: true)
  _$$_getAllProductsEventCopyWith<_$_getAllProductsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_searchProductEventCopyWith<$Res> {
  factory _$$_searchProductEventCopyWith(_$_searchProductEvent value,
          $Res Function(_$_searchProductEvent) then) =
      __$$_searchProductEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_searchProductEventCopyWithImpl<$Res>
    extends _$MainBlocEventCopyWithImpl<$Res, _$_searchProductEvent>
    implements _$$_searchProductEventCopyWith<$Res> {
  __$$_searchProductEventCopyWithImpl(
      _$_searchProductEvent _value, $Res Function(_$_searchProductEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_searchProductEvent(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_searchProductEvent implements _searchProductEvent {
  const _$_searchProductEvent({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'MainBlocEvent.searchProduct(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_searchProductEvent &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_searchProductEventCopyWith<_$_searchProductEvent> get copyWith =>
      __$$_searchProductEventCopyWithImpl<_$_searchProductEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() remAll,
    required TResult Function(int id) getAllProducts,
    required TResult Function(int id) searchProduct,
  }) {
    return searchProduct(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? remAll,
    TResult? Function(int id)? getAllProducts,
    TResult? Function(int id)? searchProduct,
  }) {
    return searchProduct?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? remAll,
    TResult Function(int id)? getAllProducts,
    TResult Function(int id)? searchProduct,
    required TResult orElse(),
  }) {
    if (searchProduct != null) {
      return searchProduct(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_remAllEvent value) remAll,
    required TResult Function(_getAllProductsEvent value) getAllProducts,
    required TResult Function(_searchProductEvent value) searchProduct,
  }) {
    return searchProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_remAllEvent value)? remAll,
    TResult? Function(_getAllProductsEvent value)? getAllProducts,
    TResult? Function(_searchProductEvent value)? searchProduct,
  }) {
    return searchProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_remAllEvent value)? remAll,
    TResult Function(_getAllProductsEvent value)? getAllProducts,
    TResult Function(_searchProductEvent value)? searchProduct,
    required TResult orElse(),
  }) {
    if (searchProduct != null) {
      return searchProduct(this);
    }
    return orElse();
  }
}

abstract class _searchProductEvent implements MainBlocEvent {
  const factory _searchProductEvent({required final int id}) =
      _$_searchProductEvent;

  int get id;
  @JsonKey(ignore: true)
  _$$_searchProductEventCopyWith<_$_searchProductEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
