import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/genre_utils.dart';
import 'package:movie_app/models/genres_model.dart';
import 'package:movie_app/views/widgets/home/genres_item.dart';

class GenresListItem extends StatelessWidget {
  const GenresListItem({super.key, required this.genresId});
  final List<int> genresId;

  @override
  Widget build(BuildContext context) {
    List<GenresResult> genres = GenreUtils.movieGenresNames(genresId);
    return Wrap(
      children: List.generate(genres.length, (index) {
        return GenresItem(label: genres[index].name!);
      }),
    );
  }
}
