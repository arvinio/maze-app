// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_password_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreatePasswordResponse _$CreatePasswordResponseFromJson(
    Map<String, dynamic> json) {
  return _CreatePasswordResponse.fromJson(json);
}

/// @nodoc
mixin _$CreatePasswordResponse {
  @JsonKey(name: "success")
  bool? get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreatePasswordResponseCopyWith<CreatePasswordResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePasswordResponseCopyWith<$Res> {
  factory $CreatePasswordResponseCopyWith(CreatePasswordResponse value,
          $Res Function(CreatePasswordResponse) then) =
      _$CreatePasswordResponseCopyWithImpl<$Res, CreatePasswordResponse>;
  @useResult
  $Res call({@JsonKey(name: "success") bool? success});
}

/// @nodoc
class _$CreatePasswordResponseCopyWithImpl<$Res,
        $Val extends CreatePasswordResponse>
    implements $CreatePasswordResponseCopyWith<$Res> {
  _$CreatePasswordResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
  }) {
    return _then(_value.copyWith(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreatePasswordResponseImplCopyWith<$Res>
    implements $CreatePasswordResponseCopyWith<$Res> {
  factory _$$CreatePasswordResponseImplCopyWith(
          _$CreatePasswordResponseImpl value,
          $Res Function(_$CreatePasswordResponseImpl) then) =
      __$$CreatePasswordResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "success") bool? success});
}

/// @nodoc
class __$$CreatePasswordResponseImplCopyWithImpl<$Res>
    extends _$CreatePasswordResponseCopyWithImpl<$Res,
        _$CreatePasswordResponseImpl>
    implements _$$CreatePasswordResponseImplCopyWith<$Res> {
  __$$CreatePasswordResponseImplCopyWithImpl(
      _$CreatePasswordResponseImpl _value,
      $Res Function(_$CreatePasswordResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
  }) {
    return _then(_$CreatePasswordResponseImpl(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatePasswordResponseImpl implements _CreatePasswordResponse {
  const _$CreatePasswordResponseImpl({@JsonKey(name: "success") this.success});

  factory _$CreatePasswordResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatePasswordResponseImplFromJson(json);

  @override
  @JsonKey(name: "success")
  final bool? success;

  @override
  String toString() {
    return 'CreatePasswordResponse(success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePasswordResponseImpl &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePasswordResponseImplCopyWith<_$CreatePasswordResponseImpl>
      get copyWith => __$$CreatePasswordResponseImplCopyWithImpl<
          _$CreatePasswordResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatePasswordResponseImplToJson(
      this,
    );
  }
}

abstract class _CreatePasswordResponse implements CreatePasswordResponse {
  const factory _CreatePasswordResponse(
          {@JsonKey(name: "success") final bool? success}) =
      _$CreatePasswordResponseImpl;

  factory _CreatePasswordResponse.fromJson(Map<String, dynamic> json) =
      _$CreatePasswordResponseImpl.fromJson;

  @override
  @JsonKey(name: "success")
  bool? get success;
  @override
  @JsonKey(ignore: true)
  _$$CreatePasswordResponseImplCopyWith<_$CreatePasswordResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
