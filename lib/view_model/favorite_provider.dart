import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/cache_helper.dart';
import 'package:movie_app/core/utils/shared_pref_keys.dart';
import 'package:movie_app/models/movies_model.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<MoivesResult> _favorites = [];
  List<MoivesResult> get favorites => _favorites;

  bool isFavorite(MoivesResult movie) {
    return _favorites.any((element) => element.id == movie.id);
  }

  void addOrRemoveFavorite(MoivesResult movie) {
    if (isFavorite(movie)) {
      _favorites.removeWhere((element) => element.id == movie.id);
    } else {
      _favorites.add(movie);
    }
    saveFavorites();
    notifyListeners();
  }

  void saveFavorites() async {
    var stringList = _favorites.map((e) => jsonEncode(e.toJson())).toList();
    CacheHelper().saveData(key: SharedPrefKeys.favsKey, value: stringList);
  }

  void getFavorites() {
    var data = CacheHelper().getDataList(key: SharedPrefKeys.favsKey);
    _favorites.clear();
    List<MoivesResult> list =
        data.map((e) => MoivesResult.fromJson(jsonDecode(e))).toList();
    _favorites.addAll(list);
    notifyListeners();
  }

  void clearFavorites() {
    CacheHelper().removeData(key: SharedPrefKeys.favsKey);
    _favorites.clear();
    notifyListeners();
  }
}
