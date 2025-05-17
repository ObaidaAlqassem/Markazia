import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marakzia_task/common/utilities/app_color.dart';
import 'package:marakzia_task/common/widgets/custom_appbar.dart';
import 'package:marakzia_task/common/widgets/custom_button.dart';

import '../widget/setting_page_drawer.dart';

class AppSettingView extends StatefulWidget {
  const AppSettingView({super.key});

  @override
  State<AppSettingView> createState() => _AppSettingViewState();
}

class _AppSettingViewState extends State<AppSettingView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: AppColor.whiteColor,
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
    );
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.menu,
              color: AppColor.whiteColor,
            ),
            onPressed: () {
              _scaffoldKey.currentState!.openEndDrawer();
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Please select the language',
            style: textStyle,
          ),
          SizedBox(height: 10.h),
          Text(
            'الرجاء اختيار اللغة ',
            style: textStyle,
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                buttonText: 'English',
                onPressed: () {},
              ),
              SizedBox(
                width: 20.w,
              ),
              CustomButton(
                buttonText: 'العربية',
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
      endDrawer: const SettingPageDrawer(),
    );
  }
}
