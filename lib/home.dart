import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:ui';
import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tune/ram.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tune/result.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _home();
  }
}

class _home extends State<home> {
  int _currentPage = 0;
  late Timer _timer;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  var data;
  String output = "Initial output";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _pageController,
          children: [
            Container(
              color: Colors.deepPurple.shade100,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 340.0,left: 20,right: 20),
                child: Center(
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage("images/Tune-removebg-preview.png"))),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.deepPurple.shade100,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 340.0,right: 20,left: 20),
                child: Center(
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage("images/15930-removebg-preview.png"))),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.deepPurple.shade100,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 340.0,left: 20,right: 20),
                child: Center(
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage("images/Tune__1_-removebg-preview.png"))),
                  ),
                ),
              ),
            ),
          ],
        ),

        Container(
          alignment: const Alignment(0, 0.3),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
              ),
              SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                axisDirection: Axis.horizontal,
                effect: WormEffect(
                    activeDotColor: Colors.deepPurple.shade200,
                    dotColor: Colors.white70,
                    dotWidth: 10,
                    dotHeight: 10),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 24),
              Stack(
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                    child: Container(),
                  ),
                  Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2.5,
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.white.withOpacity(0.2)),
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white70,
                                Colors.white70,
                              ])),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height / 4,
                              child: Text(
                                "",
                                style: GoogleFonts.comicNeue(
                                    fontSize: 20,
                                    color: const Color(0xFF000000),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              final result =
                              await FilePicker.platform.pickFiles();
                              if (result == null) return;
                              final file = result.files.first;
                              print('Name: ${file.name}');
                              print('path: ${file.path}');

                              var request = http.MultipartRequest(
                                  "POST", Uri.parse('http://10.0.2.2:5000/'));
                              request.fields['src'] = "src";
                              request.files.add(await http.MultipartFile.fromPath('src', file.path!));
                              request.send().then((response) {
                                http.Response.fromStream(response).then((onValue) {
                                  try {
                                    // get your response here...
                                  } catch (e) {
                                    // handle exeption
                                  }
                                });
                              });

                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.bottomToTop,
                                      child: const Result()));


                              data = await fetchdata();
                              var decoded = jsonDecode(data);
                              setState(() {
                                output = decoded['bpm'];
                              });

                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height / 10,
                                    width: MediaQuery.of(context).size.width / 2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.deepPurple.shade100,
                                    ),

                                    ),
                                  ),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
