import 'package:flutter/material.dart';
import 'package:lechalo/screens/loginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../api/db.dart';
import '../models/android_vertion_model.dart';

import 'dart:io' show Platform;


class LeChalo extends StatefulWidget {
  @override
  _LeChaloState createState() => _LeChaloState();
}

class _LeChaloState extends State<LeChalo> {
  int totalPage = 4;
  final PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: (currentPage==4) ? FloatingActionButton(onPressed: (){},child:Icon(Icons.play_arrow,color: Color(0xff040303),), ):Container(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/slider background.png"))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: PageView(
                controller: pageController,
                onPageChanged: (page) {
                  currentPage = page;
                },
                children: [
                  Padding(
                    padding:
                    EdgeInsets.only(top: 61.h, right: 36.w, left: 36.w),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/monitoring.png",
                          width: 215.w,
                          height: 213.h,
                        ),
                        SizedBox(
                          height: 223.h,
                        ),
                        Flexible(
                            fit: FlexFit.loose,
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Registration",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28.sp,
                                        fontFamily: "Franklin_Gothic",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 41.h,
                                    ),
                                    Text(
                                      "Perfect app for book a vehicle and transport goods",
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.white,
                                        fontFamily: "Franklin_Gothic",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 45.h,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 15.h,
                                          width: 31.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20.r),
                                              color: Color(0xffF9CC71)),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Container(
                                          height: 15.h,
                                          width: 31.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20.r),
                                              color: Color(0xffFFFFFF)),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Container(
                                          height: 15.h,
                                          width: 31.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20.r),
                                              color: Color(0xffFFFFFF)),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Container(
                                          height: 15.h,
                                          width: 31.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20.r),
                                              color: Color(0xffFFFFFF)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(top: 61.h, right: 36.w, left: 36.w),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/ecommerce.png",
                          width: 215.w,
                          height: 213.h,
                        ),
                        SizedBox(
                          height: 233.h,
                        ),
                        Flexible(
                            fit: FlexFit.loose,
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Select Vehicle",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28.sp,
                                        fontFamily: "Franklin_Gothic",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 41.h,
                                    ),
                                    Text(
                                      "Choose any vehicle according to your Need and go.",
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.white,
                                        fontFamily: "Franklin_Gothic",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 45.h,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 15.h,
                                          width: 31.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20.r),
                                              color: Color(0xffFFFFFF)),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Container(
                                          height: 15.h,
                                          width: 31.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20.r),
                                              color: Color(0xffF9CC71)),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Container(
                                          height: 15.h,
                                          width: 31.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20.r),
                                              color: Color(0xffFFFFFF)),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Container(
                                          height: 15.h,
                                          width: 31.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20.r),
                                              color: Color(0xffFFFFFF)),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(top: 61.h, right: 36.w, left: 36.w),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/road-trip.png",
                          width: 215.h,
                          height: 213.h,
                        ),
                        SizedBox(
                          height: 233.h,
                        ),
                        Flexible(
                            fit: FlexFit.loose,
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Hire Vehicle",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28.sp,
                                        fontFamily: "Franklin_Gothic",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 41.h,
                                    ),
                                    Text(
                                      "Hire a suitable vehicle for your easy and comfortable journey",
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.white,
                                        fontFamily: "Franklin_Gothic",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 45.h,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 15.h,
                                          width: 31.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20.r),
                                              color: Color(0xffFFFFFF)),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Container(
                                          height: 15.h,
                                          width: 31.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20.r),
                                              color: Color(0xffFFFFFF)),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Container(
                                          height: 15.h,
                                          width: 31.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20.r),
                                              color: Color(0xffF9CC71)),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Container(
                                          height: 15.h,
                                          width: 31.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20.r),
                                              color: Color(0xffFFFFFF)),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(top: 61.h, right: 36.w, left: 36.w),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/tourist.png",
                          width: 215.h,
                          height: 213.h,
                        ),
                        SizedBox(
                          height: 233.h,
                        ),
                        Flexible(
                            fit: FlexFit.loose,
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Enjoy Trip",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28.sp,
                                        fontFamily: "Franklin_Gothic",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 41.h,
                                    ),
                                    Text(
                                      "Are you ready for trip ? Lets go to Find some new places",
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.white,
                                        fontFamily: "Franklin_Gothic",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 45.h,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 15.h,
                                          width: 31.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20.r),
                                              color: Color(0xffFFFFFF)),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Container(
                                          height: 15.h,
                                          width: 31.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20.r),
                                              color: Color(0xffFFFFFF)),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Container(
                                          height: 15.h,
                                          width: 31.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20.r),
                                              color: Color(0xffFFFFFF)),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Container(
                                          height: 15.h,
                                          width: 31.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20.r),
                                              color: Color(0xffF9CC71)),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 94.h, left: 275.w),
                                      child: InkWell(
                                        onTap: () async{

                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginScreen()));

                                          String ePlatform ="";
                                          String vVersion = "";
                                          if (Platform.isAndroid) {
                                            // Android-specific code
                                             ePlatform ="Android";
                                             vVersion = "2.0";
                                          } else if (Platform.isIOS) {
                                            // iOS-specific code
                                             ePlatform ="ios";
                                             vVersion = "0";
                                          }
                                          android_vertion_model data = await android_vertion().getvertion(ePlatform,vVersion);

                                          if(data.status == null || data.eStatus == "failed"){
                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                              content: Text(data.MESSAGE??""),
                                              backgroundColor: Colors.green,
                                            ));
                                            print("Update Required");

                                          }else if(data.status == "success" || data.eStatus == null){
                                            print("Not Update");
                                          }

                                          //print();

                                        },
                                        child: Container(
                                          height: 70.h,
                                          width: 70.w,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Color(0xffF9CC71),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.play_arrow,
                                            color: Color(0xff040303),
                                            size: 60.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
