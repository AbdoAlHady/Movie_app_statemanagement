import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/helpers/spacing.dart';
import 'package:movie_app/core/utils/app_constants.dart';
import 'package:movie_app/core/widgets/custom_error_wiget.dart';
import 'package:movie_app/view_model/movie/movies_provider.dart';
import 'package:movie_app/views/widgets/movie_list_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HandleMoviesStates extends ConsumerWidget {
  const HandleMoviesStates({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesState = ref.watch(movieProvider);
    if (moviesState.isLoading && moviesState.movies.isEmpty) {
      return Skeletonizer(
          enabled: moviesState.isLoading,
          child: MovieListView(movies: AppConstants.randomMovies));
    } else if (moviesState.movieError.isNotEmpty) {
      return CustomErrorWidget(
          errorText: moviesState.movieError,
          retryFuction: ref.read(movieProvider.notifier).getMovies);
    } else {
      return Column(
        children: [
          Expanded(child: MovieListView(movies: moviesState.movies)),
          if (moviesState.isLoading && moviesState.movies.isNotEmpty) ...[
            verticalSpacing(10),
            const CircularProgressIndicator(),
          ]
        ],
      );
    }
  }
}
