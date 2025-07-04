import 'package:brainza/Authentication/binding/auth_binding.dart';
import 'package:brainza/Authentication/view/register_page.dart';
import 'package:get/get.dart';
import 'package:brainza/routes/app_routes.dart';

// Pages
import 'package:brainza/SplashPage/view/splash_screen.dart';
import 'package:brainza/Authentication/view/login_page.dart';
import 'package:brainza/HomePage/view/home_page.dart';
import 'package:brainza/GamingPage/view/gaming_page.dart';
import 'package:brainza/JobPage/view/job_page.dart';
import 'package:brainza/JobPage/view/job_details_page.dart';
import 'package:brainza/MyCourse/view/my_course_page.dart';
import 'package:brainza/ProfilePage/view/profile_page.dart';
import 'package:brainza/Navigation/navigation_wrapper.dart';

// Bindings
import 'package:brainza/SplashPage/binding/splash_binding.dart';
import 'package:brainza/HomePage/binding/home_binding.dart';
import 'package:brainza/JobPage/binding/job_binding.dart';

class AppPage {
  static List<GetPage> pages = [
    // Splash
    GetPage(
      name: AppRoutes.splashPage,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),

    // Authentication
    GetPage(
      name: AppRoutes.loginPage,
      page: () => LoginPage(),
      binding: AuthBinding()
    ),
    GetPage(
      name: AppRoutes.registerPage,
      page: () => RegisterPage(),
      binding: AuthBinding()
    ),

    // Home
    GetPage(
      name: AppRoutes.homePage,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),

    // Main Features
    GetPage(
      name: AppRoutes.gamePage,
      page: () => GamingPage(),
    ),
    GetPage(
      name: AppRoutes.jobPage,
      page: () => JobPage(),
      binding: JobBinding(),
    ),
    GetPage(
      name: AppRoutes.jobPage,
      page: () => JobPage(),
      binding: JobBinding(),
    ),
    GetPage(
      name: AppRoutes.jobDetailsPage,
      page: () =>JobDetailsPage(),
      binding: JobBinding(),
    ),
    GetPage(
      name: AppRoutes.myCoursePage,
      page: () => MyCoursePage(),
    ),

    // Profile
    GetPage(
      name: AppRoutes.profilePage,
      page: () => ProfilePage(),
    ),

    // Navigation Wrapper
    GetPage(
      name: AppRoutes.navigationPage,
      page: () => NavigationWrapper(),
    ),
  ];
}
