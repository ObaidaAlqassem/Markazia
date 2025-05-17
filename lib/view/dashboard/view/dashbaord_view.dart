import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marakzia_task/common/utilities/app_color.dart';
import 'package:marakzia_task/common/widgets/custom_appbar.dart';
import 'package:marakzia_task/view/dashboard/model/service_menu_model.dart';
import 'package:marakzia_task/view/dashboard/provider/dashboard_provider.dart';

class DashBoardView extends ConsumerWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(dashboardProvider);
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        itemBuilder: (_, index) {
          final serviceMenu = notifier.serviceMenuList[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: InkWell(
              onTap: () => notifier.onClickOnServiceMenu(
                serviceMenu: serviceMenu,
              ),
              child: Text(
                serviceMenu.serviceMenuTitle,
                style: TextStyle(
                  color: AppColor.whiteColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (_, index) {
          return Column(
            children: [
              SizedBox(height: 5.h),
              const Divider(),
              SizedBox(height: 5.h),
            ],
          );
        },
        itemCount: notifier.serviceMenuList.length,
      ),
    );
  }
}
