import 'package:flutter/material.dart';

import '../widgets/movie_details/movie_details_screen_body.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MovieDetailsScreenBody(),
    );
  }
}
