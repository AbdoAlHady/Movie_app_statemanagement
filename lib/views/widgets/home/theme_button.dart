import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_icons.dart';
import 'package:movie_app/view_model/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) {
        return IconButton(
          icon: Icon(
            value.isDark ? AppIcons.lightMode : AppIcons.darkMode,
          ),
          onPressed: () async {
            value.changeTheme();
          },
        );
      },
    );
  }
}
