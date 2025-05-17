import 'package:json_annotation/json_annotation.dart';
import 'package:marakzia_task/model/products_model.dart';

part 'login_model_result.g.dart';

@JsonSerializable()
class LoginModelResult {
  final bool? success;
  final String? accessToken;
  LoginModelResult({
    this.success,
    this.accessToken,
  });

  factory LoginModelResult.fromJson(JSON json) =>
      _$LoginModelResultFromJson(json);

  JSON toJson() => _$LoginModelResultToJson(this);
}
