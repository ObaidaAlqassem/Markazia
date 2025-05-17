import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marakzia_task/common/utilities/app_color.dart';
import 'package:marakzia_task/common/widgets/custom_appbar.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final TextEditingController textEditingController;

  const CustomTextField({
    required this.textEditingController,
    this.label,
    this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: AppColor.whiteColor,
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? '',
          style: textStyle,
        ),
        SizedBox(height: 5.h),
        TextFormField(
          controller: textEditingController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'This Field is required';
            }
            return null;
          },
          style: TextStyle(
            color: AppColor.whiteColor,
          ),
          // Text color
          cursorColor: AppColor.whiteColor,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: AppColor.whiteColor.withAlpha(700),
            ),
            filled: true,
            fillColor: Colors.transparent,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 18.h,
            ),
          ),
        ),
      ],
    );
  }
}
