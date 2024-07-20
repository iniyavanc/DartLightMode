// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Component/Button.dart';
import '../Controller/LoginScreenController.dart';

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    LoginScreenController controller = Get.put(LoginScreenController());
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceBright,
      appBar: AppBar(
        toolbarHeight: 55,
        backgroundColor: Theme.of(context).colorScheme.surfaceBright,
        leading: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Image.asset(''
                  'assets/images/cinema.png'),
            )),
        title: Text(
          '',
          style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Obx(() {
              return Transform.scale(
                scale: 0.7,
                child: Switch(
                  value: controller.isDarkMode.value,
                  onChanged: (bool value) {
                    controller.toggleTheme();
                  },
                ),
              );
            }),
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 10,
          ),
          
          Container(
            width: width * 0.95,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.surfaceBright,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        'Sign in',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        'Sign in to your self service portal',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 14),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                      controller: controller.userNameController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF505050)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF505050)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'User Name',
                        hintText: '',
                        labelStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        hintStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                      controller: controller.passwordController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF505050)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF505050)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'User Password',
                        hintText: '',
                        labelStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        hintStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Button(
                      widthFactor: 0.88,
                      heightFactor: 0.055,
                      onPressed: () {
                        controller.login(context);
                      },
                      child: const Text("LOGIN",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600))),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
