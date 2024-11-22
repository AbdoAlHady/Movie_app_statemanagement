import 'package:flutter/material.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/view_model/movie_provider.dart';
import 'package:movie_app/views/widgets/movie_list_view_item.dart';
import 'package:provider/provider.dart';

class MovieListView extends StatelessWidget {
  const MovieListView({
    super.key,
    required this.movies,
  });

  final List<MoivesResult> movies;

  @override
  Widget build(BuildContext context) {
    var movieProvider = Provider.of<MovieProvider>(context, listen: false);
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
            !movieProvider.isLoading) {
          movieProvider.fetchMovies();
          return true;
        }
        return false;
      },
      child: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return MovieListViewItem(movie: movies[index]);
        },
      ),
    );
  }
}
