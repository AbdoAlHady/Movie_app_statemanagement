import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/genres_utils.dart';
import 'package:movie_app/models/genres_model.dart';
import 'package:movie_app/view_model/movie_provider.dart';
import 'package:movie_app/views/widgets/home/genres_item.dart';
import 'package:provider/provider.dart';

class GenresListItem extends StatelessWidget {
  const GenresListItem({super.key, required this.genresInt});
  final List<int> genresInt;

  @override
  Widget build(BuildContext context) {
    List<GenresResult> genres = GenreUtils.movieGenresNames(
        genresInt, context.watch<MovieProvider>().genres);
    return Wrap(
      children: List.generate(genres.length, (index) {
        return GenresItem(label: genres[index].name!);
      }),
    );
  }
}
