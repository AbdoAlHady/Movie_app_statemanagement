import 'package:flutter/material.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/views/widgets/movie_list_view_item.dart';

class FavoritesListView extends StatelessWidget {
  const FavoritesListView({super.key, required this.movies});
  final List<MoivesResult> movies;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return MovieListViewItem(movie: movies[index]);
      },
    );
  }
}
