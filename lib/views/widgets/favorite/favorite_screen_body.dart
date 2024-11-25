import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/view_model/favorite/fovarites_provider.dart';
import 'package:movie_app/views/widgets/favorite/favorites_list_view.dart';

class FavoriteScreenBody extends ConsumerWidget {
  const FavoriteScreenBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesState = ref.watch(favoritesProvider);
    return FavoritesListView(
      movies: favoritesState.movies,
    );
  }
}
