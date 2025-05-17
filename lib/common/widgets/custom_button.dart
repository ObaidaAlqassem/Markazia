import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marakzia_task/common/utilities/app_color.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;

  const CustomButton({
    required this.buttonText,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.whiteColor.withAlpha(800),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: AppColor.whiteColor,
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
