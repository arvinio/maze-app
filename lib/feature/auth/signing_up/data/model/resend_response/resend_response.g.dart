// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResendResponseImpl _$$ResendResponseImplFromJson(Map<String, dynamic> json) =>
    _$ResendResponseImpl(
      success: json['success'] as bool?,
      userId: json['userId'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$$ResendResponseImplToJson(
        _$ResendResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'userId': instance.userId,
      'code': instance.code,
    };
