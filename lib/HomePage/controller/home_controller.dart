import 'dart:convert';

import 'package:brainza/Authentication/controller/auth_controller.dart';
import 'package:brainza/Const/const.dart';
import 'package:brainza/HomePage/model/home_model.dart';
import 'package:brainza/HomePage/model/job_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<CategoryModel> categoriesList = <CategoryModel>[].obs;
   final FlutterSecureStorage secureStorage = const FlutterSecureStorage();


  RxList<JobModel> jobList = <JobModel>[].obs;

  var selectedIndex = 0.obs;
  RxBool isOnline = false.obs;

  void onInit() async{
    super.onInit();
    getCategories();
    latestJob();
    isOnline.value=await networkCheck();
    print("${isOnline.value}------------------------------------>");
    getName();

  }

  getCategories() async {
    categoriesList.value =
        await categories.map((e) => CategoryModel.fromJson(e)).toList();

    print(jsonEncode(categories));
  }

  latestJob() async {
    jobList.value = await jobListings.map((e) => JobModel.fromJson(e)).toList();
  }

  changeTabIndex(int index) {
    selectedIndex.value = index;
  }




 
  RxString userName = ''.obs;

getName() async {
  String? name = await secureStorage.read(key: 'userName');
  userName.value = name ?? ''; // fallback to empty string if null
  print('${userName.value} -------------------------------------');
} 
}
