// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      userId: json['userId'] as String?,
      role: json['role'] as String?,
      username: json['username'] as String?,
      avatar: json['avatar'] as String?,
      token: json['token'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'role': instance.role,
      'username': instance.username,
      'avatar': instance.avatar,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
    };
