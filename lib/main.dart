import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marakzia_task/common/extension/context_extensions.dart';
import 'package:marakzia_task/common/utilities/app_theme.dart';
import 'package:marakzia_task/generated/l10n.dart';
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
        theme: AppTheme.appTheme,
        initialRoute: AppRouter.initialRoute,
        navigatorKey: AppRouter.navigatorKey,
        onGenerateRoute: AppRouter.generateRoute,
        localizationsDelegates: const [
          S.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
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
