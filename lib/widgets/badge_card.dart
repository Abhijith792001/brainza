import 'package:brainza/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BadgeCard extends StatelessWidget {
  const BadgeCard({
    super.key,
    required this.title
  });
final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: AppTheme.secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(8.sp)),
      ),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}
