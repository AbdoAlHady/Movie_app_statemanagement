import 'package:dio/dio.dart';
import 'package:movie_app/core/network/api_constants.dart';
import 'package:movie_app/models/genres_model.dart';
import 'package:movie_app/models/movies_model.dart';

import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('${ApiConstants.person}/popular')
  Future<MoviesModel> getMovies(@Query('page') int page);

  @GET('${ApiConstants.genre}/movie/list')
  Future<GenresModel> getGenres();
}
