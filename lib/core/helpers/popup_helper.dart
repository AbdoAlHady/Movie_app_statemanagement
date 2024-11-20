import 'package:flutter/material.dart';
import 'package:movie_app/core/routing/app_router.dart';

abstract class PopupHelper {
  // show snackbar
  static void showSnackBar(String message) {
    final SnackBar snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
    );
    ScaffoldMessenger.of(AppRouter.navigatorKey.currentContext!)
        .hideCurrentSnackBar();
    ScaffoldMessenger.of(AppRouter.navigatorKey.currentContext!)
        .showSnackBar(snackBar);
  }

  // show dialog
}
