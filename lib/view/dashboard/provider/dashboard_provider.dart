import 'dart:ui';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marakzia_task/common/app_setting/provider/app_setting_provider.dart';
import 'package:marakzia_task/common/storage/app_storage.dart';
import 'package:marakzia_task/routes/app_router.dart';
import 'package:marakzia_task/routes/routes.dart';
import 'package:marakzia_task/view/dashboard/model/service_menu_model.dart';

final dashboardProvider = Provider<DashboardNotifier>((ref) {
  return DashboardNotifier(ref);
});

class DashboardNotifier {
  final Ref ref;

  DashboardNotifier(this.ref);

  final serviceMenuList = [
    ServiceMenuModel(
      serviceMenuId: 1,
      serviceMenuTitle: 'Service Controls',
    ),
    ServiceMenuModel(
      serviceMenuId: 2,
      serviceMenuTitle: 'Branch Selection',
    ),
    ServiceMenuModel(
      serviceMenuId: 3,
      serviceMenuTitle: 'Sign Out',
    ),
  ];

  Future<void> onClickOnServiceMenu({
    required ServiceMenuModel serviceMenu,
  }) async {
    switch (serviceMenu.serviceMenuId) {
      case 1:
        await AppRouter.pushNamed(
          Routes.serviceControlScreen,
        );
        return;
      case 2:
        await AppRouter.pushNamed(
          Routes.selectBranchScreen,
        );
        return;
      case 3:
        AppStorage.deleteData();
        AppRouter.startNewRoute(Routes.selectBranchScreen);
        return;
    }
  }
}
