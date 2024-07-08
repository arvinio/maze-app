// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_pass_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForgotPassEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String email) forgotPass,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String email)? forgotPass,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String email)? forgotPass,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_forgotPass value) forgotPass,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_forgotPass value)? forgotPass,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_forgotPass value)? forgotPass,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPassEventCopyWith<$Res> {
  factory $ForgotPassEventCopyWith(
          ForgotPassEvent value, $Res Function(ForgotPassEvent) then) =
      _$ForgotPassEventCopyWithImpl<$Res, ForgotPassEvent>;
}

/// @nodoc
class _$ForgotPassEventCopyWithImpl<$Res, $Val extends ForgotPassEvent>
    implements $ForgotPassEventCopyWith<$Res> {
  _$ForgotPassEventCopyWithImpl(this._value, this._then);

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
    extends _$ForgotPassEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl implements _Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'ForgotPassEvent.init()';
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
    required TResult Function(String email) forgotPass,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String email)? forgotPass,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String email)? forgotPass,
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
    required TResult Function(_forgotPass value) forgotPass,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_forgotPass value)? forgotPass,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_forgotPass value)? forgotPass,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements ForgotPassEvent {
  const factory _Init() = _$InitImpl;
}

/// @nodoc
abstract class _$$forgotPassImplCopyWith<$Res> {
  factory _$$forgotPassImplCopyWith(
          _$forgotPassImpl value, $Res Function(_$forgotPassImpl) then) =
      __$$forgotPassImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$forgotPassImplCopyWithImpl<$Res>
    extends _$ForgotPassEventCopyWithImpl<$Res, _$forgotPassImpl>
    implements _$$forgotPassImplCopyWith<$Res> {
  __$$forgotPassImplCopyWithImpl(
      _$forgotPassImpl _value, $Res Function(_$forgotPassImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$forgotPassImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$forgotPassImpl implements _forgotPass {
  const _$forgotPassImpl({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'ForgotPassEvent.forgotPass(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$forgotPassImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$forgotPassImplCopyWith<_$forgotPassImpl> get copyWith =>
      __$$forgotPassImplCopyWithImpl<_$forgotPassImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String email) forgotPass,
  }) {
    return forgotPass(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String email)? forgotPass,
  }) {
    return forgotPass?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String email)? forgotPass,
    required TResult orElse(),
  }) {
    if (forgotPass != null) {
      return forgotPass(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_forgotPass value) forgotPass,
  }) {
    return forgotPass(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_forgotPass value)? forgotPass,
  }) {
    return forgotPass?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_forgotPass value)? forgotPass,
    required TResult orElse(),
  }) {
    if (forgotPass != null) {
      return forgotPass(this);
    }
    return orElse();
  }
}

abstract class _forgotPass implements ForgotPassEvent {
  const factory _forgotPass({required final String email}) = _$forgotPassImpl;

  String get email;
  @JsonKey(ignore: true)
  _$$forgotPassImplCopyWith<_$forgotPassImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ForgotPassState {
  ForgotPassStatus get forgotPassStatus => throw _privateConstructorUsedError;
  ForgotPasswordResponse? get forgotPassResponse =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgotPassStateCopyWith<ForgotPassState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPassStateCopyWith<$Res> {
  factory $ForgotPassStateCopyWith(
          ForgotPassState value, $Res Function(ForgotPassState) then) =
      _$ForgotPassStateCopyWithImpl<$Res, ForgotPassState>;
  @useResult
  $Res call(
      {ForgotPassStatus forgotPassStatus,
      ForgotPasswordResponse? forgotPassResponse,
      String? errorMessage});

  $ForgotPasswordResponseCopyWith<$Res>? get forgotPassResponse;
}

/// @nodoc
class _$ForgotPassStateCopyWithImpl<$Res, $Val extends ForgotPassState>
    implements $ForgotPassStateCopyWith<$Res> {
  _$ForgotPassStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forgotPassStatus = null,
    Object? forgotPassResponse = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      forgotPassStatus: null == forgotPassStatus
          ? _value.forgotPassStatus
          : forgotPassStatus // ignore: cast_nullable_to_non_nullable
              as ForgotPassStatus,
      forgotPassResponse: freezed == forgotPassResponse
          ? _value.forgotPassResponse
          : forgotPassResponse // ignore: cast_nullable_to_non_nullable
              as ForgotPasswordResponse?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ForgotPasswordResponseCopyWith<$Res>? get forgotPassResponse {
    if (_value.forgotPassResponse == null) {
      return null;
    }

    return $ForgotPasswordResponseCopyWith<$Res>(_value.forgotPassResponse!,
        (value) {
      return _then(_value.copyWith(forgotPassResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ForgotPassStateImplCopyWith<$Res>
    implements $ForgotPassStateCopyWith<$Res> {
  factory _$$ForgotPassStateImplCopyWith(_$ForgotPassStateImpl value,
          $Res Function(_$ForgotPassStateImpl) then) =
      __$$ForgotPassStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ForgotPassStatus forgotPassStatus,
      ForgotPasswordResponse? forgotPassResponse,
      String? errorMessage});

  @override
  $ForgotPasswordResponseCopyWith<$Res>? get forgotPassResponse;
}

/// @nodoc
class __$$ForgotPassStateImplCopyWithImpl<$Res>
    extends _$ForgotPassStateCopyWithImpl<$Res, _$ForgotPassStateImpl>
    implements _$$ForgotPassStateImplCopyWith<$Res> {
  __$$ForgotPassStateImplCopyWithImpl(
      _$ForgotPassStateImpl _value, $Res Function(_$ForgotPassStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forgotPassStatus = null,
    Object? forgotPassResponse = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$ForgotPassStateImpl(
      forgotPassStatus: null == forgotPassStatus
          ? _value.forgotPassStatus
          : forgotPassStatus // ignore: cast_nullable_to_non_nullable
              as ForgotPassStatus,
      forgotPassResponse: freezed == forgotPassResponse
          ? _value.forgotPassResponse
          : forgotPassResponse // ignore: cast_nullable_to_non_nullable
              as ForgotPasswordResponse?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ForgotPassStateImpl implements _ForgotPassState {
  const _$ForgotPassStateImpl(
      {this.forgotPassStatus = ForgotPassStatus.init,
      this.forgotPassResponse,
      this.errorMessage});

  @override
  @JsonKey()
  final ForgotPassStatus forgotPassStatus;
  @override
  final ForgotPasswordResponse? forgotPassResponse;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ForgotPassState(forgotPassStatus: $forgotPassStatus, forgotPassResponse: $forgotPassResponse, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPassStateImpl &&
            (identical(other.forgotPassStatus, forgotPassStatus) ||
                other.forgotPassStatus == forgotPassStatus) &&
            (identical(other.forgotPassResponse, forgotPassResponse) ||
                other.forgotPassResponse == forgotPassResponse) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, forgotPassStatus, forgotPassResponse, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPassStateImplCopyWith<_$ForgotPassStateImpl> get copyWith =>
      __$$ForgotPassStateImplCopyWithImpl<_$ForgotPassStateImpl>(
          this, _$identity);
}

abstract class _ForgotPassState implements ForgotPassState {
  const factory _ForgotPassState(
      {final ForgotPassStatus forgotPassStatus,
      final ForgotPasswordResponse? forgotPassResponse,
      final String? errorMessage}) = _$ForgotPassStateImpl;

  @override
  ForgotPassStatus get forgotPassStatus;
  @override
  ForgotPasswordResponse? get forgotPassResponse;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$ForgotPassStateImplCopyWith<_$ForgotPassStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
