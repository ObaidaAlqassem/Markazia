// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModelResult _$LoginModelResultFromJson(Map<String, dynamic> json) =>
    LoginModelResult(
      success: json['success'] as bool?,
      accessToken: json['accessToken'] as String?,
    );

Map<String, dynamic> _$LoginModelResultToJson(LoginModelResult instance) =>
    <String, dynamic>{
      'success': instance.success,
      'accessToken': instance.accessToken,
    };
