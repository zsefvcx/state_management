// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_basket_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShoppingBasketBlocState {
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
abstract class $ShoppingBasketBlocStateCopyWith<$Res> {
  factory $ShoppingBasketBlocStateCopyWith(ShoppingBasketBlocState value,
          $Res Function(ShoppingBasketBlocState) then) =
      _$ShoppingBasketBlocStateCopyWithImpl<$Res, ShoppingBasketBlocState>;
}

/// @nodoc
class _$ShoppingBasketBlocStateCopyWithImpl<$Res,
        $Val extends ShoppingBasketBlocState>
    implements $ShoppingBasketBlocStateCopyWith<$Res> {
  _$ShoppingBasketBlocStateCopyWithImpl(this._value, this._then);

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
    extends _$ShoppingBasketBlocStateCopyWithImpl<$Res, _$_loadingState>
    implements _$$_loadingStateCopyWith<$Res> {
  __$$_loadingStateCopyWithImpl(
      _$_loadingState _value, $Res Function(_$_loadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_loadingState with DiagnosticableTreeMixin implements _loadingState {
  const _$_loadingState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ShoppingBasketBlocState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'ShoppingBasketBlocState.loading'));
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

abstract class _loadingState implements ShoppingBasketBlocState {
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
    extends _$ShoppingBasketBlocStateCopyWithImpl<$Res, _$_loadedState>
    implements _$$_loadedStateCopyWith<$Res> {
  __$$_loadedStateCopyWithImpl(
      _$_loadedState _value, $Res Function(_$_loadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$_loadedState(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as ShoppingBasketModel,
    ));
  }
}

/// @nodoc

class _$_loadedState with DiagnosticableTreeMixin implements _loadedState {
  const _$_loadedState({required this.model});

  @override
  final ShoppingBasketModel model;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ShoppingBasketBlocState.loaded(model: $model)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ShoppingBasketBlocState.loaded'))
      ..add(DiagnosticsProperty('model', model));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_loadedState &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

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

abstract class _loadedState implements ShoppingBasketBlocState {
  const factory _loadedState({required final ShoppingBasketModel model}) =
      _$_loadedState;

  ShoppingBasketModel get model;
  @JsonKey(ignore: true)
  _$$_loadedStateCopyWith<_$_loadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ShoppingBasketBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() remAll,
    required TResult Function(int id) addBas,
    required TResult Function(int id) remBas,
    required TResult Function(int id, dynamic required, int value) setCountBas,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? remAll,
    TResult? Function(int id)? addBas,
    TResult? Function(int id)? remBas,
    TResult? Function(int id, dynamic required, int value)? setCountBas,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? remAll,
    TResult Function(int id)? addBas,
    TResult Function(int id)? remBas,
    TResult Function(int id, dynamic required, int value)? setCountBas,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_remAllEvent value) remAll,
    required TResult Function(_addBasSetEvent value) addBas,
    required TResult Function(_remBasSetEvent value) remBas,
    required TResult Function(_setCountBas value) setCountBas,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_remAllEvent value)? remAll,
    TResult? Function(_addBasSetEvent value)? addBas,
    TResult? Function(_remBasSetEvent value)? remBas,
    TResult? Function(_setCountBas value)? setCountBas,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_remAllEvent value)? remAll,
    TResult Function(_addBasSetEvent value)? addBas,
    TResult Function(_remBasSetEvent value)? remBas,
    TResult Function(_setCountBas value)? setCountBas,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingBasketBlocEventCopyWith<$Res> {
  factory $ShoppingBasketBlocEventCopyWith(ShoppingBasketBlocEvent value,
          $Res Function(ShoppingBasketBlocEvent) then) =
      _$ShoppingBasketBlocEventCopyWithImpl<$Res, ShoppingBasketBlocEvent>;
}

/// @nodoc
class _$ShoppingBasketBlocEventCopyWithImpl<$Res,
        $Val extends ShoppingBasketBlocEvent>
    implements $ShoppingBasketBlocEventCopyWith<$Res> {
  _$ShoppingBasketBlocEventCopyWithImpl(this._value, this._then);

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
    extends _$ShoppingBasketBlocEventCopyWithImpl<$Res, _$_initEvent>
    implements _$$_initEventCopyWith<$Res> {
  __$$_initEventCopyWithImpl(
      _$_initEvent _value, $Res Function(_$_initEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_initEvent with DiagnosticableTreeMixin implements _initEvent {
  const _$_initEvent();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ShoppingBasketBlocEvent.init()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ShoppingBasketBlocEvent.init'));
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
    required TResult Function(int id) addBas,
    required TResult Function(int id) remBas,
    required TResult Function(int id, dynamic required, int value) setCountBas,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? remAll,
    TResult? Function(int id)? addBas,
    TResult? Function(int id)? remBas,
    TResult? Function(int id, dynamic required, int value)? setCountBas,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? remAll,
    TResult Function(int id)? addBas,
    TResult Function(int id)? remBas,
    TResult Function(int id, dynamic required, int value)? setCountBas,
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
    required TResult Function(_addBasSetEvent value) addBas,
    required TResult Function(_remBasSetEvent value) remBas,
    required TResult Function(_setCountBas value) setCountBas,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_remAllEvent value)? remAll,
    TResult? Function(_addBasSetEvent value)? addBas,
    TResult? Function(_remBasSetEvent value)? remBas,
    TResult? Function(_setCountBas value)? setCountBas,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_remAllEvent value)? remAll,
    TResult Function(_addBasSetEvent value)? addBas,
    TResult Function(_remBasSetEvent value)? remBas,
    TResult Function(_setCountBas value)? setCountBas,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _initEvent implements ShoppingBasketBlocEvent {
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
    extends _$ShoppingBasketBlocEventCopyWithImpl<$Res, _$_remAllEvent>
    implements _$$_remAllEventCopyWith<$Res> {
  __$$_remAllEventCopyWithImpl(
      _$_remAllEvent _value, $Res Function(_$_remAllEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_remAllEvent with DiagnosticableTreeMixin implements _remAllEvent {
  const _$_remAllEvent();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ShoppingBasketBlocEvent.remAll()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'ShoppingBasketBlocEvent.remAll'));
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
    required TResult Function(int id) addBas,
    required TResult Function(int id) remBas,
    required TResult Function(int id, dynamic required, int value) setCountBas,
  }) {
    return remAll();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? remAll,
    TResult? Function(int id)? addBas,
    TResult? Function(int id)? remBas,
    TResult? Function(int id, dynamic required, int value)? setCountBas,
  }) {
    return remAll?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? remAll,
    TResult Function(int id)? addBas,
    TResult Function(int id)? remBas,
    TResult Function(int id, dynamic required, int value)? setCountBas,
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
    required TResult Function(_addBasSetEvent value) addBas,
    required TResult Function(_remBasSetEvent value) remBas,
    required TResult Function(_setCountBas value) setCountBas,
  }) {
    return remAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_remAllEvent value)? remAll,
    TResult? Function(_addBasSetEvent value)? addBas,
    TResult? Function(_remBasSetEvent value)? remBas,
    TResult? Function(_setCountBas value)? setCountBas,
  }) {
    return remAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_remAllEvent value)? remAll,
    TResult Function(_addBasSetEvent value)? addBas,
    TResult Function(_remBasSetEvent value)? remBas,
    TResult Function(_setCountBas value)? setCountBas,
    required TResult orElse(),
  }) {
    if (remAll != null) {
      return remAll(this);
    }
    return orElse();
  }
}

