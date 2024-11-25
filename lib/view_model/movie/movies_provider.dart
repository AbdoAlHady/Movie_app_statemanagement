import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/service/setup_getit.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/repository/movies_repo.dart';
import 'package:movie_app/view_model/movie/movies_state.dart';

final movieProvider = StateNotifierProvider<MoviesProvider, MoviesState>((ref) {
  return MoviesProvider(getIt<MoviesRepo>());
});

final currentMovie = Provider.family<MoivesResult, int>(
  (ref, index) {
    final moviesState = ref.watch(movieProvider);
    return moviesState.movies[index];
  },
);

class MoviesProvider extends StateNotifier<MoviesState> {
  final MoviesRepo _repo;
  MoviesProvider(this._repo) : super(MoviesState()) {
    getMovies();
    log('MoviesProvider created');
  }

  void getMovies() async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true);
    if (state.genres.isEmpty) {
      await getGenres();
    }
    final result = await _repo.getMovies(state.currentPage);
    result.fold((failure) {
      state = state.copyWith(
        isLoading: false,
        movieError: failure.message,
      );
    }, (movieModel) {
      state = state.copyWith(
          isLoading: false,
          movies: [...state.movies, ...movieModel.results!],
          movieError: '',
          currentPage: state.currentPage + 1);
      log('movies length: ${state.movies.length}');
    });
  }

  Future<void> getGenres() async {
    final result = await _repo.getGenres();
    result.fold((failure) {
      state = state.copyWith(genresError: failure.message);
    }, (genresModel) {
      state = state.copyWith(genres: genresModel.genres!);
    });
  }
}
