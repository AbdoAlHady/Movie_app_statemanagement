import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_app/models/genres_model.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/repository/movies_repo.dart';

class MovieProvider extends ChangeNotifier {
  final MoviesRepo _repo;
  MovieProvider({required MoviesRepo repo}) : _repo = repo;

  int _currentPage = 1;
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  final List<MoivesResult> _movies = [];
  List<MoivesResult> get movies => _movies;

  final List<GenresResult> _genres = [];
  List<GenresResult> get genres => _genres;

  String _errorMessage = '';
  String _genresErrorMessage = '';
  String get genresErrorMessage => _genresErrorMessage;

  String get errorMessage => _errorMessage;

  Future<void> fetchMovies() async {
    _isLoading = true;
    notifyListeners();
    if (_genres.isEmpty) {
      await _fetchGenres();
    }
    final result = await _repo.getMovies(_currentPage);
    result.fold((failure) {
      _errorMessage = failure.message;
      _isLoading = false;

      log('Error: ${failure.message}');
      notifyListeners();
    }, (movieModel) {
      _isLoading = false;
      _movies.addAll(movieModel.results!);
      _currentPage++;
      _errorMessage = '';
      notifyListeners();
    });
  }

  Future<void> _fetchGenres() async {
    final result = await _repo.getGenres();
    result.fold((failure) {
      _genresErrorMessage = failure.message;
      notifyListeners();
    }, (genresModel) {
      _genres.addAll(genresModel.genres!);
      _genresErrorMessage = '';
      notifyListeners();
    });
  }
}
