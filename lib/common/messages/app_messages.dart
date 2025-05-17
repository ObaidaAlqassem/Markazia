import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marakzia_task/common/utilities/app_color.dart';

class AppMessages {
  static void alertMessage({
    required String message,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColor.errorColor,
      textColor: AppColor.whiteColor,
      fontSize: 16.sp,
    );
  }
}
