import 'package:get/get.dart';

class MyCourseController extends GetxController {

  RxInt isSelected = 0.obs;

  tabChange(int index){
    isSelected.value = index;
  }
} 