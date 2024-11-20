import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/spacing.dart';
import 'package:movie_app/core/theme/app_text_styles.dart';
import 'package:movie_app/core/utils/app_icons.dart';

class CustomErrorWidget extends StatefulWidget {
  const CustomErrorWidget(
      {super.key, required this.errorText, required this.retryFuction});
  final String errorText;
  final VoidCallback retryFuction;

  @override
  State<CustomErrorWidget> createState() => _CustomErrorWidgetState();
}

class _CustomErrorWidgetState extends State<CustomErrorWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            AppIcons.error,
            size: 50,
            color: Colors.red,
          ),
          verticalSpacing(20),
          Text(
            "Error: ${widget.errorText}",
            style: AppTextStyles.font16Red,
            textAlign: TextAlign.center,
          ),
          verticalSpacing(10),
          ElevatedButton(
            onPressed: widget.retryFuction,
            child: const Text(
              'Retry',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
