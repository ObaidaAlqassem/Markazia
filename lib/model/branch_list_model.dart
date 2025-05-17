import 'package:json_annotation/json_annotation.dart';
import 'package:marakzia_task/model/products_model.dart';

part 'branch_list_model.g.dart';

@JsonSerializable()
class BaseBranchListModel {
  final bool? success;
  final String? message;
  final List<BranchModel>? data;
  final dynamic errorCode;

  BaseBranchListModel({
    this.success,
    this.message,
    this.data,
    this.errorCode,
  });

  factory BaseBranchListModel.fromJson(JSON json) =>
      _$BaseBranchListModelFromJson(json);

  JSON toJson() => _$BaseBranchListModelToJson(this);
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
  @JsonKey(name: 'serviceId')
  final int? id;
  @JsonKey(name: 'serviceNameEn')
  final String? nameEn;
  @JsonKey(name: 'serviceNameAr')
  final String? nameAr;
  bool? isEnabled;

  ServiceModel({
    this.id,
    this.nameEn,
    this.nameAr,
    this.isEnabled,
  });

  factory ServiceModel.fromJson(JSON json) => _$ServiceModelFromJson(json);

  JSON toJson() => _$ServiceModelToJson(this);
}
