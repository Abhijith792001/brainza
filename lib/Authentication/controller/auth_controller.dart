
import 'package:brainza/routes/app_routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  RxString userName = ''.obs;

  RxBool isShow = true.obs;
  RxBool isLoading = false.obs;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void showPassword() {
    isShow.value = !isShow.value;
  }

 Future<void> loginUser() async {
  try {
    isLoading.value = true;

    // Firebase login
    await _auth.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    Get.snackbar('Success', 'Login Successful');

    final user = _auth.currentUser;
    if (user != null) {
      final uid = user.uid;

      // Get user name from Firestore
      final DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();

      final name = userDoc['name'];

      // Save to secure storage
      await secureStorage.write(key: 'uid', value: uid);
      await secureStorage.write(key: 'email', value: user.email);
      await secureStorage.write(key: 'userName', value: name);

      userName.value = name; // Optional: set locally as well
    }

    Get.toNamed(AppRoutes.navigationPage);
  } on FirebaseAuthException catch (e) {
    Get.snackbar(
      'Login Failed',
      e.message ?? 'Something went wrong',
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  } finally {
    isLoading.value = false;
  }
}

  //Register

  Future<void> createUser() async {
    if (passwordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      Get.snackbar('Password', 'Does not match password');
      return;
    }
    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

      final uid = userCredential.user!.uid;

      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'uid': uid,
      });

      Get.snackbar('Success', 'Register Successfully');
      Get.toNamed(AppRoutes.loginPage);
    } catch (e) {
      Get.snackbar('Error', '${e.toString()} Try again');
    }
  }

  Future<void> checkLogin() async {
    final firebaseUser = _auth.currentUser;
    final uid = await secureStorage.read(key: 'uid');
    final email = await secureStorage.read(key: 'email');

    if (firebaseUser != null && uid != null && email != null) {
      Get.toNamed(AppRoutes.navigationPage);
    } else {
      Get.toNamed(AppRoutes.loginPage);
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    await secureStorage.deleteAll();
    Get.toNamed(AppRoutes.loginPage);
  }

  getUserName() async {
    try {
      final uid = _auth.currentUser?.uid;
      if (uid == null) return null;
      final DocumentSnapshot useDoc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      print('${useDoc['name']}.usernankhfkjhfkhfkhfkhfkhfkfhf');
      userName.value = useDoc['name'];
    } catch (e) {
      print("Error $e");
    }
  }
}
