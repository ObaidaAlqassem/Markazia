import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marakzia_task/common/utilities/app_assets.dart';
import 'package:marakzia_task/common/utilities/app_color.dart';
import 'package:marakzia_task/routes/app_router.dart';
import 'package:marakzia_task/routes/routes.dart';
import 'package:marakzia_task/view/login_page/widget/drawer_menu_widget.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingPageDrawer extends StatefulWidget {
  const SettingPageDrawer({super.key});

  @override
  State<SettingPageDrawer> createState() => _SettingPageDrawerState();
}

class _SettingPageDrawerState extends State<SettingPageDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.blackColor,
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h).copyWith(
              top: 60.h,
            ),
            child: Row(
              children: [
                Expanded(
                  child: SvgPicture.asset(
                    AppAssets.appLogo,
                    height: 60,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: AppColor.whiteColor,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),

          DrawerMenuWidget(
            menuIcon: Icons.settings,
            menuText: 'Kiosk Settings',
            onPress: () => AppRouter.pushNamed(
              Routes.logInScreen,
            ),
          ),
          const Spacer(),
          // Bottom: Version Info
          Column(
            children: [
              Text(
                'Check for updates',
                style: TextStyle(
                  color: AppColor.whiteColor,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(height: 4.h),
              if (packageInfo?.version != null) ...[
                Text(
                  'Version ${packageInfo?.version}',
                  style: TextStyle(
                    color: AppColor.whiteColor.withAlpha(150),
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }

  onFillAppInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
    setState(() {});
  }

  PackageInfo? packageInfo;

  @override
  void initState() {
    onFillAppInfo();
    super.initState();
  }
}
