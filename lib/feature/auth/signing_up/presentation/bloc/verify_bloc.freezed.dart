// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VerifyEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String userId, String code) verifyCode,
    required TResult Function(String userId) resend,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String userId, String code)? verifyCode,
    TResult? Function(String userId)? resend,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String userId, String code)? verifyCode,
    TResult Function(String userId)? resend,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_VeifyCode value) verifyCode,
    required TResult Function(_Resend value) resend,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_VeifyCode value)? verifyCode,
    TResult? Function(_Resend value)? resend,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_VeifyCode value)? verifyCode,
    TResult Function(_Resend value)? resend,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyEventCopyWith<$Res> {
  factory $VerifyEventCopyWith(
          VerifyEvent value, $Res Function(VerifyEvent) then) =
      _$VerifyEventCopyWithImpl<$Res, VerifyEvent>;
}

/// @nodoc
class _$VerifyEventCopyWithImpl<$Res, $Val extends VerifyEvent>
    implements $VerifyEventCopyWith<$Res> {
  _$VerifyEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitImplCopyWith<$Res> {
  factory _$$InitImplCopyWith(
          _$InitImpl value, $Res Function(_$InitImpl) then) =
      __$$InitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitImplCopyWithImpl<$Res>
    extends _$VerifyEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl implements _Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'VerifyEvent.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String userId, String code) verifyCode,
    required TResult Function(String userId) resend,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String userId, String code)? verifyCode,
    TResult? Function(String userId)? resend,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String userId, String code)? verifyCode,
    TResult Function(String userId)? resend,
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
    required TResult Function(_Init value) init,
    required TResult Function(_VeifyCode value) verifyCode,
    required TResult Function(_Resend value) resend,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_VeifyCode value)? verifyCode,
    TResult? Function(_Resend value)? resend,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_VeifyCode value)? verifyCode,
    TResult Function(_Resend value)? resend,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements VerifyEvent {
  const factory _Init() = _$InitImpl;
}

/// @nodoc
abstract class _$$VeifyCodeImplCopyWith<$Res> {
  factory _$$VeifyCodeImplCopyWith(
          _$VeifyCodeImpl value, $Res Function(_$VeifyCodeImpl) then) =
      __$$VeifyCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, String code});
}

/// @nodoc
class __$$VeifyCodeImplCopyWithImpl<$Res>
    extends _$VerifyEventCopyWithImpl<$Res, _$VeifyCodeImpl>
    implements _$$VeifyCodeImplCopyWith<$Res> {
  __$$VeifyCodeImplCopyWithImpl(
      _$VeifyCodeImpl _value, $Res Function(_$VeifyCodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? code = null,
  }) {
    return _then(_$VeifyCodeImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$VeifyCodeImpl implements _VeifyCode {
  const _$VeifyCodeImpl({required this.userId, required this.code});

  @override
  final String userId;
  @override
  final String code;

  @override
  String toString() {
    return 'VerifyEvent.verifyCode(userId: $userId, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VeifyCodeImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VeifyCodeImplCopyWith<_$VeifyCodeImpl> get copyWith =>
      __$$VeifyCodeImplCopyWithImpl<_$VeifyCodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String userId, String code) verifyCode,
    required TResult Function(String userId) resend,
  }) {
    return verifyCode(userId, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String userId, String code)? verifyCode,
    TResult? Function(String userId)? resend,
  }) {
    return verifyCode?.call(userId, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String userId, String code)? verifyCode,
    TResult Function(String userId)? resend,
    required TResult orElse(),
  }) {
    if (verifyCode != null) {
      return verifyCode(userId, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_VeifyCode value) verifyCode,
    required TResult Function(_Resend value) resend,
  }) {
    return verifyCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_VeifyCode value)? verifyCode,
    TResult? Function(_Resend value)? resend,
  }) {
    return verifyCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_VeifyCode value)? verifyCode,
    TResult Function(_Resend value)? resend,
    required TResult orElse(),
  }) {
    if (verifyCode != null) {
      return verifyCode(this);
    }
    return orElse();
  }
}

abstract class _VeifyCode implements VerifyEvent {
  const factory _VeifyCode(
      {required final String userId,
      required final String code}) = _$VeifyCodeImpl;

  String get userId;
  String get code;
  @JsonKey(ignore: true)
  _$$VeifyCodeImplCopyWith<_$VeifyCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResendImplCopyWith<$Res> {
  factory _$$ResendImplCopyWith(
          _$ResendImpl value, $Res Function(_$ResendImpl) then) =
      __$$ResendImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$ResendImplCopyWithImpl<$Res>
    extends _$VerifyEventCopyWithImpl<$Res, _$ResendImpl>
    implements _$$ResendImplCopyWith<$Res> {
  __$$ResendImplCopyWithImpl(
      _$ResendImpl _value, $Res Function(_$ResendImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$ResendImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ResendImpl implements _Resend {
  const _$ResendImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'VerifyEvent.resend(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResendImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResendImplCopyWith<_$ResendImpl> get copyWith =>
      __$$ResendImplCopyWithImpl<_$ResendImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String userId, String code) verifyCode,
    required TResult Function(String userId) resend,
  }) {
    return resend(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String userId, String code)? verifyCode,
    TResult? Function(String userId)? resend,
  }) {
    return resend?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String userId, String code)? verifyCode,
    TResult Function(String userId)? resend,
    required TResult orElse(),
  }) {
    if (resend != null) {
      return resend(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_VeifyCode value) verifyCode,
    required TResult Function(_Resend value) resend,
  }) {
    return resend(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_VeifyCode value)? verifyCode,
    TResult? Function(_Resend value)? resend,
  }) {
    return resend?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_VeifyCode value)? verifyCode,
    TResult Function(_Resend value)? resend,
    required TResult orElse(),
  }) {
    if (resend != null) {
      return resend(this);
    }
    return orElse();
  }
}

