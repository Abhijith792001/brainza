import 'package:brainza/Authentication/controller/auth_controller.dart';
import 'package:brainza/ProfilePage/controller/profile_controller.dart';
import 'package:brainza/theme/app_theme.dart';
import 'package:brainza/widgets/profile_list_card.dart';
import 'package:brainza/widgets/profile_stats_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              // height: 200.h,
              decoration: BoxDecoration(
                gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32.sp),
                  bottomRight: Radius.circular(32.sp),
                ),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: AppTheme.whiteColor,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.find<AuthController>().logout();
                          },
                          child: Icon(
                            LucideIcons.logOut,
                            color: AppTheme.whiteColor,
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppTheme.whiteColor,
                              width: 3.w,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 50.sp,
                            backgroundImage: CachedNetworkImageProvider(
                              'https://abhijithjeejamon.netlify.app/assets/img/abhi.jpg',
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(child: Icon(LucideIcons.camera)),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 4.h,
                        horizontal: 14.w,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppTheme.secondaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(32.sp)),
                        boxShadow: AppTheme.primaryShadow,
                        color: AppTheme.primaryColor,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            LucideIcons.sparkle,
                            size: 15,
                            color: AppTheme.secondaryColor,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Premium',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.secondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      controller.userName.value,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.whiteColor,
                      ),
                    ),

                    Text(
                      'Quiz Master',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(232, 226, 250, 1),
                      ),
                    ),

                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProfileStatsCard(
                            count: '1',
                            title: 'Rank',
                            iconColor: Colors.redAccent,
                            iconData: LucideIcons.flame,
                          ),
                          ProfileStatsCard(
                            count: '250',
                            title: 'Quiz',
                            iconColor: Color(0xfffee3c5),
                            iconData: LucideIcons.brain,
                          ),
                          ProfileStatsCard(
                            count: '2200k',
                            title: 'b-Coin',
                            iconColor: const Color.fromARGB(255, 231, 231, 8),
                            iconData: LucideIcons.gift,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.h),
            ProfileListCard(
              title: 'Wallet',
              description: 'Check your coin balance and rewards',
              iconData: LucideIcons.wallet,
            ),
            ProfileListCard(
              title: 'Refer a Friend',
              description: 'Invite friends and earn coins',
              iconData: LucideIcons.share2,
            ),
            ProfileListCard(
              title: 'Rating',
              description: 'Rate and review the Brainza app',
              iconData: LucideIcons.star,
            ),
            ProfileListCard(
              title: 'About',
              description: 'Learn more about Brainza',
              iconData: LucideIcons.info,
            ),
          ],
        ),
      ),
    );
  }
}
