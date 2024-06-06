// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_client_version_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CheckClientVersionResponse _$CheckClientVersionResponseFromJson(
    Map<String, dynamic> json) {
  return _CheckClientVersionResponse.fromJson(json);
}

/// @nodoc
mixin _$CheckClientVersionResponse {
  @JsonKey(name: 'updateExist')
  bool? get updateExist => throw _privateConstructorUsedError;
  @JsonKey(name: 'optional')
  bool? get optional => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckClientVersionResponseCopyWith<CheckClientVersionResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckClientVersionResponseCopyWith<$Res> {
  factory $CheckClientVersionResponseCopyWith(CheckClientVersionResponse value,
          $Res Function(CheckClientVersionResponse) then) =
      _$CheckClientVersionResponseCopyWithImpl<$Res,
          CheckClientVersionResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'updateExist') bool? updateExist,
      @JsonKey(name: 'optional') bool? optional});
}

/// @nodoc
class _$CheckClientVersionResponseCopyWithImpl<$Res,
        $Val extends CheckClientVersionResponse>
    implements $CheckClientVersionResponseCopyWith<$Res> {
  _$CheckClientVersionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updateExist = freezed,
    Object? optional = freezed,
  }) {
    return _then(_value.copyWith(
      updateExist: freezed == updateExist
          ? _value.updateExist
          : updateExist // ignore: cast_nullable_to_non_nullable
              as bool?,
      optional: freezed == optional
          ? _value.optional
          : optional // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckClientVersionResponseImplCopyWith<$Res>
    implements $CheckClientVersionResponseCopyWith<$Res> {
  factory _$$CheckClientVersionResponseImplCopyWith(
          _$CheckClientVersionResponseImpl value,
          $Res Function(_$CheckClientVersionResponseImpl) then) =
      __$$CheckClientVersionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'updateExist') bool? updateExist,
      @JsonKey(name: 'optional') bool? optional});
}

/// @nodoc
class __$$CheckClientVersionResponseImplCopyWithImpl<$Res>
    extends _$CheckClientVersionResponseCopyWithImpl<$Res,
        _$CheckClientVersionResponseImpl>
    implements _$$CheckClientVersionResponseImplCopyWith<$Res> {
  __$$CheckClientVersionResponseImplCopyWithImpl(
      _$CheckClientVersionResponseImpl _value,
      $Res Function(_$CheckClientVersionResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updateExist = freezed,
    Object? optional = freezed,
  }) {
    return _then(_$CheckClientVersionResponseImpl(
      updateExist: freezed == updateExist
          ? _value.updateExist
          : updateExist // ignore: cast_nullable_to_non_nullable
              as bool?,
      optional: freezed == optional
          ? _value.optional
          : optional // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckClientVersionResponseImpl implements _CheckClientVersionResponse {
  const _$CheckClientVersionResponseImpl(
      {@JsonKey(name: 'updateExist') this.updateExist,
      @JsonKey(name: 'optional') this.optional});

  factory _$CheckClientVersionResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CheckClientVersionResponseImplFromJson(json);

  @override
  @JsonKey(name: 'updateExist')
  final bool? updateExist;
  @override
  @JsonKey(name: 'optional')
  final bool? optional;

  @override
  String toString() {
    return 'CheckClientVersionResponse(updateExist: $updateExist, optional: $optional)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckClientVersionResponseImpl &&
            (identical(other.updateExist, updateExist) ||
                other.updateExist == updateExist) &&
            (identical(other.optional, optional) ||
                other.optional == optional));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, updateExist, optional);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckClientVersionResponseImplCopyWith<_$CheckClientVersionResponseImpl>
      get copyWith => __$$CheckClientVersionResponseImplCopyWithImpl<
          _$CheckClientVersionResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckClientVersionResponseImplToJson(
      this,
    );
  }
}

abstract class _CheckClientVersionResponse
    implements CheckClientVersionResponse {
  const factory _CheckClientVersionResponse(
          {@JsonKey(name: 'updateExist') final bool? updateExist,
          @JsonKey(name: 'optional') final bool? optional}) =
      _$CheckClientVersionResponseImpl;

  factory _CheckClientVersionResponse.fromJson(Map<String, dynamic> json) =
      _$CheckClientVersionResponseImpl.fromJson;

  @override
  @JsonKey(name: 'updateExist')
  bool? get updateExist;
  @override
  @JsonKey(name: 'optional')
  bool? get optional;
  @override
  @JsonKey(ignore: true)
  _$$CheckClientVersionResponseImplCopyWith<_$CheckClientVersionResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
