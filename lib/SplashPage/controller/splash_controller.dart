import 'dart:async';

import 'package:brainza/Authentication/controller/auth_controller.dart';
import 'package:brainza/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  RxBool isLogin = false.obs;

  @override
  void onInit() {
    super.onInit();
    navigateHomePage();
  }

  navigateHomePage() async {
    Timer((Duration(seconds: 2)), () {
      Get.find<AuthController>().checkLogin();
    });
  }
}
