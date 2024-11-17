import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theme/app_theme.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,

      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          navigatorKey: AppRouter.navigatorKey,
          onGenerateRoute: AppRouter().onGenerateRoute,
          initialRoute: Routes.home,
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
        );
      },
    );
  }
}
