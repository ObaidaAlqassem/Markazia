import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marakzia_task/common/utilities/app_assets.dart';

import '../utilities/app_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;
  final Color? backgroundColor;

  const CustomAppBar({
    super.key,
    this.actions,
    this.leading,
    this.centerTitle = true,
    this.backgroundColor,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SvgPicture.asset(
        AppAssets.appLogo,
        width: 60.w,
        height: 50.h,
        fit: BoxFit.fill,
      ),
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: AppColor.blackColor,
      actions: actions,
      leading: leading,
    );
  }
}
