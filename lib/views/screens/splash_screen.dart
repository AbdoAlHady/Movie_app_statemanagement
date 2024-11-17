import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/custom_error_wiget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomErrorWidget(errorText: "Error Text", retryFuction: () {}),
    );
  }
}
