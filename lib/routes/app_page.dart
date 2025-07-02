import 'package:brainza/Authentication/view/login_page.dart';
import 'package:brainza/GamingPage/view/gaming_page.dart';
import 'package:brainza/HomePage/binding/home_binding.dart';
import 'package:brainza/JobPage/binding/job_binding.dart';
import 'package:brainza/JobPage/view/job_page.dart';
import 'package:brainza/Navigation/navgation.dart';
import 'package:brainza/ProfilePage/view/profile_page.dart';
import 'package:brainza/SplashPage/binding/splash_binding.dart';
import 'package:brainza/SplashPage/view/splash_screen.dart';
import 'package:brainza/routes/app_routes.dart';
import 'package:get/get.dart';

import '../HomePage/view/home_page.dart';

class AppPage {
  static List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splashPage,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(name: AppRoutes.loginPage, page: () => LoginPage()),
    GetPage(
      name: AppRoutes.homePage,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(name: AppRoutes.gamePage, page: () => GamingPage()),
    GetPage(
      name: AppRoutes.jobPage,
      page: () => JobPage(),
      binding: JobBinding(),
    ),
    GetPage(name: AppRoutes.profilePage, page: () => ProfilePage()),
    GetPage(name: AppRoutes.navigationPage, page: () => BottomNavigation()),
  ];
}
