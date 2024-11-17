import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenresItem extends StatelessWidget {
  const GenresItem({
    super.key,
    required this.label,
  });
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
        child: Text(label,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 14.sp,
            )),
      ),
    );
  }
}
