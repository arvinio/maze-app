// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifyResponseImpl _$$VerifyResponseImplFromJson(Map<String, dynamic> json) =>
    _$VerifyResponseImpl(
      userId: json['userId'] as String?,
      token: json['token'] as String?,
      refreshToken: json['refreshToken'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$VerifyResponseImplToJson(
        _$VerifyResponseImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'message': instance.message,
    };
