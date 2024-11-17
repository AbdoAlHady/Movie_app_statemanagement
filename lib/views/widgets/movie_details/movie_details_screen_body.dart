import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helpers/extensions.dart';
import 'package:movie_app/core/helpers/spacing.dart';
import 'package:movie_app/core/utils/app_constants.dart';
import 'package:movie_app/core/widgets/cached_image.dart';
import 'package:movie_app/core/widgets/favorite_button.dart';
import 'package:movie_app/views/widgets/home/genres_list_item.dart';
import 'package:movie_app/views/widgets/movie_rating.dart';

import '../../../core/theme/app_text_styles.dart';

class MovieDetailsScreenBody extends StatelessWidget {
  const MovieDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          CachedImage(
            imageUrl: AppConstants.imageurl,
            width: double.infinity,
            height: context.height * 0.47,
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
                                "Movie Title",
                                style: AppTextStyles.font20Bold,
                              ),
                              verticalSpacing(10),
                              const Row(
                                children: [
                                  MovieRating(),
                                  Spacer(),
                                  Text(
                                    'Release Date',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              verticalSpacing(10),
                              const GenresListItem(),
                              verticalSpacing(10),
                              Text(
                                "Overview" * 200,
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
