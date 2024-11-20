import 'package:flutter/material.dart';
import 'package:movie_app/models/movies_model.dart';

import '../widgets/movie_details/movie_details_screen_body.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movie});
  final MoivesResult movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MovieDetailsScreenBody(
        movie: movie,
      ),
    );
  }
}
