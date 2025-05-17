import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marakzia_task/common/utilities/app_assets.dart';
import 'package:marakzia_task/common/utilities/app_color.dart';
import 'package:marakzia_task/view/login_page/widget/drawer_menu_widget.dart';

class SettingPageDrawer extends StatelessWidget {
  const SettingPageDrawer({super.key});

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

          const DrawerMenuWidget(
            menuIcon: Icons.settings,
            menuText: 'Kiosk Settings',
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
              Text(
                'Version 24.08.1',
                style: TextStyle(
                  color: AppColor.whiteColor.withAlpha(150),
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
