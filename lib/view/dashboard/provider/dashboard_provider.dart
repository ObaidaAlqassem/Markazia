import 'package:hooks_riverpod/hooks_riverpod.dart';
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

  void onClickOnServiceMenu({
    required ServiceMenuModel serviceMenu,
  }) {
    switch (serviceMenu.serviceMenuId) {
      case 1:
        return;
      case 2:
        return;
      case 3:
        return;
    }
  }
}
