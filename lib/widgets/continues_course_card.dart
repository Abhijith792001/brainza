import 'package:brainza/theme/app_theme.dart';
import 'package:brainza/widgets/badge_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ContinuesCourseCard extends StatelessWidget {
  const ContinuesCourseCard({
    super.key,
    required this.title,
    required this.percentage,
  });
  final title;
  final percentage;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.sp)),
        color: AppTheme.whiteColor,
        boxShadow: AppTheme.primaryShadow,
        border: Border(
          left: BorderSide(width: 4, color: AppTheme.primaryColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25.sp,
                child: Icon(LucideIcons.book, color: AppTheme.primaryColor),
              ),
              SizedBox(width: 10.w),
              // Wrap Column in Expanded to prevent overflow
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 13.87.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${percentage} Completed',
                    style: TextStyle(fontSize: 11.sp,fontWeight: FontWeight.w600,color: AppTheme.grayColor),
                  ),
                ],
              ),
            ],
          ),
          BadgeCard(title: 'Continues'),
        ],
      ),
    );
  }
}
