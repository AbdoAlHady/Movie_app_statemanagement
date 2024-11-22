import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/custom_error_wiget.dart';
import 'package:movie_app/view_model/movie_provider.dart';
import 'package:movie_app/views/widgets/movie_list_view_loading.dart';
import 'package:provider/provider.dart';

import '../movie_list_view.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const HandleMoviesStatus();
  }
}

class HandleMoviesStatus extends StatelessWidget {
  const HandleMoviesStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(
      builder: (context, value, child) {
        if (value.isLoading && value.movies.isEmpty) {
          return const MovieListViewLoading();
        } else if (value.errorMessage != '') {
          return CustomErrorWidget(
              errorText: value.errorMessage, retryFuction: value.fetchMovies);
        } else {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: MovieListView(
                  movies: value.movies,
                ),
              ),
              if (value.isLoading && value.movies.isNotEmpty) ...[
                const SizedBox(height: 10),
                const Expanded(child: MovieListViewLoading()),
              ]
            ],
          );
        }
      },
    );
  }
}
