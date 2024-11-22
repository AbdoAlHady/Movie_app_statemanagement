import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helpers/cache_helper.dart';
import 'package:movie_app/core/service/setup_getit.dart';
import 'package:movie_app/core/utils/shared_pref_keys.dart';
import 'package:movie_app/view_model/favorite_provider.dart';
import 'package:movie_app/view_model/movie_provider.dart';
import 'package:movie_app/view_model/theme_provider.dart';
import 'package:provider/provider.dart';

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
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<ThemeProvider>(
              create: (_) => ThemeProvider()
                ..changeTheme(
                  isDark:
                      CacheHelper().getData(key: SharedPrefKeys.isDarkMode) ??
                          false,
                ),
            ),
            ChangeNotifierProvider(
                create: (_) => MovieProvider(repo: getIt())..fetchMovies()),
            ChangeNotifierProvider(
                create: (_) => FavoriteProvider()..getFavorites()),
          ],
          child: Consumer<ThemeProvider>(
            builder: (context, value, child) {
              return MaterialApp(
                navigatorKey: AppRouter.navigatorKey,
                onGenerateRoute: AppRouter().onGenerateRoute,
                initialRoute: Routes.home,
                title: 'Flutter Demo',
                theme: value.isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
              );
            },
          ),
        );
      },
    );
  }
}