abstract class _remAllEvent implements ShoppingBasketBlocEvent {
  const factory _remAllEvent() = _$_remAllEvent;
}

/// @nodoc
abstract class _$$_addBasSetEventCopyWith<$Res> {
  factory _$$_addBasSetEventCopyWith(
          _$_addBasSetEvent value, $Res Function(_$_addBasSetEvent) then) =
      __$$_addBasSetEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_addBasSetEventCopyWithImpl<$Res>
    extends _$ShoppingBasketBlocEventCopyWithImpl<$Res, _$_addBasSetEvent>
    implements _$$_addBasSetEventCopyWith<$Res> {
  __$$_addBasSetEventCopyWithImpl(
      _$_addBasSetEvent _value, $Res Function(_$_addBasSetEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_addBasSetEvent(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_addBasSetEvent
    with DiagnosticableTreeMixin
    implements _addBasSetEvent {
  const _$_addBasSetEvent({required this.id});

  @override
  final int id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ShoppingBasketBlocEvent.addBas(id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ShoppingBasketBlocEvent.addBas'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_addBasSetEvent &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_addBasSetEventCopyWith<_$_addBasSetEvent> get copyWith =>
      __$$_addBasSetEventCopyWithImpl<_$_addBasSetEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() remAll,
    required TResult Function(int id) addBas,
    required TResult Function(int id) remBas,
    required TResult Function(int id, dynamic required, int value) setCountBas,
  }) {
    return addBas(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? remAll,
    TResult? Function(int id)? addBas,
    TResult? Function(int id)? remBas,
    TResult? Function(int id, dynamic required, int value)? setCountBas,
  }) {
    return addBas?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? remAll,
    TResult Function(int id)? addBas,
    TResult Function(int id)? remBas,
    TResult Function(int id, dynamic required, int value)? setCountBas,
    required TResult orElse(),
  }) {
    if (addBas != null) {
      return addBas(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_remAllEvent value) remAll,
    required TResult Function(_addBasSetEvent value) addBas,
    required TResult Function(_remBasSetEvent value) remBas,
    required TResult Function(_setCountBas value) setCountBas,
  }) {
    return addBas(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_remAllEvent value)? remAll,
    TResult? Function(_addBasSetEvent value)? addBas,
    TResult? Function(_remBasSetEvent value)? remBas,
    TResult? Function(_setCountBas value)? setCountBas,
  }) {
    return addBas?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_remAllEvent value)? remAll,
    TResult Function(_addBasSetEvent value)? addBas,
    TResult Function(_remBasSetEvent value)? remBas,
    TResult Function(_setCountBas value)? setCountBas,
    required TResult orElse(),
  }) {
    if (addBas != null) {
      return addBas(this);
    }
    return orElse();
  }
}

