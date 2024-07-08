// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignupEvent {
  String get userName => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userName) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userName)? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userName)? init,
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

  @JsonKey(ignore: true)
  $SignupEventCopyWith<SignupEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupEventCopyWith<$Res> {
  factory $SignupEventCopyWith(
          SignupEvent value, $Res Function(SignupEvent) then) =
      _$SignupEventCopyWithImpl<$Res, SignupEvent>;
  @useResult
  $Res call({String userName});
}

/// @nodoc
class _$SignupEventCopyWithImpl<$Res, $Val extends SignupEvent>
    implements $SignupEventCopyWith<$Res> {
  _$SignupEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitEventImplCopyWith<$Res>
    implements $SignupEventCopyWith<$Res> {
  factory _$$InitEventImplCopyWith(
          _$InitEventImpl value, $Res Function(_$InitEventImpl) then) =
      __$$InitEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userName});
}

/// @nodoc
class __$$InitEventImplCopyWithImpl<$Res>
    extends _$SignupEventCopyWithImpl<$Res, _$InitEventImpl>
    implements _$$InitEventImplCopyWith<$Res> {
  __$$InitEventImplCopyWithImpl(
      _$InitEventImpl _value, $Res Function(_$InitEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
  }) {
    return _then(_$InitEventImpl(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InitEventImpl implements _InitEvent {
  const _$InitEventImpl({required this.userName});

  @override
  final String userName;

  @override
  String toString() {
    return 'SignupEvent.init(userName: $userName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitEventImpl &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitEventImplCopyWith<_$InitEventImpl> get copyWith =>
      __$$InitEventImplCopyWithImpl<_$InitEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userName) init,
  }) {
    return init(userName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userName)? init,
  }) {
    return init?.call(userName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userName)? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(userName);
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

abstract class _InitEvent implements SignupEvent {
  const factory _InitEvent({required final String userName}) = _$InitEventImpl;

  @override
  String get userName;
  @override
  @JsonKey(ignore: true)
  _$$InitEventImplCopyWith<_$InitEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignupState {
  SignupStatus get signupStatus => throw _privateConstructorUsedError;
  SignupResponse? get signupResponse => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignupStateCopyWith<SignupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupStateCopyWith<$Res> {
  factory $SignupStateCopyWith(
          SignupState value, $Res Function(SignupState) then) =
      _$SignupStateCopyWithImpl<$Res, SignupState>;
  @useResult
  $Res call(
      {SignupStatus signupStatus,
      SignupResponse? signupResponse,
      String? errorMessage});

  $SignupResponseCopyWith<$Res>? get signupResponse;
}

/// @nodoc
class _$SignupStateCopyWithImpl<$Res, $Val extends SignupState>
    implements $SignupStateCopyWith<$Res> {
  _$SignupStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signupStatus = null,
    Object? signupResponse = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      signupStatus: null == signupStatus
          ? _value.signupStatus
          : signupStatus // ignore: cast_nullable_to_non_nullable
              as SignupStatus,
      signupResponse: freezed == signupResponse
          ? _value.signupResponse
          : signupResponse // ignore: cast_nullable_to_non_nullable
              as SignupResponse?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SignupResponseCopyWith<$Res>? get signupResponse {
    if (_value.signupResponse == null) {
      return null;
    }

    return $SignupResponseCopyWith<$Res>(_value.signupResponse!, (value) {
      return _then(_value.copyWith(signupResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SignupStateImplCopyWith<$Res>
    implements $SignupStateCopyWith<$Res> {
  factory _$$SignupStateImplCopyWith(
          _$SignupStateImpl value, $Res Function(_$SignupStateImpl) then) =
      __$$SignupStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SignupStatus signupStatus,
      SignupResponse? signupResponse,
      String? errorMessage});

  @override
  $SignupResponseCopyWith<$Res>? get signupResponse;
}

/// @nodoc
class __$$SignupStateImplCopyWithImpl<$Res>
    extends _$SignupStateCopyWithImpl<$Res, _$SignupStateImpl>
    implements _$$SignupStateImplCopyWith<$Res> {
  __$$SignupStateImplCopyWithImpl(
      _$SignupStateImpl _value, $Res Function(_$SignupStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signupStatus = null,
    Object? signupResponse = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$SignupStateImpl(
      signupStatus: null == signupStatus
          ? _value.signupStatus
          : signupStatus // ignore: cast_nullable_to_non_nullable
              as SignupStatus,
      signupResponse: freezed == signupResponse
          ? _value.signupResponse
          : signupResponse // ignore: cast_nullable_to_non_nullable
              as SignupResponse?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SignupStateImpl implements _SignupState {
  const _$SignupStateImpl(
      {this.signupStatus = SignupStatus.init,
      this.signupResponse,
      this.errorMessage});

  @override
  @JsonKey()
  final SignupStatus signupStatus;
  @override
  final SignupResponse? signupResponse;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'SignupState(signupStatus: $signupStatus, signupResponse: $signupResponse, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupStateImpl &&
            (identical(other.signupStatus, signupStatus) ||
                other.signupStatus == signupStatus) &&
            (identical(other.signupResponse, signupResponse) ||
                other.signupResponse == signupResponse) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, signupStatus, signupResponse, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupStateImplCopyWith<_$SignupStateImpl> get copyWith =>
      __$$SignupStateImplCopyWithImpl<_$SignupStateImpl>(this, _$identity);
}

abstract class _SignupState implements SignupState {
  const factory _SignupState(
      {final SignupStatus signupStatus,
      final SignupResponse? signupResponse,
      final String? errorMessage}) = _$SignupStateImpl;

  @override
  SignupStatus get signupStatus;
  @override
  SignupResponse? get signupResponse;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$SignupStateImplCopyWith<_$SignupStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
