import 'package:brainza/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterBadgeCard extends StatelessWidget {
  const FilterBadgeCard({
    super.key, required this.title, required this.bgColor, required this.fontColor,
  });

final String title;
final Color bgColor;
final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 14.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.sp)),
        boxShadow: AppTheme.primaryShadow,
        color: bgColor

      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
          color: fontColor,
        ),
      ),
    );
  }
}
