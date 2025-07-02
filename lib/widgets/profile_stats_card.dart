import 'package:brainza/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileStatsCard extends StatelessWidget {
  const ProfileStatsCard({
    super.key,
    required this.count,
    required this.title,
    required this.iconColor,
    required this.iconData,
  });
  final String count;
  final String title;
  final Color iconColor;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: 78.w,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white54),
        color: Colors.white10,
        borderRadius: BorderRadius.all(Radius.circular(8.sp)),
      ),
      child: Column(
        children: [
          Icon(iconData, color: iconColor,size: 24,),
          SizedBox(height: 4.h,),
          Text(
            count,
            style: TextStyle(fontSize: 16.sp,color: AppTheme.secondaryLightColor, fontWeight: FontWeight.w600),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: AppTheme.secondaryLightColor,
            ),
          ),
        ],
      ),
    );
  }
}
