// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerifyResponse _$VerifyResponseFromJson(Map<String, dynamic> json) {
  return _VerifyResponse.fromJson(json);
}

/// @nodoc
mixin _$VerifyResponse {
  @JsonKey(name: "success")
  bool? get success => throw _privateConstructorUsedError;
  @JsonKey(name: "userId")
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "token")
  String? get token => throw _privateConstructorUsedError;
  @JsonKey(name: "refreshToken")
  String? get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyResponseCopyWith<VerifyResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyResponseCopyWith<$Res> {
  factory $VerifyResponseCopyWith(
          VerifyResponse value, $Res Function(VerifyResponse) then) =
      _$VerifyResponseCopyWithImpl<$Res, VerifyResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "success") bool? success,
      @JsonKey(name: "userId") String? userId,
      @JsonKey(name: "token") String? token,
      @JsonKey(name: "refreshToken") String? refreshToken});
}

/// @nodoc
class _$VerifyResponseCopyWithImpl<$Res, $Val extends VerifyResponse>
    implements $VerifyResponseCopyWith<$Res> {
  _$VerifyResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? userId = freezed,
    Object? token = freezed,
    Object? refreshToken = freezed,
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
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyResponseImplCopyWith<$Res>
    implements $VerifyResponseCopyWith<$Res> {
  factory _$$VerifyResponseImplCopyWith(_$VerifyResponseImpl value,
          $Res Function(_$VerifyResponseImpl) then) =
      __$$VerifyResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "success") bool? success,
      @JsonKey(name: "userId") String? userId,
      @JsonKey(name: "token") String? token,
      @JsonKey(name: "refreshToken") String? refreshToken});
}

/// @nodoc
class __$$VerifyResponseImplCopyWithImpl<$Res>
    extends _$VerifyResponseCopyWithImpl<$Res, _$VerifyResponseImpl>
    implements _$$VerifyResponseImplCopyWith<$Res> {
  __$$VerifyResponseImplCopyWithImpl(
      _$VerifyResponseImpl _value, $Res Function(_$VerifyResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? userId = freezed,
    Object? token = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_$VerifyResponseImpl(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyResponseImpl implements _VerifyResponse {
  const _$VerifyResponseImpl(
      {@JsonKey(name: "success") this.success,
      @JsonKey(name: "userId") this.userId,
      @JsonKey(name: "token") this.token,
      @JsonKey(name: "refreshToken") this.refreshToken});

  factory _$VerifyResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyResponseImplFromJson(json);

  @override
  @JsonKey(name: "success")
  final bool? success;
  @override
  @JsonKey(name: "userId")
  final String? userId;
  @override
  @JsonKey(name: "token")
  final String? token;
  @override
  @JsonKey(name: "refreshToken")
  final String? refreshToken;

  @override
  String toString() {
    return 'VerifyResponse(success: $success, userId: $userId, token: $token, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, success, userId, token, refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyResponseImplCopyWith<_$VerifyResponseImpl> get copyWith =>
      __$$VerifyResponseImplCopyWithImpl<_$VerifyResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyResponseImplToJson(
      this,
    );
  }
}

abstract class _VerifyResponse implements VerifyResponse {
  const factory _VerifyResponse(
          {@JsonKey(name: "success") final bool? success,
          @JsonKey(name: "userId") final String? userId,
          @JsonKey(name: "token") final String? token,
          @JsonKey(name: "refreshToken") final String? refreshToken}) =
      _$VerifyResponseImpl;

  factory _VerifyResponse.fromJson(Map<String, dynamic> json) =
      _$VerifyResponseImpl.fromJson;

  @override
  @JsonKey(name: "success")
  bool? get success;
  @override
  @JsonKey(name: "userId")
  String? get userId;
  @override
  @JsonKey(name: "token")
  String? get token;
  @override
  @JsonKey(name: "refreshToken")
  String? get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$VerifyResponseImplCopyWith<_$VerifyResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
