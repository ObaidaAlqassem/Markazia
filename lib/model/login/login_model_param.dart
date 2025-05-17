import 'package:json_annotation/json_annotation.dart';
import 'package:marakzia_task/model/products_model.dart';

part 'login_model_param.g.dart';

@JsonSerializable()
class LoginModelParam {
  final String? username;
  final String? password;

  LoginModelParam({
    this.username,
    this.password,
  });

  factory LoginModelParam.fromJson(JSON json) =>
      _$LoginModelParamFromJson(json);

  JSON toJson() => _$LoginModelParamToJson(this);
}
