import 'package:brainza/Const/const.dart';
import 'package:brainza/theme/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainImgCard extends StatelessWidget {
  const MainImgCard({
    super.key,
    this.img,
    required this.title,
    required this.subTitle,
  });
  final String? img;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.sp),
            child: CachedNetworkImage(
              imageUrl: img!,
              fit: BoxFit.cover,
              width: Get.width,
              height: null, // adjust if you want fixed height
              placeholder: (context, url) => Container(color: Colors.grey[300]),
              errorWidget:
                  (context, url, error) => Image.asset(
                    'assets/images/error_img.png',
                    fit: BoxFit.fitWidth,
                  ),
              color: Colors.black.withAlpha(120), // For dark overlay
              colorBlendMode: BlendMode.darken,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(16.sp),
          margin: EdgeInsets.symmetric(horizontal: 10.h),
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16.sp)),
            color:
                Colors
                    .transparent, // Transparent, since background is handled above
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                img == null ? '' : title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.secondaryLightColor,
                ),
              ),
              Text(
                subTitle,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.secondaryLightColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
