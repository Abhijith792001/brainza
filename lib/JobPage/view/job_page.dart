
import 'package:brainza/JobPage/controller/job_controller.dart';
import 'package:brainza/JobPage/model/job_model.dart';
import 'package:brainza/routes/app_routes.dart';
import 'package:brainza/theme/app_theme.dart';
import 'package:brainza/widgets/filter_badge_card.dart';
import 'package:brainza/widgets/job_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class JobPage extends StatelessWidget {
  JobPage({super.key});
  final controller = Get.put(JobController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Jobs List',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // Icon(LucideIcons.ellipsisVertical)
                  PopupMenuButton<String>(
                    color: AppTheme.secondaryColor,
                    icon: Icon(LucideIcons.ellipsisVertical),
                    itemBuilder:
                        (context) => [
                          PopupMenuItem(child: Text('Refresh',style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: 14.sp,
                             fontWeight: FontWeight.w600
                          ),)),
                          
                          PopupMenuItem(child: Text('Setting',style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: 14.sp,
                             fontWeight: FontWeight.w600
                          ),)),
                          
                          PopupMenuItem(child: Text('Eligible Jobs',style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: 14.sp,
                             fontWeight: FontWeight.w600
                          ),)),
                          PopupMenuItem(child: Text('Query',style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600
                          ),)),
                          
                          
                          ],
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
                top: 20.h,
                bottom: 10.h,
              ),
              height: 28.h, // Give a fixed height based on your card height
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: tabName.length,
                separatorBuilder: (context, index) => SizedBox(width: 10.h),
                itemBuilder: (BuildContext context, int index) {
                  final title = tabName[index];
                  return Obx(
                    () => InkWell(
                      onTap: () => {controller.tabChange(index)},
                      child: FilterBadgeCard(
                        title: title,
                        bgColor:
                            controller.isSelected.value == index
                                ? AppTheme.primaryColor
                                : AppTheme.whiteColor,
                        fontColor:
                            controller.isSelected.value == index
                                ? AppTheme.whiteColor
                                : AppTheme.primaryColor,
                      ),
                    ),
                  );
                },
              ),
            ),
            Obx(()=>
               Expanded(
                child: ListView.builder(
                
                  shrinkWrap: true,
                  itemCount: controller.jobList.length,
                  itemBuilder: (BuildContext context, int index) {
                    JobModel jobs = controller.jobList[index];
                    return InkWell(
                      onTap: ()=>{
                       Get.toNamed(AppRoutes.jobDetailsPage, arguments: jobs)
                      },
                      child: JobCard(
                        jobTitle: jobs.title,
                        category: jobs.type,
                        date: jobs.lastDate,
                        salary: jobs.salary,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

