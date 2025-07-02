import 'package:get/get.dart';

class JobController extends GetxController {
  RxInt isSelected = 0.obs;

  tabChange(int index) {
    isSelected.value = index;
    print('----------------------');
  }
}