abstract class _addBasSetEvent implements ShoppingBasketBlocEvent {
  const factory _addBasSetEvent({required final int id}) = _$_addBasSetEvent;

  int get id;
  @JsonKey(ignore: true)
  _$$_addBasSetEventCopyWith<_$_addBasSetEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_remBasSetEventCopyWith<$Res> {
  factory _$$_remBasSetEventCopyWith(
          _$_remBasSetEvent value, $Res Function(_$_remBasSetEvent) then) =
      __$$_remBasSetEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_remBasSetEventCopyWithImpl<$Res>
    extends _$ShoppingBasketBlocEventCopyWithImpl<$Res, _$_remBasSetEvent>
    implements _$$_remBasSetEventCopyWith<$Res> {
  __$$_remBasSetEventCopyWithImpl(
      _$_remBasSetEvent _value, $Res Function(_$_remBasSetEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_remBasSetEvent(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_remBasSetEvent
    with DiagnosticableTreeMixin
    implements _remBasSetEvent {
  const _$_remBasSetEvent({required this.id});

  @override
  final int id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ShoppingBasketBlocEvent.remBas(id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ShoppingBasketBlocEvent.remBas'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_remBasSetEvent &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_remBasSetEventCopyWith<_$_remBasSetEvent> get copyWith =>
      __$$_remBasSetEventCopyWithImpl<_$_remBasSetEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() remAll,
    required TResult Function(int id) addBas,
    required TResult Function(int id) remBas,
    required TResult Function(int id, dynamic required, int value) setCountBas,
  }) {
    return remBas(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? remAll,
    TResult? Function(int id)? addBas,
    TResult? Function(int id)? remBas,
    TResult? Function(int id, dynamic required, int value)? setCountBas,
  }) {
    return remBas?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? remAll,
    TResult Function(int id)? addBas,
    TResult Function(int id)? remBas,
    TResult Function(int id, dynamic required, int value)? setCountBas,
    required TResult orElse(),
  }) {
    if (remBas != null) {
      return remBas(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_remAllEvent value) remAll,
    required TResult Function(_addBasSetEvent value) addBas,
    required TResult Function(_remBasSetEvent value) remBas,
    required TResult Function(_setCountBas value) setCountBas,
  }) {
    return remBas(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_remAllEvent value)? remAll,
    TResult? Function(_addBasSetEvent value)? addBas,
    TResult? Function(_remBasSetEvent value)? remBas,
    TResult? Function(_setCountBas value)? setCountBas,
  }) {
    return remBas?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_remAllEvent value)? remAll,
    TResult Function(_addBasSetEvent value)? addBas,
    TResult Function(_remBasSetEvent value)? remBas,
    TResult Function(_setCountBas value)? setCountBas,
    required TResult orElse(),
  }) {
    if (remBas != null) {
      return remBas(this);
    }
    return orElse();
  }
}

abstract class _remBasSetEvent implements ShoppingBasketBlocEvent {
  const factory _remBasSetEvent({required final int id}) = _$_remBasSetEvent;

