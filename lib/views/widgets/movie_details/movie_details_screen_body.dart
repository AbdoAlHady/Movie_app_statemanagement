import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helpers/extensions.dart';
import 'package:movie_app/core/helpers/spacing.dart';
import 'package:movie_app/core/widgets/cached_image.dart';
import 'package:movie_app/core/widgets/favorite_button.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/views/widgets/home/genres_list_item.dart';
import 'package:movie_app/views/widgets/movie_rating.dart';

import '../../../core/theme/app_text_styles.dart';

class MovieDetailsScreenBody extends StatelessWidget {
  const MovieDetailsScreenBody({super.key, required this.movie});
  final MoivesResult movie;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Hero(
            flightShuttleBuilder: (flightContext, animation, flightDirection,
                fromHeroContext, toHeroContext) {
              switch (flightDirection) {
                case HeroFlightDirection.push:
                  return ScaleTransition(
                      scale: animation.drive(
                        Tween<double>(begin: 0.0, end: 1.0).chain(
                          CurveTween(curve: Curves.fastOutSlowIn),
                        ),
                      ),
                      child: fromHeroContext.widget);
                case HeroFlightDirection.pop:
                  return toHeroContext.widget;
              }
            },
            tag: movie.id!,
            child: CachedImage(
              imageUrl: "https://image.tmdb.org/t/p/w500${movie.backdropPath}",
              width: double.infinity,
              height: context.height * 0.47,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: context.height * 0.4,
                ),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 25.h),
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movie.title ?? "",
                                style: AppTextStyles.font20Bold,
                              ),
                              verticalSpacing(10),
                              Row(
                                children: [
                                  MovieRating(
                                    voteAverage: movie.voteAverage ?? 0.0,
                                  ),
                                  const Spacer(),
                                  Text(
                                    movie.releaseDate ?? "",
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              verticalSpacing(10),
                              GenresListItem(
                                genresId: movie.genreIds!,
                              ),
                              verticalSpacing(10),
                              Text(
                                movie.overview ?? "",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(5),
                        child: const FavoriteButton(),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
              left: 10.w,
              top: 10.h,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                padding: EdgeInsets.only(left: 5.w),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )),
        ],
      ),
    );
  }
}
