import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_icons.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/view_model/favorite_provider.dart';
import 'package:provider/provider.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.movie});
  final MoivesResult movie;

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(
      builder: (context, value, child) {
        return IconButton(
          icon: AnimatedCrossFade(
              firstChild: const Icon(
                AppIcons.favoriteOutline,
                size: 20,
              ),
              firstCurve: Curves.bounceInOut,
              secondCurve: Curves.bounceInOut,
              secondChild: const Icon(
                AppIcons.favoriteRounded,
                size: 20,
                color: Colors.red,
              ),
              crossFadeState: value.isFavorite(movie)
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 500)),
          onPressed: () {
            value.addOrRemoveFavorite(movie);
          },
        );
      },
    );
  }
}
