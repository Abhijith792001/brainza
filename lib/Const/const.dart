import 'dart:io';

Future<bool> networkCheck() async {
  try {
    final result = await InternetAddress.lookup("www.google.com");
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
    return false;
  } catch (e) {
    return false;
  }
}
