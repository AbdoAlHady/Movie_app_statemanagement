import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_constants.dart';
import 'package:movie_app/views/widgets/movie_list_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MovieListViewLoading extends StatelessWidget {
  const MovieListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: MovieListView(movies: AppConstants.randomMovies),
    );
  }
}
