import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/enums/theme_type.dart';
import 'package:movie_app/core/helpers/cache_helper.dart';
import 'package:movie_app/core/utils/shared_pref_keys.dart';

final themeProvier = StateNotifierProvider<ThemeProvider, ThemeType>((ref) {
  return ThemeProvider();
});

class ThemeProvider extends StateNotifier<ThemeType> {
  ThemeProvider() : super(ThemeType.light) {
    _loadTheme();
  }

  _loadTheme() async {
    var isDark =
        await CacheHelper().getData(key: SharedPrefKeys.isDark) ?? false;
    state = isDark ? ThemeType.dark : ThemeType.light;
  }

  void changeTheme() async {
    state = state == ThemeType.light ? ThemeType.dark : ThemeType.light;
    await CacheHelper().saveData(
      key: SharedPrefKeys.isDark,
      value: state == ThemeType.light ? false : true,
    );
  }
}
