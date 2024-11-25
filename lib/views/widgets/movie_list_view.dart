import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/view_model/movie/movies_provider.dart';
import 'package:movie_app/views/widgets/movie_list_view_item.dart';

class MovieListView extends ConsumerWidget {
  const MovieListView({
    super.key,
    required this.movies,
  });
  final List<MoivesResult> movies;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = ref.watch(movieProvider.select((value) => value.isLoading));
    return NotificationListener(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo is ScrollEndNotification &&
            scrollInfo.metrics.extentAfter == 0 &&
            !loading) {
          log('done');
          ref.read(movieProvider.notifier).getMovies();
        }
        return true;
      },
      child: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return MovieListViewItem(
            movie: movies[index],
          );
        },
      ),
    );
  }
}
