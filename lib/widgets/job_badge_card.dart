import 'package:brainza/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobBadgeCard extends StatelessWidget {
  const JobBadgeCard({super.key, required this.title, required this.iconData});

  final String title;
  final IconData iconData;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(8.sp)),
        boxShadow: AppTheme.primaryShadow,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData, size: 18),
          SizedBox(width: 8.w),
          Text(title),
        ],
      ),
    );
  }
}
