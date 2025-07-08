import 'package:brainza/JobPage/model/job_model.dart';
import 'package:brainza/routes/app_routes.dart';
import 'package:brainza/theme/app_theme.dart';
import 'package:brainza/widgets/job_badge_card.dart';
import 'package:brainza/widgets/job_heading_sub_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class JobDetailsPage extends StatelessWidget {
  final JobModel jobs;
  const JobDetailsPage({super.key, required this.jobs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.snackbar(
            'Success',
            'Message sent!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.black87,
            colorText: Colors.white,
          );
        },
        icon: Icon(LucideIcons.send, color: AppTheme.whiteColor),
        label: Text(
          'Apply',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppTheme.whiteColor,
          ),
        ),
        backgroundColor: AppTheme.primaryColor,
      ),

      backgroundColor: AppTheme.whiteColor,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => {
            Get.back()
            },
          child: Icon(LucideIcons.chevronLeft, color: AppTheme.whiteColor),
        ),
        title: Text(
          'Job Details',
          style: TextStyle(color: AppTheme.whiteColor),
        ),
        toolbarHeight: 70,
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: AppTheme.primaryGradient),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                jobs.title,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                jobs.department,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.grayColor,
                ),
              ),
              SizedBox(height: 20.h),
              JobBadgeCard(title: jobs.type, iconData: LucideIcons.building2),
              SizedBox(height: 10.h),
              JobBadgeCard(
                title: 'View Job notification ',
                iconData: Icons.picture_as_pdf,
              ),
              JobHeadingSubCard(
                title: 'Description',
                description: jobs.description,
              ),
              SizedBox(height: 10.h),
              JobBadgeCard(
                title: 'Salary: ${jobs.salary}',
                iconData: LucideIcons.badgeIndianRupee,
              ),
              SizedBox(height: 10.h),
              JobBadgeCard(
                title: jobs.freeToApply ? 'Free to Apply' : 'Paid Application',
                iconData: LucideIcons.badgeIndianRupee,
              ),
              SizedBox(height: 20.h),
              JobHeadingSubCard(
                title: 'How to apply',
                description: jobs.eligibility,
              ),
              JobHeadingSubCard(
                title: 'Selection Process',
                description: jobs.selection,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
