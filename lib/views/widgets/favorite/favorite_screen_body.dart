import 'package:flutter/material.dart';
import 'package:movie_app/view_model/favorite_provider.dart';
import 'package:provider/provider.dart';

import '../movie_list_view.dart';

class FavoriteScreenBody extends StatelessWidget {
  const FavoriteScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const HandleFavoriteStatus();
  }
}

class HandleFavoriteStatus extends StatelessWidget {
  const HandleFavoriteStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(
      builder: (context, value, child) {
        return MovieListView(movies: value.favorites);
      },
    );
  }
}
