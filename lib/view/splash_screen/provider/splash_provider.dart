import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marakzia_task/common/storage/app_storage.dart';
import 'package:marakzia_task/routes/app_router.dart';
import 'package:marakzia_task/routes/routes.dart';

final splashProvider = Provider<SplashNotifier>((ref) {
  return SplashNotifier();
});

class SplashNotifier {
  SplashNotifier() {
    onInit();
  }

  Future<void> onInit() async {
    Timer(
      const Duration(seconds: 3),
      () async {
        final accessToken =
            await AppStorage.getData(key: SecurePreferencesKeys.accessToken);
        final branchId =
            await AppStorage.getData(key: SecurePreferencesKeys.branchId);
        if (branchId.isEmpty) {
          AppRouter.startNewRoute(Routes.selectBranchScreen);
        } else if (accessToken.isEmpty) {
          AppRouter.startNewRoute(Routes.logInScreen);
        } else {
          AppRouter.startNewRoute(Routes.dashBoardView);
        }
      },
    );
  }
}
