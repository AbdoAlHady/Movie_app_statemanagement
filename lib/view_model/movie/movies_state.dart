import 'package:movie_app/models/genres_model.dart';
import 'package:movie_app/models/movies_model.dart';

class MoviesState {
  final int currentPage;
  final bool isLoading;
  final List<MoivesResult> movies;
  final String movieError;
  final List<GenresResult> genres;
  final String genresError;

  MoviesState(
      {this.isLoading = false,
      this.currentPage = 1,
      this.movies = const [],
      this.movieError = '',
      this.genres = const [],
      this.genresError = ''});

  MoviesState copyWith({
    bool? isLoading,
    List<MoivesResult>? movies,
    String? movieError,
    List<GenresResult>? genres,
    String? genresError,
    int? currentPage,
  }) {
    return MoviesState(
        currentPage: currentPage ?? this.currentPage,
        isLoading: isLoading ?? this.isLoading,
        movies: movies ?? this.movies,
        movieError: movieError ?? this.movieError,
        genres: genres ?? this.genres,
        genresError: genresError ?? this.genresError);
  }
}
