import 'package:brainza/theme/app_theme.dart';
import 'package:brainza/widgets/badge_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.sp),
      // width: 160.w,
      // height: 100.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.sp)),
        color: AppTheme.whiteColor,
        boxShadow: AppTheme.primaryShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: CachedNetworkImage(
              imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnSGOdy211urczq4D2-_HFK_W7l9w06UNNMw&s',
                  errorWidget: (context, url, error) => Image.asset('assets/images/error_img.png'),
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            'Current Affairs',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
          ),
          Text(
            '200 Module',
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
              color: AppTheme.grayColor,
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Free',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primaryColor,
                ),
              ),
              BadgeCard(title: 'Continue'),
            ],
          ),
        ],
      ),
    );
  }
}
