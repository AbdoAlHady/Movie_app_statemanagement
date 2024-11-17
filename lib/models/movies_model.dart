import 'package:json_annotation/json_annotation.dart';
part 'movies_model.g.dart';

@JsonSerializable()
class MoviesModel {
  final List<MoivesResult>? results;

  MoviesModel({this.results});

  factory MoviesModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesModelFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesModelToJson(this);
}

@JsonSerializable()
class MoivesResult {
  bool? adult;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;
  int? id;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  String? overview;
  double? popularity;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  String? title;
  bool? video;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  @JsonKey(name: 'vote_count')
  int? voteCount;

  MoivesResult(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  factory MoivesResult.fromJson(Map<String, dynamic> json) =>
      _$MoivesResultFromJson(json);

  Map<String, dynamic> toJson() => _$MoivesResultToJson(this);
}
