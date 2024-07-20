// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:quantzi/UI/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ApiConnect.dart';

class LoginScreenController extends GetxController {

 final ApiConnect _connect = Get.put(ApiConnect());

  var token = 'dad7a92b797d37f8858b5c2127aa4bffe9a91820';
 TextEditingController userNameController =
      TextEditingController(text: 'admin');
  TextEditingController passwordController =
      TextEditingController(text: '12345');
 var isDarkMode = true.obs;

  @override
  void onInit() {
    super.onInit();
    _loadThemeMode();
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    _saveThemeMode(isDarkMode.value);
  }

  Future<void> _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    isDarkMode.value = prefs.getBool('isDarkMode') ?? false;
  }

  Future<void> _saveThemeMode(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDarkMode);
  }

    login(BuildContext context) {
    if (userNameController.text.isEmpty || passwordController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Username or password cannot be empty",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
      );
      return;
    }

    if (userNameController.text == "admin" &&
        passwordController.text == "12345") {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      Fluttertoast.showToast(
        msg: "Please check your credentials",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
      );
    }
  }

 
}