  int get id;
  @JsonKey(ignore: true)
  _$$_remBasSetEventCopyWith<_$_remBasSetEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_setCountBasCopyWith<$Res> {
  factory _$$_setCountBasCopyWith(
          _$_setCountBas value, $Res Function(_$_setCountBas) then) =
      __$$_setCountBasCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, dynamic required, int value});
}

/// @nodoc
class __$$_setCountBasCopyWithImpl<$Res>
    extends _$ShoppingBasketBlocEventCopyWithImpl<$Res, _$_setCountBas>
    implements _$$_setCountBasCopyWith<$Res> {
  __$$_setCountBasCopyWithImpl(
      _$_setCountBas _value, $Res Function(_$_setCountBas) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? required = freezed,
    Object? value = null,
  }) {
    return _then(_$_setCountBas(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      required: freezed == required ? _value.required! : required,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_setCountBas with DiagnosticableTreeMixin implements _setCountBas {
  const _$_setCountBas({required this.id, this.required, required this.value});

  @override
  final int id;
  @override
  final dynamic required;
  @override
  final int value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ShoppingBasketBlocEvent.setCountBas(id: $id, required: $required, value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ShoppingBasketBlocEvent.setCountBas'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('required', required))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_setCountBas &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.required, required) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(required), value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_setCountBasCopyWith<_$_setCountBas> get copyWith =>
      __$$_setCountBasCopyWithImpl<_$_setCountBas>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() remAll,
    required TResult Function(int id) addBas,
    required TResult Function(int id) remBas,
    required TResult Function(int id, dynamic required, int value) setCountBas,
  }) {
    return setCountBas(id, required, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? remAll,
    TResult? Function(int id)? addBas,
    TResult? Function(int id)? remBas,
    TResult? Function(int id, dynamic required, int value)? setCountBas,
  }) {
    return setCountBas?.call(id, required, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? remAll,
    TResult Function(int id)? addBas,
    TResult Function(int id)? remBas,
    TResult Function(int id, dynamic required, int value)? setCountBas,
    required TResult orElse(),
  }) {
    if (setCountBas != null) {
      return setCountBas(id, required, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_remAllEvent value) remAll,
    required TResult Function(_addBasSetEvent value) addBas,
    required TResult Function(_remBasSetEvent value) remBas,
    required TResult Function(_setCountBas value) setCountBas,
  }) {
    return setCountBas(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_remAllEvent value)? remAll,
    TResult? Function(_addBasSetEvent value)? addBas,
    TResult? Function(_remBasSetEvent value)? remBas,
    TResult? Function(_setCountBas value)? setCountBas,
  }) {
    return setCountBas?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_remAllEvent value)? remAll,
    TResult Function(_addBasSetEvent value)? addBas,
    TResult Function(_remBasSetEvent value)? remBas,
    TResult Function(_setCountBas value)? setCountBas,
    required TResult orElse(),
  }) {
    if (setCountBas != null) {
      return setCountBas(this);
    }
    return orElse();
  }
}

abstract class _setCountBas implements ShoppingBasketBlocEvent {
  const factory _setCountBas(
      {required final int id,
      final dynamic required,
      required final int value}) = _$_setCountBas;

  int get id;
  dynamic get required;
  int get value;
  @JsonKey(ignore: true)
  _$$_setCountBasCopyWith<_$_setCountBas> get copyWith =>
      throw _privateConstructorUsedError;
}
