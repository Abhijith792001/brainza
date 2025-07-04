import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isShow = true.obs;

  RxBool obscureText = false.obs;


  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();


  showPassword() {
    if (isShow.value) {
      isShow.value = false;
    } else {
      isShow.value = true;
    }
  }
}
