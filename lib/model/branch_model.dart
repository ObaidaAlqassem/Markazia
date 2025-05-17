import 'package:json_annotation/json_annotation.dart';
import 'package:marakzia_task/model/branch_list_model.dart';
import 'package:marakzia_task/model/products_model.dart';

part 'branch_model.g.dart';

@JsonSerializable()
class BaseBranchModel {
  final bool? success;
  final String? message;
  final BranchModel? data;
  final dynamic errorCode;

  BaseBranchModel({
    this.success,
    this.message,
    this.data,
    this.errorCode,
  });

  factory BaseBranchModel.fromJson(JSON json) =>
      _$BaseBranchModelFromJson(json);

  JSON toJson() => _$BaseBranchModelToJson(this);
}
