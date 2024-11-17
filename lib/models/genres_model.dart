import 'package:json_annotation/json_annotation.dart';
part 'genres_model.g.dart';

@JsonSerializable()
class GenresModel {
  final List<GenresResult>? genres;

  GenresModel({this.genres});

  factory GenresModel.fromJson(Map<String, dynamic> json) =>
      _$GenresModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenresModelToJson(this);
}

@JsonSerializable()
class GenresResult {
  final int? id;
  final String? name;

  GenresResult({this.id, this.name});

  factory GenresResult.fromJson(Map<String, dynamic> json) =>
      _$GenresResultFromJson(json);

  Map<String, dynamic> toJson() => _$GenresResultToJson(this);
}
