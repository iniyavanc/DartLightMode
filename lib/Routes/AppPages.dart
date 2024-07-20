import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:quantzi/Binding/LoginBinding.dart';
import 'package:quantzi/UI/LoginScreen.dart';
import 'AppRoutes.dart';

class AppPages {
  static final List<GetPage> list = [
    GetPage(
        name: AppRoutes.root.toName,
        page: () => const LoginScreen(),
        binding: LoginBinding()),
  ];
}
