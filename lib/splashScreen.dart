import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lechalo/googleplace/geo_locetor.dart';
import 'package:lechalo/homePage.dart';
import 'package:lechalo/screens/slideScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'api/db.dart';
import 'models/android_vertion_model.dart';

class SplashScreen extends StatefulWidget {


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {





  GeolocatorService geolocatorService = GeolocatorService();
  late Position currentPosition;

  Future<bool> savedNamePreference(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("id", id);
    return prefs.setString("id", id);

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigate();
  }
  Future<void> _navigate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('id');
if(id == null){

  Future.delayed(Duration(milliseconds: 3000),(){});
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LeChalo()));
}
else{
  currentPosition =
    await geolocatorService.getInitialLocation();
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage(currentPosition.latitude,currentPosition.longitude)));
}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 150.h,
          width: 150.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/splash.jpg")
            )
          ),
        ),
      ),
    );
  }
}

