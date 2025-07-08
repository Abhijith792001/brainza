import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  RxString userName = ''.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getName();
  }
getName() async {
  String? name = await secureStorage.read(key: 'userName');
  userName.value = name ?? ''; // fallback to empty string if null
  print('${userName.value} -------------------------------------');
}

}
