// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'versioning_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VersioningEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitEvent value) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitEvent value)? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitEvent value)? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VersioningEventCopyWith<$Res> {
  factory $VersioningEventCopyWith(
          VersioningEvent value, $Res Function(VersioningEvent) then) =
      _$VersioningEventCopyWithImpl<$Res, VersioningEvent>;
}

/// @nodoc
class _$VersioningEventCopyWithImpl<$Res, $Val extends VersioningEvent>
    implements $VersioningEventCopyWith<$Res> {
  _$VersioningEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitEventImplCopyWith<$Res> {
  factory _$$InitEventImplCopyWith(
          _$InitEventImpl value, $Res Function(_$InitEventImpl) then) =
      __$$InitEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitEventImplCopyWithImpl<$Res>
    extends _$VersioningEventCopyWithImpl<$Res, _$InitEventImpl>
    implements _$$InitEventImplCopyWith<$Res> {
  __$$InitEventImplCopyWithImpl(
      _$InitEventImpl _value, $Res Function(_$InitEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitEventImpl with DiagnosticableTreeMixin implements _InitEvent {
  const _$InitEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VersioningEvent.init()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'VersioningEvent.init'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
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
    required TResult Function(_InitEvent value) init,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitEvent value)? init,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitEvent value)? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _InitEvent implements VersioningEvent {
  const factory _InitEvent() = _$InitEventImpl;
}

/// @nodoc
mixin _$VersioningState {
  VersioningStatus get versioningStatus => throw _privateConstructorUsedError;
  CheckClientVersionResponse? get versionResponse =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VersioningStateCopyWith<VersioningState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VersioningStateCopyWith<$Res> {
  factory $VersioningStateCopyWith(
          VersioningState value, $Res Function(VersioningState) then) =
      _$VersioningStateCopyWithImpl<$Res, VersioningState>;
  @useResult
  $Res call(
      {VersioningStatus versioningStatus,
      CheckClientVersionResponse? versionResponse});

  $CheckClientVersionResponseCopyWith<$Res>? get versionResponse;
}

/// @nodoc
class _$VersioningStateCopyWithImpl<$Res, $Val extends VersioningState>
    implements $VersioningStateCopyWith<$Res> {
  _$VersioningStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? versioningStatus = null,
    Object? versionResponse = freezed,
  }) {
    return _then(_value.copyWith(
      versioningStatus: null == versioningStatus
          ? _value.versioningStatus
          : versioningStatus // ignore: cast_nullable_to_non_nullable
              as VersioningStatus,
      versionResponse: freezed == versionResponse
          ? _value.versionResponse
          : versionResponse // ignore: cast_nullable_to_non_nullable
              as CheckClientVersionResponse?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CheckClientVersionResponseCopyWith<$Res>? get versionResponse {
    if (_value.versionResponse == null) {
      return null;
    }

    return $CheckClientVersionResponseCopyWith<$Res>(_value.versionResponse!,
        (value) {
      return _then(_value.copyWith(versionResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VersioningStateImplCopyWith<$Res>
    implements $VersioningStateCopyWith<$Res> {
  factory _$$VersioningStateImplCopyWith(_$VersioningStateImpl value,
          $Res Function(_$VersioningStateImpl) then) =
      __$$VersioningStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {VersioningStatus versioningStatus,
      CheckClientVersionResponse? versionResponse});

  @override
  $CheckClientVersionResponseCopyWith<$Res>? get versionResponse;
}

/// @nodoc
class __$$VersioningStateImplCopyWithImpl<$Res>
    extends _$VersioningStateCopyWithImpl<$Res, _$VersioningStateImpl>
    implements _$$VersioningStateImplCopyWith<$Res> {
  __$$VersioningStateImplCopyWithImpl(
      _$VersioningStateImpl _value, $Res Function(_$VersioningStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? versioningStatus = null,
    Object? versionResponse = freezed,
  }) {
    return _then(_$VersioningStateImpl(
      versioningStatus: null == versioningStatus
          ? _value.versioningStatus
          : versioningStatus // ignore: cast_nullable_to_non_nullable
              as VersioningStatus,
      versionResponse: freezed == versionResponse
          ? _value.versionResponse
          : versionResponse // ignore: cast_nullable_to_non_nullable
              as CheckClientVersionResponse?,
    ));
  }
}

/// @nodoc

class _$VersioningStateImpl
    with DiagnosticableTreeMixin
    implements _VersioningState {
  const _$VersioningStateImpl(
      {this.versioningStatus = VersioningStatus.init, this.versionResponse});

  @override
  @JsonKey()
  final VersioningStatus versioningStatus;
  @override
  final CheckClientVersionResponse? versionResponse;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VersioningState(versioningStatus: $versioningStatus, versionResponse: $versionResponse)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VersioningState'))
      ..add(DiagnosticsProperty('versioningStatus', versioningStatus))
      ..add(DiagnosticsProperty('versionResponse', versionResponse));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VersioningStateImpl &&
            (identical(other.versioningStatus, versioningStatus) ||
                other.versioningStatus == versioningStatus) &&
            (identical(other.versionResponse, versionResponse) ||
                other.versionResponse == versionResponse));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, versioningStatus, versionResponse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VersioningStateImplCopyWith<_$VersioningStateImpl> get copyWith =>
      __$$VersioningStateImplCopyWithImpl<_$VersioningStateImpl>(
          this, _$identity);
}

abstract class _VersioningState implements VersioningState {
  const factory _VersioningState(
          {final VersioningStatus versioningStatus,
          final CheckClientVersionResponse? versionResponse}) =
      _$VersioningStateImpl;

  @override
  VersioningStatus get versioningStatus;
  @override
  CheckClientVersionResponse? get versionResponse;
  @override
  @JsonKey(ignore: true)
  _$$VersioningStateImplCopyWith<_$VersioningStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
