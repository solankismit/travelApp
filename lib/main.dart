// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lechalo/screens/drawer.dart';
import 'package:lechalo/screens/loginScreen.dart';
import 'package:lechalo/screens/requestList.dart';
import 'package:lechalo/screens/signup/signupScreen.dart';
import 'package:lechalo/splashScreen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:workmanager/workmanager.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);


  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   systemNavigationBarColor: Colors.transparent, // navigation bar color
  //   statusBarColor: Colors.transparent, // status bar color
  // )
  runApp(ScreenUtilInit(

    designSize: Size(414, 896),
    builder: (context, child) => MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen()),
  ));
}




