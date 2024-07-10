// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_pass_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreatePassEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String password) confirmPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String password)? confirmPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String password)? confirmPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ConfirmPassword value) confirmPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ConfirmPassword value)? confirmPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ConfirmPassword value)? confirmPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePassEventCopyWith<$Res> {
  factory $CreatePassEventCopyWith(
          CreatePassEvent value, $Res Function(CreatePassEvent) then) =
      _$CreatePassEventCopyWithImpl<$Res, CreatePassEvent>;
}

/// @nodoc
class _$CreatePassEventCopyWithImpl<$Res, $Val extends CreatePassEvent>
    implements $CreatePassEventCopyWith<$Res> {
  _$CreatePassEventCopyWithImpl(this._value, this._then);

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
    extends _$CreatePassEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl implements _Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'CreatePassEvent.init()';
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
    required TResult Function(String password) confirmPassword,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String password)? confirmPassword,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String password)? confirmPassword,
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
    required TResult Function(_ConfirmPassword value) confirmPassword,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ConfirmPassword value)? confirmPassword,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ConfirmPassword value)? confirmPassword,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements CreatePassEvent {
  const factory _Init() = _$InitImpl;
}

/// @nodoc
abstract class _$$ConfirmPasswordImplCopyWith<$Res> {
  factory _$$ConfirmPasswordImplCopyWith(_$ConfirmPasswordImpl value,
          $Res Function(_$ConfirmPasswordImpl) then) =
      __$$ConfirmPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String password});
}

/// @nodoc
class __$$ConfirmPasswordImplCopyWithImpl<$Res>
    extends _$CreatePassEventCopyWithImpl<$Res, _$ConfirmPasswordImpl>
    implements _$$ConfirmPasswordImplCopyWith<$Res> {
  __$$ConfirmPasswordImplCopyWithImpl(
      _$ConfirmPasswordImpl _value, $Res Function(_$ConfirmPasswordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
  }) {
    return _then(_$ConfirmPasswordImpl(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ConfirmPasswordImpl implements _ConfirmPassword {
  const _$ConfirmPasswordImpl({required this.password});

  @override
  final String password;

  @override
  String toString() {
    return 'CreatePassEvent.confirmPassword(password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmPasswordImpl &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmPasswordImplCopyWith<_$ConfirmPasswordImpl> get copyWith =>
      __$$ConfirmPasswordImplCopyWithImpl<_$ConfirmPasswordImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String password) confirmPassword,
  }) {
    return confirmPassword(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String password)? confirmPassword,
  }) {
    return confirmPassword?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String password)? confirmPassword,
    required TResult orElse(),
  }) {
    if (confirmPassword != null) {
      return confirmPassword(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ConfirmPassword value) confirmPassword,
  }) {
    return confirmPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ConfirmPassword value)? confirmPassword,
  }) {
    return confirmPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ConfirmPassword value)? confirmPassword,
    required TResult orElse(),
  }) {
    if (confirmPassword != null) {
      return confirmPassword(this);
    }
    return orElse();
  }
}

abstract class _ConfirmPassword implements CreatePassEvent {
  const factory _ConfirmPassword({required final String password}) =
      _$ConfirmPasswordImpl;

  String get password;
  @JsonKey(ignore: true)
  _$$ConfirmPasswordImplCopyWith<_$ConfirmPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreatePassState {
  CreatePassStatus get createPassStatus => throw _privateConstructorUsedError;
  CreatePasswordResponse? get createPassResponse =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreatePassStateCopyWith<CreatePassState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePassStateCopyWith<$Res> {
  factory $CreatePassStateCopyWith(
          CreatePassState value, $Res Function(CreatePassState) then) =
      _$CreatePassStateCopyWithImpl<$Res, CreatePassState>;
  @useResult
  $Res call(
      {CreatePassStatus createPassStatus,
      CreatePasswordResponse? createPassResponse,
      String? errorMessage});

  $CreatePasswordResponseCopyWith<$Res>? get createPassResponse;
}

/// @nodoc
class _$CreatePassStateCopyWithImpl<$Res, $Val extends CreatePassState>
    implements $CreatePassStateCopyWith<$Res> {
  _$CreatePassStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createPassStatus = null,
    Object? createPassResponse = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      createPassStatus: null == createPassStatus
          ? _value.createPassStatus
          : createPassStatus // ignore: cast_nullable_to_non_nullable
              as CreatePassStatus,
      createPassResponse: freezed == createPassResponse
          ? _value.createPassResponse
          : createPassResponse // ignore: cast_nullable_to_non_nullable
              as CreatePasswordResponse?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CreatePasswordResponseCopyWith<$Res>? get createPassResponse {
    if (_value.createPassResponse == null) {
      return null;
    }

    return $CreatePasswordResponseCopyWith<$Res>(_value.createPassResponse!,
        (value) {
      return _then(_value.copyWith(createPassResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreatePassStateImplCopyWith<$Res>
    implements $CreatePassStateCopyWith<$Res> {
  factory _$$CreatePassStateImplCopyWith(_$CreatePassStateImpl value,
          $Res Function(_$CreatePassStateImpl) then) =
      __$$CreatePassStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CreatePassStatus createPassStatus,
      CreatePasswordResponse? createPassResponse,
      String? errorMessage});

  @override
  $CreatePasswordResponseCopyWith<$Res>? get createPassResponse;
}

/// @nodoc
class __$$CreatePassStateImplCopyWithImpl<$Res>
    extends _$CreatePassStateCopyWithImpl<$Res, _$CreatePassStateImpl>
    implements _$$CreatePassStateImplCopyWith<$Res> {
  __$$CreatePassStateImplCopyWithImpl(
      _$CreatePassStateImpl _value, $Res Function(_$CreatePassStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createPassStatus = null,
    Object? createPassResponse = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$CreatePassStateImpl(
      createPassStatus: null == createPassStatus
          ? _value.createPassStatus
          : createPassStatus // ignore: cast_nullable_to_non_nullable
              as CreatePassStatus,
      createPassResponse: freezed == createPassResponse
          ? _value.createPassResponse
          : createPassResponse // ignore: cast_nullable_to_non_nullable
              as CreatePasswordResponse?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CreatePassStateImpl implements _CreatePassState {
  const _$CreatePassStateImpl(
      {this.createPassStatus = CreatePassStatus.init,
      this.createPassResponse,
      this.errorMessage});

  @override
  @JsonKey()
  final CreatePassStatus createPassStatus;
  @override
  final CreatePasswordResponse? createPassResponse;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'CreatePassState(createPassStatus: $createPassStatus, createPassResponse: $createPassResponse, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePassStateImpl &&
            (identical(other.createPassStatus, createPassStatus) ||
                other.createPassStatus == createPassStatus) &&
            (identical(other.createPassResponse, createPassResponse) ||
                other.createPassResponse == createPassResponse) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, createPassStatus, createPassResponse, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePassStateImplCopyWith<_$CreatePassStateImpl> get copyWith =>
      __$$CreatePassStateImplCopyWithImpl<_$CreatePassStateImpl>(
          this, _$identity);
}

abstract class _CreatePassState implements CreatePassState {
  const factory _CreatePassState(
      {final CreatePassStatus createPassStatus,
      final CreatePasswordResponse? createPassResponse,
      final String? errorMessage}) = _$CreatePassStateImpl;

  @override
  CreatePassStatus get createPassStatus;
  @override
  CreatePasswordResponse? get createPassResponse;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$CreatePassStateImplCopyWith<_$CreatePassStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
