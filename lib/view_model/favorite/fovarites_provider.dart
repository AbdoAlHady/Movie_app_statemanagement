import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/service/setup_getit.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/repository/movies_repo.dart';
import 'package:movie_app/view_model/favorite/favorites_state.dart';

final favoritesProvider =
    StateNotifierProvider<FovaritesProvider, FavoritesState>(
        (ref) => FovaritesProvider(getIt<MoviesRepo>()));

class FovaritesProvider extends StateNotifier<FavoritesState> {
  FovaritesProvider(this.repo) : super(FavoritesState()) {
    getFavorites();
  }
  final MoviesRepo repo;

  bool isFavorite(MoivesResult movie) {
    return state.movies.any((element) => element.id == movie.id);
  }

  void getFavorites() async {
    state = state.copyWith(isLoading: true);
    final movies = await repo.getFavorites();
    state = state.copyWith(movies: movies, isLoading: false);
  }

  void addOrRemoveFavorite(MoivesResult movie) {
    if (isFavorite(movie)) {
      var newMovies =
          state.movies.where((element) => element.id != movie.id).toList();
      repo.saveFavorites(newMovies);
      state = state.copyWith(movies: newMovies);
    } else {
      var newMovies = [...state.movies, movie];
      repo.saveFavorites(newMovies);
      state = state.copyWith(movies: newMovies);
    }
  }

  void deleteFavorites() {
    repo.deleteFavorities();
    state = state.copyWith(movies: []);
  }
}
