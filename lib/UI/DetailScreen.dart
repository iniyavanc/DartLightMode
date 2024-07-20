// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:quantzi/UI/HomeScreen.dart';
import '../Component/MenuProvider.dart';
import '../Controller/DetailScreenController.dart';
import 'package:video_player/video_player.dart';

class DetailScreen extends GetView<DetailScreenController> {
  const DetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    DetailScreenController controller = Get.put(DetailScreenController());
    controller.userDataProvider =
        Provider.of<MenuProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceBright,
      appBar: AppBar(
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
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                'Back',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
          )
        ],
        centerTitle: false,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceBright,
              borderRadius: BorderRadius.circular(5.5),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: width * 0.8,
                        child: Text(
                          controller.userDataProvider.getMovieValues!.title
                                  .toString() ??
                              "",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: width * 0.8,
                        child: Row(
                          children: [
                            Text(
                              controller.userDataProvider.getMovieValues!
                                      .popularity
                                      .toString() ??
                                  "",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: width * 0.8,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                controller.userDataProvider.getMovieValues!
                                        .overview
                                        .toString() ??
                                    "",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: width * 0.8,
                        child: Row(
                          children: [
                            Text(
                              'Release Date : ${controller.userDataProvider.getMovieValues!.releaseDate.toString() ?? ""}',
                              style: TextStyle(
                                  fontSize: 14,
                                  // color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: width * 0.8,
                        child: Row(
                          children: [
                            Text(
                              'Original Language : ${controller.userDataProvider.getMovieValues!.originalLanguage.toString() ?? ""}',
                              style: TextStyle(
                                  fontSize: 14,
                                  // color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            // color: Colors.grey,
                            borderRadius: BorderRadius.circular(2)),
                        height: height * 0.3,
                        width: width * 0.4,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                              child: Image.asset(
                                'assets/images/tammy.png',
                                fit: BoxFit.fill,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => VideoDialog(),
                                  );
                                },
                                child: Image.asset(
                                  'assets/images/play.png',
                                  height: 50,
                                  width: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VideoDialog extends StatefulWidget {
  @override
  _VideoDialogState createState() => _VideoDialogState();
}

class _VideoDialogState extends State<VideoDialog> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/images/sample.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Container(
            width: 400,
            height: 300,
            padding: EdgeInsets.all(10),
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
