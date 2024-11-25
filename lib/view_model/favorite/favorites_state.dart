import 'package:movie_app/models/movies_model.dart';

class FavoritesState {
  final List<MoivesResult> movies;
  final bool isLoading;

  FavoritesState({this.movies = const [], this.isLoading = false});

  FavoritesState copyWith({
    List<MoivesResult>? movies,
    bool? isLoading,
  }) {
    return FavoritesState(
      movies: movies ?? this.movies,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
