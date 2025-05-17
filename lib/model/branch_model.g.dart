// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseBranchModel _$BaseBranchModelFromJson(Map<String, dynamic> json) =>
    BaseBranchModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : BranchModel.fromJson(json['data'] as Map<String, dynamic>),
      errorCode: json['errorCode'],
    );

Map<String, dynamic> _$BaseBranchModelToJson(BaseBranchModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
      'errorCode': instance.errorCode,
    };
