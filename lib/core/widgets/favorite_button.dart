import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_icons.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        AppIcons.favoriteOutline,
        size: 20,
        // color: Colors.red,
      ),
      onPressed: () {},
    );
  }
}
