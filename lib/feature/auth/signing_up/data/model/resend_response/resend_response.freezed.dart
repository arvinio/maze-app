// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resend_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResendResponse _$ResendResponseFromJson(Map<String, dynamic> json) {
  return _ResendResponse.fromJson(json);
}

/// @nodoc
mixin _$ResendResponse {
  @JsonKey(name: "success")
  bool? get success => throw _privateConstructorUsedError;
  @JsonKey(name: "userId")
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "code")
  String? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResendResponseCopyWith<ResendResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResendResponseCopyWith<$Res> {
  factory $ResendResponseCopyWith(
          ResendResponse value, $Res Function(ResendResponse) then) =
      _$ResendResponseCopyWithImpl<$Res, ResendResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "success") bool? success,
      @JsonKey(name: "userId") String? userId,
      @JsonKey(name: "code") String? code});
}

/// @nodoc
class _$ResendResponseCopyWithImpl<$Res, $Val extends ResendResponse>
    implements $ResendResponseCopyWith<$Res> {
  _$ResendResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? userId = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResendResponseImplCopyWith<$Res>
    implements $ResendResponseCopyWith<$Res> {
  factory _$$ResendResponseImplCopyWith(_$ResendResponseImpl value,
          $Res Function(_$ResendResponseImpl) then) =
      __$$ResendResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "success") bool? success,
      @JsonKey(name: "userId") String? userId,
      @JsonKey(name: "code") String? code});
}

/// @nodoc
class __$$ResendResponseImplCopyWithImpl<$Res>
    extends _$ResendResponseCopyWithImpl<$Res, _$ResendResponseImpl>
    implements _$$ResendResponseImplCopyWith<$Res> {
  __$$ResendResponseImplCopyWithImpl(
      _$ResendResponseImpl _value, $Res Function(_$ResendResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? userId = freezed,
    Object? code = freezed,
  }) {
    return _then(_$ResendResponseImpl(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResendResponseImpl implements _ResendResponse {
  const _$ResendResponseImpl(
      {@JsonKey(name: "success") this.success,
      @JsonKey(name: "userId") this.userId,
      @JsonKey(name: "code") this.code});

  factory _$ResendResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResendResponseImplFromJson(json);

  @override
  @JsonKey(name: "success")
  final bool? success;
  @override
  @JsonKey(name: "userId")
  final String? userId;
  @override
  @JsonKey(name: "code")
  final String? code;

  @override
  String toString() {
    return 'ResendResponse(success: $success, userId: $userId, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResendResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, userId, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResendResponseImplCopyWith<_$ResendResponseImpl> get copyWith =>
      __$$ResendResponseImplCopyWithImpl<_$ResendResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResendResponseImplToJson(
      this,
    );
  }
}

abstract class _ResendResponse implements ResendResponse {
  const factory _ResendResponse(
      {@JsonKey(name: "success") final bool? success,
      @JsonKey(name: "userId") final String? userId,
      @JsonKey(name: "code") final String? code}) = _$ResendResponseImpl;

  factory _ResendResponse.fromJson(Map<String, dynamic> json) =
      _$ResendResponseImpl.fromJson;

  @override
  @JsonKey(name: "success")
  bool? get success;
  @override
  @JsonKey(name: "userId")
  String? get userId;
  @override
  @JsonKey(name: "code")
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$ResendResponseImplCopyWith<_$ResendResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
