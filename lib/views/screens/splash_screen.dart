import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/extensions.dart';
import 'package:movie_app/core/helpers/spacing.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/core/service/setup_getit.dart';
import 'package:movie_app/core/widgets/custom_error_wiget.dart';
import 'package:movie_app/repository/movies_repo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String errorMessage = "";
  bool isLoading = true;

  Future<void> _loadData() async {
    setState(() {
      isLoading = true;
      errorMessage = "";
    });
    final result = await getIt<MoviesRepo>().getGenres();
    result.fold((error) {
      setState(() {
        errorMessage = error.errorModel.message!;
        isLoading = false;
      });
    }, (geners) {
      context.pushReplacementNamed(Routes.home);
      Future.delayed(const Duration(milliseconds: 100), () {
        setState(() {
          isLoading = false;
        });
      });
    });
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Loading..."),
                  verticalSpacing(10),
                  const CircularProgressIndicator(),
                ],
              ),
            )
          : CustomErrorWidget(
              errorText: errorMessage, retryFuction: () => _loadData()),
    );
  }
}
