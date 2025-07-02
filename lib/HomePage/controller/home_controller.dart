import 'dart:convert';

import 'package:brainza/Const/const.dart';
import 'package:brainza/HomePage/model/home_model.dart';
import 'package:brainza/HomePage/model/job_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<CategoryModel> categoriesList = <CategoryModel>[].obs;

  RxList<JobModel> jobList = <JobModel>[].obs;

  var selectedIndex = 0.obs;
  RxBool isOnline = false.obs;

  void onInit() async{
    super.onInit();
    getCategories();
    latestJob();
    isOnline.value=await networkCheck();
    print("${isOnline.value}------------------------------------>");
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
  
}
