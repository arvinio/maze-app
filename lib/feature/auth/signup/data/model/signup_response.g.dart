// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignupResponseImpl _$$SignupResponseImplFromJson(Map<String, dynamic> json) =>
    _$SignupResponseImpl(
      success: json['success'] as bool?,
      userId: json['userId'] as String?,
      code: json['code'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$SignupResponseImplToJson(
        _$SignupResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'userId': instance.userId,
      'code': instance.code,
      'message': instance.message,
    };
