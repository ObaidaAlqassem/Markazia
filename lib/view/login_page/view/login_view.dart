import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marakzia_task/common/utilities/app_color.dart';
import 'package:marakzia_task/common/widgets/custom_appbar.dart';
import 'package:marakzia_task/common/widgets/custom_button.dart';
import 'package:marakzia_task/routes/app_router.dart';
import 'package:marakzia_task/view/login_page/provider/login_provider.dart';

import '../../../common/widgets/custom_text_field.dart';

class LogInView extends ConsumerWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(logInProvider);
    final textStyle = TextStyle(
      color: AppColor.whiteColor,
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
    );
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 150.h),
            CustomTextField(
              textEditingController: notifier.employeeNumberController,
              hintText: 'Enter Employee Number',
              label: 'Employee Number',
            ),
            SizedBox(height: 25.h),
            CustomTextField(
              textEditingController: notifier.passwordController,
              hintText: 'Enter Password',
              label: 'Password',
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  buttonText: 'Back',
                  onPressed: () => AppRouter.pop(),
                ),
                CustomButton(
                  buttonText: 'Sign In',
                  onPressed: () => notifier.onLogIn(context: context),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
