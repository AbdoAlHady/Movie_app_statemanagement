import 'package:dartz/dartz.dart';
import 'package:movie_app/core/network/api_error_handler.dart';
import 'package:movie_app/models/genres_model.dart';
import 'package:movie_app/models/movies_model.dart';

import '../core/errors/failure.dart';
import '../core/network/api_service.dart';

class MoviesRepo {
  final ApiService _apiService;

  List<GenresResult> cachedGenres = [];

  MoviesRepo({required ApiService apiService}) : _apiService = apiService;

  Future<Either<Failure, MoviesModel>> getMovies(int page) async {
    try {
      final movies = await _apiService.getMovies(page);
      return Right(movies);
    } catch (e) {
      return Left(ServerFailure(errorModel: ApiErrorHandler.hanlde(e)));
    }
  }

  Future<Either<Failure, GenresModel>> getGenres() async {
    try {
      final genres = await _apiService.getGenres();
      cachedGenres.addAll(genres.genres!);

      return Right(genres);
    } catch (e) {
      return Left(ServerFailure(errorModel: ApiErrorHandler.hanlde(e)));
    }
  }
}
