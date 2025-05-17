// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseBranchModel _$BaseBranchModelFromJson(Map<String, dynamic> json) =>
    BaseBranchModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BranchModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorCode: json['errorCode'],
    );

Map<String, dynamic> _$BaseBranchModelToJson(BaseBranchModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
      'errorCode': instance.errorCode,
    };

BranchModel _$BranchModelFromJson(Map<String, dynamic> json) => BranchModel(
      id: (json['id'] as num?)?.toInt(),
      branchNameAr: json['branchNameAr'] as String?,
      branchNameEn: json['branchNameEn'] as String?,
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => ServiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BranchModelToJson(BranchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branchNameAr': instance.branchNameAr,
      'branchNameEn': instance.branchNameEn,
      'services': instance.services,
    };

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) => ServiceModel(
      id: (json['id'] as num?)?.toInt(),
      nameEn: json['nameEn'] as String?,
      nameAr: json['nameAr'] as String?,
    );

Map<String, dynamic> _$ServiceModelToJson(ServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameEn': instance.nameEn,
      'nameAr': instance.nameAr,
    };
