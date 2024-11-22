import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/view_model/favorite_provider.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/custom_app_bar.dart';
import '../widgets/favorite/favorite_screen_body.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const FavoriteScreenBody(),
    );
  }

  CustomAppBar _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppStrings.favoriteMovies,
      showBackArrow: true,
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            context.read<FavoriteProvider>().clearFavorites();
          },
        ),
      ],
    );
  }
}
