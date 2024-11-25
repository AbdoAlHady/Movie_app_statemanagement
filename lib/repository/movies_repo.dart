import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:movie_app/core/helpers/cache_helper.dart';
import 'package:movie_app/core/network/api_error_handler.dart';
import 'package:movie_app/core/utils/shared_pref_keys.dart';
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

  Future<List<MoivesResult>> getFavorites() async {
    var stringList = CacheHelper().getDataList(key: SharedPrefKeys.favorites);
    List<MoivesResult> movies =
        stringList.map((e) => MoivesResult.fromJson(jsonDecode(e))).toList();
    return Future.value(movies);
  }

  Future<void> saveFavorites(List<MoivesResult> movies) async {
    List<String> stringList =
        movies.map((e) => jsonEncode(e.toJson())).toList();
    await CacheHelper()
        .saveData(key: SharedPrefKeys.favorites, value: stringList);
  }

  void deleteFavorities() async {
    await CacheHelper().removeData(key: SharedPrefKeys.favorites);
  }
}