abstract class _Resend implements VerifyEvent {
  const factory _Resend({required final String userId}) = _$ResendImpl;

  String get userId;
  @JsonKey(ignore: true)
  _$$ResendImplCopyWith<_$ResendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VerifyState {
  VerifyStatus get verifyStatus => throw _privateConstructorUsedError;
  VerifyResponse? get verifyResponse => throw _privateConstructorUsedError;
  ResendResponse? get resendResponse => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VerifyStateCopyWith<VerifyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyStateCopyWith<$Res> {
  factory $VerifyStateCopyWith(
          VerifyState value, $Res Function(VerifyState) then) =
      _$VerifyStateCopyWithImpl<$Res, VerifyState>;
  @useResult
  $Res call(
      {VerifyStatus verifyStatus,
      VerifyResponse? verifyResponse,
      ResendResponse? resendResponse,
      String? errorMessage});

  $VerifyResponseCopyWith<$Res>? get verifyResponse;
  $ResendResponseCopyWith<$Res>? get resendResponse;
}

/// @nodoc
class _$VerifyStateCopyWithImpl<$Res, $Val extends VerifyState>
    implements $VerifyStateCopyWith<$Res> {
  _$VerifyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verifyStatus = null,
    Object? verifyResponse = freezed,
    Object? resendResponse = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      verifyStatus: null == verifyStatus
          ? _value.verifyStatus
          : verifyStatus // ignore: cast_nullable_to_non_nullable
              as VerifyStatus,
      verifyResponse: freezed == verifyResponse
          ? _value.verifyResponse
          : verifyResponse // ignore: cast_nullable_to_non_nullable
              as VerifyResponse?,
      resendResponse: freezed == resendResponse
          ? _value.resendResponse
          : resendResponse // ignore: cast_nullable_to_non_nullable
              as ResendResponse?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VerifyResponseCopyWith<$Res>? get verifyResponse {
    if (_value.verifyResponse == null) {
      return null;
    }

    return $VerifyResponseCopyWith<$Res>(_value.verifyResponse!, (value) {
      return _then(_value.copyWith(verifyResponse: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ResendResponseCopyWith<$Res>? get resendResponse {
    if (_value.resendResponse == null) {
      return null;
    }

    return $ResendResponseCopyWith<$Res>(_value.resendResponse!, (value) {
      return _then(_value.copyWith(resendResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VerifyStateImplCopyWith<$Res>
    implements $VerifyStateCopyWith<$Res> {
  factory _$$VerifyStateImplCopyWith(
          _$VerifyStateImpl value, $Res Function(_$VerifyStateImpl) then) =
      __$$VerifyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {VerifyStatus verifyStatus,
      VerifyResponse? verifyResponse,
      ResendResponse? resendResponse,
      String? errorMessage});

  @override
  $VerifyResponseCopyWith<$Res>? get verifyResponse;
  @override
  $ResendResponseCopyWith<$Res>? get resendResponse;
}

/// @nodoc
class __$$VerifyStateImplCopyWithImpl<$Res>
    extends _$VerifyStateCopyWithImpl<$Res, _$VerifyStateImpl>
    implements _$$VerifyStateImplCopyWith<$Res> {
  __$$VerifyStateImplCopyWithImpl(
      _$VerifyStateImpl _value, $Res Function(_$VerifyStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verifyStatus = null,
    Object? verifyResponse = freezed,
    Object? resendResponse = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$VerifyStateImpl(
      verifyStatus: null == verifyStatus
          ? _value.verifyStatus
          : verifyStatus // ignore: cast_nullable_to_non_nullable
              as VerifyStatus,
      verifyResponse: freezed == verifyResponse
          ? _value.verifyResponse
          : verifyResponse // ignore: cast_nullable_to_non_nullable
              as VerifyResponse?,
      resendResponse: freezed == resendResponse
          ? _value.resendResponse
          : resendResponse // ignore: cast_nullable_to_non_nullable
              as ResendResponse?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$VerifyStateImpl implements _VerifyState {
  const _$VerifyStateImpl(
      {this.verifyStatus = VerifyStatus.init,
      this.verifyResponse,
      this.resendResponse,
      this.errorMessage});

  @override
  @JsonKey()
  final VerifyStatus verifyStatus;
  @override
  final VerifyResponse? verifyResponse;
  @override
  final ResendResponse? resendResponse;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'VerifyState(verifyStatus: $verifyStatus, verifyResponse: $verifyResponse, resendResponse: $resendResponse, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyStateImpl &&
            (identical(other.verifyStatus, verifyStatus) ||
                other.verifyStatus == verifyStatus) &&
            (identical(other.verifyResponse, verifyResponse) ||
                other.verifyResponse == verifyResponse) &&
            (identical(other.resendResponse, resendResponse) ||
                other.resendResponse == resendResponse) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, verifyStatus, verifyResponse, resendResponse, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyStateImplCopyWith<_$VerifyStateImpl> get copyWith =>
      __$$VerifyStateImplCopyWithImpl<_$VerifyStateImpl>(this, _$identity);
}

abstract class _VerifyState implements VerifyState {
  const factory _VerifyState(
      {final VerifyStatus verifyStatus,
      final VerifyResponse? verifyResponse,
      final ResendResponse? resendResponse,
      final String? errorMessage}) = _$VerifyStateImpl;

  @override
  VerifyStatus get verifyStatus;
  @override
  VerifyResponse? get verifyResponse;
  @override
  ResendResponse? get resendResponse;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$VerifyStateImplCopyWith<_$VerifyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
