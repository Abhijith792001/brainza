import 'package:brainza/routes/app_routes.dart';
import 'package:brainza/theme/app_theme.dart';
import 'package:brainza/widgets/job_badge_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class JobDetailsPage extends StatelessWidget {
  const JobDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      appBar: AppBar(
        leading: InkWell(
          onTap: ()=>{
            Get.offAllNamed(AppRoutes.jobPage)
          },
          child: Icon(LucideIcons.chevronLeft, color: AppTheme.whiteColor)),
        title: Text(
          'Job Details',
          style: TextStyle(color: AppTheme.whiteColor),
        ),
        toolbarHeight: 70,
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: AppTheme.primaryGradient),
        ),
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Assistant Section Officer',
                    style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'SSC, UPSC, Indian Railways',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.grayColor,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  JobBadgeCard(
                    title: 'Central Gov',
                    iconData: LucideIcons.building2,
                  ),
                  SizedBox(height: 10.h),
                  JobBadgeCard(
                    title: 'View Job notification ',
                    iconData: Icons.picture_as_pdf,
                  ),
                  JobHeadingSubCard(),
                  SizedBox(height: 10.h),
                  JobBadgeCard(
                    title: 'Salary: ₹44,900 – ₹1,42,400',
                    iconData: LucideIcons.badgeIndianRupee,
                  ),
                  SizedBox(height: 10.h),
                  JobBadgeCard(
                    title: 'Free to Apply',
                    iconData: LucideIcons.badgeIndianRupee,
                  ),
                  JobHeadingSubCard(),
                  JobHeadingSubCard(),
                ],
              ),
            ),
          ),
        Positioned(
          bottom: 20.sp,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 70.w,vertical: 10.h),
            decoration: BoxDecoration(
              gradient: AppTheme.primaryGradient,
              borderRadius: BorderRadius.all(Radius.circular(36.sp)),
              boxShadow: AppTheme.primaryShadow
            ),
            child: Text('Apply Now',style: TextStyle(
              fontWeight: FontWeight.w500,
              color: AppTheme.whiteColor,
              fontSize: 20.sp
            ),),
          ),
        )
        ],
      ),
    );
  }
}

class JobHeadingSubCard extends StatelessWidget {
  const JobHeadingSubCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Text(
          'Description',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10.h),
        Text(
          "The Assistant Section Officer (ASO) plays a key administrative role in various central government departments. Responsibilities include handling file work, drafting notes, and coordinating inter-departmental communication. It's a highly sought-after Group B post. ",
          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
        ),
        
      ],
    );
  }
}
