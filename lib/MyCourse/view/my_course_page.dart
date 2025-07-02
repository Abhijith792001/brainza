import 'package:brainza/MyCourse/controller/my_course_controller.dart';
import 'package:brainza/MyCourse/model/my_course_model.dart';
import 'package:brainza/theme/app_theme.dart';
import 'package:brainza/widgets/course_card.dart';
import 'package:brainza/widgets/filter_badge_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class MyCoursePage extends StatelessWidget {
  MyCoursePage({super.key});
  
  final controller = Get.put(MyCourseController());

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Row
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subject',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  PopupMenuButton<String>(
                    color: AppTheme.secondaryColor,
                    icon: Icon(LucideIcons.ellipsisVertical),
                    itemBuilder: (context) => [
                      PopupMenuItem(child: Text('Refresh', style: _popupStyle())),
                      PopupMenuItem(child: Text('Setting', style: _popupStyle())),
                      PopupMenuItem(child: Text('Eligible Jobs', style: _popupStyle())),
                      PopupMenuItem(child: Text('Query', style: _popupStyle())),
                    ],
                  ),
                ],
              ),
            ),

            // Filter Tabs
            Container(
              margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 20.h, bottom: 10.h),
              height: 28.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: tabName.length,
                separatorBuilder: (context, index) => SizedBox(width: 10.h),
                itemBuilder: (BuildContext context, int index) {
                  final title = tabName[index];
                  return Obx(() => InkWell(
                        onTap: () => controller.tabChange(index),
                        child: FilterBadgeCard(
                          title: title,
                          bgColor: controller.isSelected.value == index
                              ? AppTheme.primaryColor
                              : AppTheme.whiteColor,
                          fontColor: controller.isSelected.value == index
                              ? AppTheme.whiteColor
                              : AppTheme.primaryColor,
                        ),
                      ));
                },
              ),
            ),

            Expanded(
              child: GridView.builder(
                itemCount: 8,
                padding: EdgeInsets.all(12),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.82,
                ),
                itemBuilder: (context, index) => CourseCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _popupStyle() {
    return TextStyle(
      color: AppTheme.primaryColor,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
    );
  }
}
