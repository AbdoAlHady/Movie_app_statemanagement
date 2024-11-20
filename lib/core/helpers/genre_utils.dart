import 'package:movie_app/core/service/setup_getit.dart';
import 'package:movie_app/models/genres_model.dart';
import 'package:movie_app/repository/movies_repo.dart';

class GenreUtils {
  static List<GenresResult> movieGenresNames(List<int> genreIds) {
    var cachedGenres = getIt<MoviesRepo>().cachedGenres;
    List<GenresResult> genres = [];
    for (var id in genreIds) {
      var genre = cachedGenres.firstWhere((element) => element.id == id,
          orElse: () => GenresResult(id: 0, name: "Unknown"));
      genres.add(genre);
    }
    return genres;
  }
}
