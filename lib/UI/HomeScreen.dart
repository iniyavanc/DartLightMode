// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:quantzi/UI/LoginScreen.dart';
import '../Component/MenuProvider.dart';
import '../Controller/HomeScreenController.dart';
import 'DetailScreen.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    HomeScreenController controller = Get.put(HomeScreenController());
    controller.userDataProvider =
        Provider.of<MenuProvider>(context, listen: false);
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surfaceBright,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          toolbarHeight: 100,
          backgroundColor: Theme.of(context).colorScheme.surfaceBright,
          leading: GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Image.asset('assets/images/cinema.png'),
              )),
         
          actions: <Widget>[

            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  'Log out',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
          centerTitle: false,
        ),
        body: Obx(() => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Column(children: [
                Image.asset('assets/images/div.png'),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0.5,
                        mainAxisExtent: 200,
                        childAspectRatio: 1.25,
                      ),
                      itemCount: controller.moviesData.length,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.userDataProvider.setMoviesValues(
                                    controller.moviesData[index]);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailScreen()));
                              },
                              child: Container(
                                margin: EdgeInsets.all(5),
                                height:
                                    MediaQuery.of(context).size.height * 0.21,
                                width: MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .surfaceBright,
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: Image.network(
                                        'https://image.tmdb.org/t/p/w500/${controller.moviesData[index].backdropPath.toString() }',
                                        fit: BoxFit.fill,
                                        height: height * 0.12,
                                        width: width * 0.45,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    width: width * 0.32,
                                                    child: Text(
                                                      controller
                                                              .moviesData[index]
                                                              .originalTitle
                                                              .toString() ??
                                                          "",
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                width: width * 0.32,
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/Star.png',
                                                      height: 20,
                                                      width: 15,
                                                    ),
                                                    Image.asset(
                                                      'assets/images/Star.png',
                                                      height: 20,
                                                      width: 15,
                                                    ),
                                                    Image.asset(
                                                      'assets/images/Star.png',
                                                      height: 20,
                                                      width: 15,
                                                    ),
                                                    Image.asset(
                                                      'assets/images/Star.png',
                                                      height: 20,
                                                      width: 15,
                                                    ),
                                                    Image.asset(
                                                      'assets/images/Star.png',
                                                      height: 20,
                                                      width: 15,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    'assets/images/play.png',
                                                    height: 20,
                                                    width: 30,
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ])));
  }
}
