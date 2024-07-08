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
  @JsonKey(name: "userId")
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "userId") String? userId,
      @JsonKey(name: "message") String? message});
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
    Object? userId = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
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
      {@JsonKey(name: "userId") String? userId,
      @JsonKey(name: "message") String? message});
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
    Object? userId = freezed,
    Object? message = freezed,
  }) {
    return _then(_$ResendResponseImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResendResponseImpl implements _ResendResponse {
  const _$ResendResponseImpl(
      {@JsonKey(name: "userId") this.userId,
      @JsonKey(name: "message") this.message});

  factory _$ResendResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResendResponseImplFromJson(json);

  @override
  @JsonKey(name: "userId")
  final String? userId;
  @override
  @JsonKey(name: "message")
  final String? message;

  @override
  String toString() {
    return 'ResendResponse(userId: $userId, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResendResponseImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, message);

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
      {@JsonKey(name: "userId") final String? userId,
      @JsonKey(name: "message") final String? message}) = _$ResendResponseImpl;

  factory _ResendResponse.fromJson(Map<String, dynamic> json) =
      _$ResendResponseImpl.fromJson;

  @override
  @JsonKey(name: "userId")
  String? get userId;
  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$ResendResponseImplCopyWith<_$ResendResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
