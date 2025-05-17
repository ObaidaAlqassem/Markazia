import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marakzia_task/common/extension/context_extensions.dart';
import 'package:marakzia_task/common/utilities/app_color.dart';
import 'package:marakzia_task/routes/app_router.dart';

Future<void> main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return ScreenUtilInit(
      designSize: Size(
        context.screenWidth,
        context.screenHeight,
      ),
      // designSize: ScreenUtil.defaultSize,
      builder: (context, child) => MaterialApp(
        title: 'Markazia Task',
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: AppColor.whiteColor,
          canvasColor: AppColor.blackColor,
          scaffoldBackgroundColor: AppColor.blackColor,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: AppColor.whiteColor,

            selectionColor: Colors.blue[200],
            selectionHandleColor: Colors.blue[300],
          ),
          primaryTextTheme: TextTheme(
            bodyMedium: TextStyle(color: AppColor.whiteColor),
          ),
          inputDecorationTheme: InputDecorationTheme(
            floatingLabelStyle: TextStyle(color: AppColor.greyColor) ,
            helperStyle:  TextStyle(color: AppColor.greyColor) ,
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
            bodyMedium: TextStyle(color: AppColor.whiteColor),        // Input text color
          ),
        ),
        initialRoute: AppRouter.initialRoute,
        navigatorKey: AppRouter.navigatorKey,
        onGenerateRoute: AppRouter.generateRoute,
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return UnFocusWidget(
            child: child!,
          );
        },
      ),
    );
  }
}

class UnFocusWidget extends StatelessWidget {
  const UnFocusWidget({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}
