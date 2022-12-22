import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospitallist/pages/hospital_main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => HospitalMainPage())));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        body: CupertinoPageScaffold(
          child: Container(
            padding: const EdgeInsets.only(
                top: 330.0, left: 50.0, right: 20.0, bottom: 20.0),
            // Background
            child: Text(
              "Hospital List . . .",
              style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 80,
                  color: Colors.white
              ),
            ),
            color: Colors.black,
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
          ),
        ));

  }
}