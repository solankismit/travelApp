import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lechalo/screens/aboutLechalo.dart';
import 'package:lechalo/screens/availableFunds.dart';
import 'package:lechalo/screens/bankAccount.dart';
import 'package:lechalo/screens/changePassword.dart';
import 'package:lechalo/screens/conditions.dart';
import 'package:lechalo/screens/loginScreen.dart';
import 'package:lechalo/screens/myAcceptedTrips.dart';
import 'package:lechalo/screens/myBooking.dart';
import 'package:lechalo/screens/myParcelRequest.dart';
import 'package:lechalo/screens/myRequestRide.dart';
import 'package:lechalo/screens/myScheduledTrips.dart';
import 'package:lechalo/screens/pastTransaction.dart';
import 'package:lechalo/screens/postalAddress.dart';
import 'package:lechalo/screens/myOffers.dart';
import 'package:lechalo/screens/privacyPolicies.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:share/share.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Paccount extends StatefulWidget {
  @override
  _PaccountState createState() => _PaccountState();
}

class _PaccountState extends State<Paccount> {
  Future<void> share() async {
    await FlutterShare.share(
        title: 'LeChalo',
        text: 'Click on below link to download LeChalo Android App ',
        linkUrl: ' http://play.google.com/store/apps/details?id=com.leChalo',
        chooserTitle: 'Share App via'
    );
  }
  _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaY: 40, sigmaX: 40),
            child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Container(
                  height: 250.h,
                  width: 300.w,
                  child: Padding(
                    padding:  EdgeInsets.only(top: 30.0.h),
                    child: Column(
                      children: [
                        Text(
                          "Are you sure you want to logout?",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Franklin_Gothic",
                              fontWeight: FontWeight.bold,
                              fontSize: 17.sp),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 45.h,
                            width: 120.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.r),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff060E57),
                                      Color(0xff010311)
                                    ])),
                            child: Text(
                              "No",
                              style: TextStyle(
                                  fontFamily: "Franklin_Gothic",
                                  color: Color(0xffFFFFFF),
                                  fontSize: 20.sp),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 45.h,
                            width: 120.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.r),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff060E57),
                                      Color(0xff010311)
                                    ])),
                            child: Text(
                              "Yes",
                              style: TextStyle(
                                  fontFamily: "Franklin_Gothic",
                                  color: Color(0xffFFFFFF),
                                  fontSize: 20.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:[ Container(
          height: 800.h,
          width: 400.w,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child:  Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Stats",

                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Franklin_Gothic",
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            fontSize: 17.sp),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MyOffers()));
                        },
                        child: Text(
                          "My Offers",
                          style: TextStyle(
                              color: Color(0xff020272),
                              fontFamily: "Franklin_Gothic",

                              fontSize: 17.sp),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MyBooking()));
                        },
                        child: Text(
                          "My Bookings",
                          style: TextStyle(
                              color: Color(0xff020272),
                              fontFamily: "Franklin_Gothic",

                              fontSize: 17.sp),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MyRequestRide()));
                        },
                        child: Text(
                          "My Request Rides",
                          style: TextStyle(
                              color: Color(0xff020272),
                              fontFamily: "Franklin_Gothic",

                              fontSize: 17.sp),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MyScheduledTrips()));
                        },
                        child: Text(
                          "My Scheduled Trips",
                          style: TextStyle(
                              color: Color(0xff020272),
                              fontFamily: "Franklin_Gothic",

                              fontSize: 17.sp),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MyAcceptedTrips()));
                        },
                        child: Text(
                          "My Hire Vehicle Accepted Rides",
                          style: TextStyle(
                              color: Color(0xff020272),
                              fontFamily: "Franklin_Gothic",

                              fontSize: 17.sp),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MyParcelRequestList()));
                        },
                        child: Text(
                          "My Send Parcel Requests",
                          style: TextStyle(
                              color: Color(0xff020272),
                              fontFamily: "Franklin_Gothic",

                              fontSize: 17.sp),
                        ),
                      ),
                      Text(
                        "About",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Franklin_Gothic",
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            fontSize: 17.sp),
                      ),
                      TextButton(
                        onPressed: share,

                          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewPastTransaction()));

                        child: Text(
                          "Share App",
                          style: TextStyle(
                              color: Color(0xff020272),
                              fontFamily: "Franklin_Gothic",
                              fontSize: 17.sp),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AboutLechalo()));
                        },
                        child: Text(
                          "About LeChalo",
                          style: TextStyle(
                              color: Color(0xff020272),
                              fontFamily: "Franklin_Gothic",
                              fontSize: 17.sp),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TermsAndConditions()));
                        },
                        child: Text(
                          "Terms and Conditions",
                          style: TextStyle(
                              color: Color(0xff020272),
                              fontFamily: "Franklin_Gothic",
                              fontSize: 17.sp),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PrivacyPolicies()));
                        },
                        child: Text(
                          "Privacy Policy",
                          style: TextStyle(
                              color: Color(0xff020272),
                              fontFamily: "Franklin_Gothic",
                              fontSize: 17.sp),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _showDialog();
                        },
                        child: Text(
                          "Logout",
                          style: TextStyle(
                              color: Color(0xff020272),
                              fontFamily: "Franklin_Gothic",
                              fontSize: 17.sp),
                        ),
                      ),
                    ],
                  ),),

                  SizedBox(
                    width: 20.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Preferences",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Franklin_Gothic",
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            fontSize: 17.sp),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ChangePassword()));
                        },
                        child: Text(
                          "Change Password",
                          style: TextStyle(
                              color: Color(0xff020272),
                              fontFamily: "Franklin_Gothic",
                              fontSize: 17.sp),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PostalAddress()));
                        },
                        child: Text(
                          "Postal Address",
                          style: TextStyle(
                              color: Color(0xff020272),
                              fontFamily: "Franklin_Gothic",
                              fontSize: 17.sp),
                        ),
                      ),
                      Text(
                        "Money",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Franklin_Gothic",
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            fontSize: 17.sp),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AvailableFunds()));
                        },
                        child: Text(
                          "Available Funds",
                          style: TextStyle(
                              color: Color(0xff020272),
                              fontFamily: "Franklin_Gothic",
                              fontSize: 17.sp),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BankAccount()));
                        },
                        child: Text(
                          "Bank Details",
                          style: TextStyle(
                              color: Color(0xff020272),
                              fontFamily: "Franklin_Gothic",
                              fontSize: 17.sp),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NewPastTransaction()));
                        },
                        child: Text(
                          "New/Past Transactions",
                          style: TextStyle(
                              color: Color(0xff020272),
                              fontFamily: "Franklin_Gothic",
                              fontSize: 17.sp),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
    ]
      ),
    );
  }
}
