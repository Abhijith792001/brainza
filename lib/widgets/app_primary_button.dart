import 'package:brainza/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({super.key, required this.btnName});
  final btnName;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(12),
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 8.h),
      decoration: BoxDecoration(
        boxShadow: AppTheme.primaryShadow,
        gradient: AppTheme.primaryGradient,
        borderRadius: BorderRadius.all(Radius.circular(32.sp)),
      ),
      child: Text(
        btnName,
        style: TextStyle(fontSize: 16.sp, color: AppTheme.whiteColor),
      ),
    );
  }
}
