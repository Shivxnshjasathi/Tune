import 'dart:convert';
import 'dart:ui';
import 'package:tune/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tune/ram.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Result();
  }
}



class _Result extends State<Result> {


  @override
  var data;


  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.deepPurple.shade100),
        child: Stack(children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
            child: Container(),
          ),
          Center(
            child: Container(

              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 1.2,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white70,
                        Colors.white70,
                      ])

              ),

              child: Column(
                children: [
                  SizedBox(height:MediaQuery.of(context).size.height / 60,),
                  Container(
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 1.35,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade100,
                        borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(image: AssetImage("images/bpm__5_-removebg-preview.png"))
                      ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [

                          Text(
                            "BPM-",
                            style: GoogleFonts.comicNeue(
                                fontSize: 20,
                                color: const Color(0xFF000000),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            data,
                            style: GoogleFonts.comicNeue(
                                fontSize: 60,
                                color: const Color(0xFF000000),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height:MediaQuery.of(context).size.height / 60,),
                  Row(

                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 17.0),
                        child: Container(height: MediaQuery.of(context).size.height / 13,
                          width: MediaQuery.of(context).size.width / 4,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple.shade100,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Center(child: Icon(Icons.replay,color: Colors.black,size: 30)),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width / 50,),
                      Container(height: MediaQuery.of(context).size.height / 13,
                        width: MediaQuery.of(context).size.width / 6,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(child: Icon(Icons.headphones_rounded,color: Colors.black,size: 30)),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width / 50,),
                      Container(height: MediaQuery.of(context).size.height / 13,
                        width: MediaQuery.of(context).size.width / 6,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(child: Icon(Icons.bookmark,color: Colors.black,size: 30)),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width / 50,),

                    ],
                  )

                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
