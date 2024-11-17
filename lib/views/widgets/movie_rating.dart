import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/spacing.dart';
import 'package:movie_app/core/utils/app_icons.dart';

class MovieRating extends StatelessWidget {
  const MovieRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          AppIcons.star,
          color: Colors.yellow,
        ),
        horizontalSpacing(5),
        const Text(
          '9.0',
        ),
      ],
    );
  }
}
