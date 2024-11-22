import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/extensions.dart';
import 'package:movie_app/core/utils/app_icons.dart';

class CachedImage extends StatelessWidget {
  const CachedImage(
      {super.key, required this.imageUrl, this.height, this.width, this.fit});
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width ?? context.width * 0.2,
      height: height ?? context.width * 0.3,
      imageUrl: imageUrl,
      fit: fit ?? BoxFit.cover,
      placeholder: (context, url) => SizedBox(
        width: width ?? context.width * 0.2,
        height: height ?? context.width * 0.3,
      ),
      errorWidget: (context, url, error) => const Icon(AppIcons.error),
    );
  }
}
