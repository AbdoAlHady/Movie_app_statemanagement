import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/extensions.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/core/theme/app_text_styles.dart';
import 'package:movie_app/core/utils/app_icons.dart';
import 'package:movie_app/core/widgets/favorite_button.dart';
import 'package:movie_app/views/widgets/home/genres_list_item.dart';
import 'package:movie_app/views/widgets/movie_rating.dart';

import '../../core/helpers/spacing.dart';
import '../../core/utils/app_constants.dart';
import '../../core/widgets/cached_image.dart';

class MovieListViewItem extends StatelessWidget {
  const MovieListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: () {
            context.pushNamed(Routes.movieDetails);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: const CachedImage(
                    imageUrl: AppConstants.imageurl,
                  ),
                ),
                horizontalSpacing(10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Killer',
                        style: AppTextStyles.font20Bold,
                      ),
                      verticalSpacing(10),
                      const MovieRating(),
                      const GenresListItem(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            AppIcons.watchLater,
                            size: 20,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          horizontalSpacing(5),
                          const Text(
                            'Release Date',
                            style: TextStyle(color: Colors.grey),
                          ),
                          const Spacer(),
                          const FavoriteButton()
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
