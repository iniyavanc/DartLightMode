import 'package:get/get.dart';
import 'package:quantzi/Controller/LoginScreenController.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginScreenController>(() => LoginScreenController());
  }
}
