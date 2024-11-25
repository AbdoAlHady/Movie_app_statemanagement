import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/utils/app_icons.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/view_model/favorite/fovarites_provider.dart';

class FavoriteButton extends ConsumerWidget {
  const FavoriteButton(this.movie, {super.key});
  final MoivesResult movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(favoritesProvider.select((value) => value.movies));
    final isFavorite = ref.read(favoritesProvider.notifier).isFavorite(movie);
    return IconButton(
      icon: Icon(
        isFavorite ? AppIcons.favoriteRounded : AppIcons.favoriteOutline,
        size: 20,
        color: isFavorite ? Colors.red : Colors.grey,
        // color: Colors.red,
      ),
      onPressed: () {
        ref.read(favoritesProvider.notifier).addOrRemoveFavorite(movie);
      },
    );
  }
}
