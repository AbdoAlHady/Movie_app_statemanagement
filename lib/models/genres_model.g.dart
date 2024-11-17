// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenresModel _$GenresModelFromJson(Map<String, dynamic> json) => GenresModel(
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => GenresResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GenresModelToJson(GenresModel instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };

GenresResult _$GenresResultFromJson(Map<String, dynamic> json) => GenresResult(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GenresResultToJson(GenresResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
