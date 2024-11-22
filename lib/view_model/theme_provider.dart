import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/cache_helper.dart';
import 'package:movie_app/core/utils/shared_pref_keys.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark = false;

  void changeTheme({bool? isDark}) async {
    if (isDark != null) {
      this.isDark = isDark;
      await CacheHelper()
          .saveData(key: SharedPrefKeys.isDarkMode, value: isDark);
      notifyListeners();
    } else {
      this.isDark = !this.isDark;
      await CacheHelper()
          .saveData(key: SharedPrefKeys.isDarkMode, value: this.isDark);
      notifyListeners();
    }
  }
}
