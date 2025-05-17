import 'package:json_annotation/json_annotation.dart';
import 'package:marakzia_task/model/products_model.dart';

part 'branch_model.g.dart';

@JsonSerializable()
class BaseBranchModel {
  final bool? success;
  final String? message;
  final List<BranchModel>? data;
  final dynamic errorCode;

  BaseBranchModel({
    this.success,
    this.message,
    this.data,
    this.errorCode,
  });

  factory BaseBranchModel.fromJson(JSON json) => _$BaseBranchModelFromJson(json);

  JSON toJson() => _$BaseBranchModelToJson(this);
}

@JsonSerializable()
class BranchModel {
  final int? id;
  final String? branchNameAr;
  final String? branchNameEn;
  final List<ServiceModel>? services;

  BranchModel({
    this.id,
    this.branchNameAr,
    this.branchNameEn,
    this.services,
  });

  factory BranchModel.fromJson(JSON json) => _$BranchModelFromJson(json);

  JSON toJson() => _$BranchModelToJson(this);
}

@JsonSerializable()
class ServiceModel {
  final int? id;
  final String? nameEn;
  final String? nameAr;

  ServiceModel({
    this.id,
    this.nameEn,
    this.nameAr,
  });

  factory ServiceModel.fromJson(JSON json) => _$ServiceModelFromJson(json);

  JSON toJson() => _$ServiceModelToJson(this);
}