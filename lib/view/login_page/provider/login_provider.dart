import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marakzia_task/common/dialog/app_dialog.dart';
import 'package:marakzia_task/common/messages/app_messages.dart';
import 'package:marakzia_task/common/storage/app_storage.dart';
import 'package:marakzia_task/model/login/login_model_param.dart';
import 'package:marakzia_task/model/login/login_model_result.dart';
import 'package:marakzia_task/routes/app_router.dart';
import 'package:marakzia_task/routes/routes.dart';
import 'package:marakzia_task/services/api/http/http_service.dart';

import '../../../services/api/apt_path.dart';

final logInProvider = Provider<LogInNotifier>((ref) {
  return LogInNotifier();
});

class LogInNotifier {
  final employeeNumberController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> onLogIn({
    required BuildContext context,
  }) async {
    await AppDialog.onLoading(context: context);
    final logInResult = await HttpService.instance.post<LoginModelResult>(
      url: APIPath.logIn,
      fromJsonMethod: LoginModelResult.fromJson,
      body: LoginModelParam(
        username: kDebugMode ? 'islam' : passwordController.text,
        password: kDebugMode ? 'ssbs123' : employeeNumberController.text,
      ).toJson(),
    );
    AppRouter.pop();
    if (logInResult.isRight()) {
      AppStorage.setData(
        key: SecurePreferencesKeys.accessToken,
        data: logInResult.getRight()?.accessToken ?? '',
      );
      AppRouter.startNewRoute(Routes.dashBoardView);
    } else {
      AppMessages.alertMessage(
        message: 'You are unauthorized to make login',
      );
    }
  }
}
