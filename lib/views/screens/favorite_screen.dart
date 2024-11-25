import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/view_model/favorite/fovarites_provider.dart';

import '../../core/widgets/custom_app_bar.dart';
import '../widgets/favorite/favorite_screen_body.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const FavoriteScreenBody(),
    );
  }

  CustomAppBar _buildAppBar() {
    return CustomAppBar(
      title: AppStrings.favoriteMovies,
      showBackArrow: true,
      centerTitle: true,
      actions: [
        Consumer(
          builder: (context, ref, child) {
            return IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                ref.read(favoritesProvider.notifier).deleteFavorites();
              },
            );
          },
        ),
      ],
    );
  }
}
