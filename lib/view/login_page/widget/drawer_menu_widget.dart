import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marakzia_task/common/utilities/app_assets.dart';
import 'package:marakzia_task/common/utilities/app_color.dart';

class DrawerMenuWidget extends StatelessWidget {
  final IconData menuIcon;
  final String menuText;
  final void Function()? onPress;

  const DrawerMenuWidget({
    required this.menuIcon,
    required this.menuText,
    this.onPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        menuIcon,
        color: AppColor.whiteColor,
      ),
      title: Text(
        menuText,
        style: TextStyle(
          color: AppColor.whiteColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () => onPress?.call(),
    );
  }
}
