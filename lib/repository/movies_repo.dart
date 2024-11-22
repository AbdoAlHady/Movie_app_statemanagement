import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:movie_app/core/network/api_error_handler.dart';
import 'package:movie_app/models/genres_model.dart';
import 'package:movie_app/models/movies_model.dart';

import '../core/errors/failure.dart';
import '../core/network/api_service.dart';

class MoviesRepo {
  final ApiService _apiService;

  MoviesRepo({required ApiService apiService}) : _apiService = apiService;

  Future<Either<Failure, MoviesModel>> getMovies(int page) async {
    try {
      final movies = await _apiService.getMovies(page);
      return Right(movies);
    } catch (e) {
      log("get movies errors: $e");
      return Left(ServerFailure(ApiErrorHandler.hanlde(e).message!));
    }
  }

  Future<Either<Failure, GenresModel>> getGenres() async {
    try {
      final genres = await _apiService.getGenres();
      return Right(genres);
    } catch (e) {
      return Left(ServerFailure(ApiErrorHandler.hanlde(e).message!));
    }
  }
}
