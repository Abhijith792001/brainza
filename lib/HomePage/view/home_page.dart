import 'package:brainza/Authentication/controller/auth_controller.dart';
import 'package:brainza/HomePage/controller/home_controller.dart';
import 'package:brainza/JobPage/controller/job_controller.dart';
import 'package:brainza/theme/app_theme.dart';
import 'package:brainza/widgets/badge_card.dart';
import 'package:brainza/widgets/continues_course_card.dart';
import 'package:brainza/widgets/course_card.dart';
import 'package:brainza/widgets/main_img_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppTheme.primaryGradient),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                maintainBottomViewPadding: true,
                minimum: EdgeInsets.all(16.sp),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Wrap left side in Flexible to prevent overflow
                        Container(
                          margin: EdgeInsets.only(left: 10.sp),
                          child: Image.asset(
                            'assets/images/brainza_logo_white.png',
                            width: 100.w,
                          ),
                        ),
                        // Wrap BadgeCard in Flexible as well
                        Flexible(flex: 1, child: BadgeCard(title: '🔥 200')),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: '',
                          color: AppTheme.whiteColor,
                        ),
                      ),
                    ),
                    Obx(
                      () => Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '${controller.userName.value}👋',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontFamily: 'ArefRuqaaInk',
                            color: AppTheme.whiteColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    // Wrap the suggestion text in proper constraints
                    Container(
                      width: double.infinity,
                      child: Text.rich(
                        TextSpan(
                          text:
                              'Help us make Brainza better! Share\n your feature ideas — ',
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: AppTheme.whiteColor,
                          ),
                          children: [
                            TextSpan(
                              text: 'click here',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: AppTheme.whiteColor,
                              ),
                              recognizer:
                                  TapGestureRecognizer()
                                    ..onTap = () {
                                      // Handle your click here
                                      print('Clicked!');
                                      // You can navigate or open a dialog etc.
                                    },
                            ),
                            TextSpan(text: ' to suggest'),
                          ],
                        ),
                        textAlign: TextAlign.right,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10.sp),
                width: Get.width,
                // height: 500.h,
                decoration: BoxDecoration(
                  color: AppTheme.whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.sp),
                    topRight: Radius.circular(32.sp),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.w,
                        right: 16.w,
                        top: 16.h,
                        bottom: 10.h,
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Latest Jobs',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Obx(() {
                      // final jobController = Get.find<JobController>();
                      return CarouselSlider(
                        items:
                            controller.jobList
                                .map(
                                  (items) => MainImgCard(
                                    img: items.imgURL,
                                    title: items.title,
                                    subTitle: items.subtitle,
                                  ),
                                )
                                .toList(),
                        options: CarouselOptions(autoPlay: true, height: 150),
                      );
                    }),

                    ContinuesCourseCard(title: 'Army', percentage: '50%'),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.h,
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Courses',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 16.w,
                        right: 16.w,
                        bottom: 16.h,
                      ),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.all(0),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 20,
                          crossAxisCount: 2,
                          childAspectRatio: 0.82,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return CourseCard();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
