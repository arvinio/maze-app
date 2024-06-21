// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifyResponseImpl _$$VerifyResponseImplFromJson(Map<String, dynamic> json) =>
    _$VerifyResponseImpl(
      success: json['success'] as bool?,
      userId: json['userId'] as String?,
      token: json['token'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$$VerifyResponseImplToJson(
        _$VerifyResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'userId': instance.userId,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
    };
