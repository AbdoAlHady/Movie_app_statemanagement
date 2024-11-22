import 'package:movie_app/models/genres_model.dart';

class GenreUtils {
  static List<GenresResult> movieGenresNames(
      List<int> genreIds, List<GenresResult> genresList) {
    List<GenresResult> genres = [];
    for (var id in genreIds) {
      var genre = genresList.firstWhere((element) => element.id == id,
          orElse: () => GenresResult(id: 0, name: "Unknown"));
      genres.add(genre);
    }
    return genres;
  }
}
