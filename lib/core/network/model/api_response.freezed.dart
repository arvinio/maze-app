// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApiResponse<D> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(D data, int? statusCode) completed,
    required TResult Function(ApiError apiError) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(D data, int? statusCode)? completed,
    TResult? Function(ApiError apiError)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(D data, int? statusCode)? completed,
    TResult Function(ApiError apiError)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Completed<D> value) completed,
    required TResult Function(Error<D> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Completed<D> value)? completed,
    TResult? Function(Error<D> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Completed<D> value)? completed,
    TResult Function(Error<D> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<D, $Res> {
  factory $ApiResponseCopyWith(
          ApiResponse<D> value, $Res Function(ApiResponse<D>) then) =
      _$ApiResponseCopyWithImpl<D, $Res, ApiResponse<D>>;
}

/// @nodoc
class _$ApiResponseCopyWithImpl<D, $Res, $Val extends ApiResponse<D>>
    implements $ApiResponseCopyWith<D, $Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CompletedImplCopyWith<D, $Res> {
  factory _$$CompletedImplCopyWith(
          _$CompletedImpl<D> value, $Res Function(_$CompletedImpl<D>) then) =
      __$$CompletedImplCopyWithImpl<D, $Res>;
  @useResult
  $Res call({D data, int? statusCode});
}

/// @nodoc
class __$$CompletedImplCopyWithImpl<D, $Res>
    extends _$ApiResponseCopyWithImpl<D, $Res, _$CompletedImpl<D>>
    implements _$$CompletedImplCopyWith<D, $Res> {
  __$$CompletedImplCopyWithImpl(
      _$CompletedImpl<D> _value, $Res Function(_$CompletedImpl<D>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_$CompletedImpl<D>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as D,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$CompletedImpl<D> implements Completed<D> {
  const _$CompletedImpl({required this.data, this.statusCode});

  @override
  final D data;
  @override
  final int? statusCode;

  @override
  String toString() {
    return 'ApiResponse<$D>.completed(data: $data, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompletedImpl<D> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(data), statusCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompletedImplCopyWith<D, _$CompletedImpl<D>> get copyWith =>
      __$$CompletedImplCopyWithImpl<D, _$CompletedImpl<D>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(D data, int? statusCode) completed,
    required TResult Function(ApiError apiError) error,
  }) {
    return completed(data, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(D data, int? statusCode)? completed,
    TResult? Function(ApiError apiError)? error,
  }) {
    return completed?.call(data, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(D data, int? statusCode)? completed,
    TResult Function(ApiError apiError)? error,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(data, statusCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Completed<D> value) completed,
    required TResult Function(Error<D> value) error,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Completed<D> value)? completed,
    TResult? Function(Error<D> value)? error,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Completed<D> value)? completed,
    TResult Function(Error<D> value)? error,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class Completed<D> implements ApiResponse<D> {
  const factory Completed({required final D data, final int? statusCode}) =
      _$CompletedImpl<D>;

  D get data;
  int? get statusCode;
  @JsonKey(ignore: true)
  _$$CompletedImplCopyWith<D, _$CompletedImpl<D>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<D, $Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl<D> value, $Res Function(_$ErrorImpl<D>) then) =
      __$$ErrorImplCopyWithImpl<D, $Res>;
  @useResult
  $Res call({ApiError apiError});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<D, $Res>
    extends _$ApiResponseCopyWithImpl<D, $Res, _$ErrorImpl<D>>
    implements _$$ErrorImplCopyWith<D, $Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl<D> _value, $Res Function(_$ErrorImpl<D>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiError = null,
  }) {
    return _then(_$ErrorImpl<D>(
      apiError: null == apiError
          ? _value.apiError
          : apiError // ignore: cast_nullable_to_non_nullable
              as ApiError,
    ));
  }
}

/// @nodoc

class _$ErrorImpl<D> implements Error<D> {
  const _$ErrorImpl({required this.apiError});

  @override
  final ApiError apiError;

  @override
  String toString() {
    return 'ApiResponse<$D>.error(apiError: $apiError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl<D> &&
            (identical(other.apiError, apiError) ||
                other.apiError == apiError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<D, _$ErrorImpl<D>> get copyWith =>
      __$$ErrorImplCopyWithImpl<D, _$ErrorImpl<D>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(D data, int? statusCode) completed,
    required TResult Function(ApiError apiError) error,
  }) {
    return error(apiError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(D data, int? statusCode)? completed,
    TResult? Function(ApiError apiError)? error,
  }) {
    return error?.call(apiError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(D data, int? statusCode)? completed,
    TResult Function(ApiError apiError)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(apiError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Completed<D> value) completed,
    required TResult Function(Error<D> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Completed<D> value)? completed,
    TResult? Function(Error<D> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Completed<D> value)? completed,
    TResult Function(Error<D> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error<D> implements ApiResponse<D> {
  const factory Error({required final ApiError apiError}) = _$ErrorImpl<D>;

  ApiError get apiError;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<D, _$ErrorImpl<D>> get copyWith =>
      throw _privateConstructorUsedError;
}
