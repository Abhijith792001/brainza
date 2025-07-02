import 'package:brainza/GamingPage/view/gaming_page.dart';
import 'package:brainza/HomePage/view/home_page.dart';
import 'package:brainza/JobPage/view/job_page.dart';
import 'package:brainza/MyCourse/view/my_course_page.dart';
import 'package:brainza/Navigation/navigation_controller.dart';
import 'package:brainza/ProfilePage/view/profile_page.dart';
import 'package:brainza/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({super.key});

  final controller = Get.put(NavigationController());

  final pages =  [
    HomePage(),
    MyCoursePage(),
    JobPage(),
    GamingPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          
          backgroundColor: AppTheme.primaryColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeTab,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.house),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.bookOpen),
              label: "My Class",
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.briefcase),
              label: "Jobs",
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.gamepad2),
              label: "Game",
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.user),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
