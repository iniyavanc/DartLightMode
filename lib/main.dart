// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'Component/MenuProvider.dart';
import 'Controller/LoginScreenController.dart';
import 'Routes/AppPages.dart';
import 'Routes/AppRoutes.dart';
import 'UI/LoginScreen.dart';

void main() {
  Get.put(LoginScreenController());
  runApp(
    ChangeNotifierProvider<MenuProvider>(
      create: (_) => MenuProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final LoginScreenController controller = Get.find();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DarkLight',
        home: const LoginScreen(),
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode:
            controller.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
        initialRoute: AppRoutes.root.toName,
        getPages: AppPages.list,
      );
    });
  }
}

class AppTheme {

  static final Color blueColor = Colors.transparent;
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue, brightness: Brightness.light),
    appBarTheme: AppBarTheme(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: blueColor,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.red, brightness: Brightness.dark),
    appBarTheme: AppBarTheme(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: Colors.blueGrey,
    ),
  );

}
