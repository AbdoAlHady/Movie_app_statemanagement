import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/spacing.dart';
import 'package:movie_app/core/utils/app_icons.dart';

class MovieRating extends StatelessWidget {
  const MovieRating({
    super.key,
    required this.voteAverage,
  });
  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          AppIcons.star,
          color: Colors.yellow,
        ),
        horizontalSpacing(5),
        Text(
          voteAverage.toString(),
        ),
      ],
    );
  }
}
