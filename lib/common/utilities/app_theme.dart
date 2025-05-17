import 'package:flutter/material.dart';
import 'package:marakzia_task/common/utilities/app_color.dart';

class AppTheme {
  static get appTheme => ThemeData(
        useMaterial3: true,
        primaryColor: AppColor.whiteColor,
        canvasColor: AppColor.blackColor,
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: AppColor.whiteColor, // Set your desired color here
        ),
        scaffoldBackgroundColor: AppColor.blackColor,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColor.whiteColor,
        ),
        primaryTextTheme: TextTheme(
          bodyMedium: TextStyle(color: AppColor.whiteColor),
        ),
        inputDecorationTheme: InputDecorationTheme(
          floatingLabelStyle: TextStyle(color: AppColor.greyColor),
          helperStyle: TextStyle(color: AppColor.greyColor),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.greyColor), // Default border
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.whiteColor), // When focused
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.errorColor), // On error
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.errorColor),
          ),
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: AppColor.whiteColor), // Input text color
        ),
      );
}
