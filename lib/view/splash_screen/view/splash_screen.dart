import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marakzia_task/common/utilities/app_assets.dart';
import 'package:marakzia_task/common/utilities/app_color.dart';
import 'package:marakzia_task/view/splash_screen/provider/splash_provider.dart';

class SplashScreenView extends ConsumerWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(splashProvider);
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      body: Center(
        child: SvgPicture.asset(
          AppAssets.appLogo,
        ),
      ),
    );
  }
}
