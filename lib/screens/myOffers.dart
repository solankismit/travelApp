import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/bookingRequest.dart';
import 'package:lechalo/models/canceloffermodel.dart';
import 'package:lechalo/models/myoffer.dart';
import 'package:lechalo/screens/bookingAccept.dart';
import 'package:lechalo/screens/loginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOffers extends StatefulWidget {
  @override
  _MyOffersState createState() => _MyOffersState();
}

class _MyOffersState extends State<MyOffers> {
  String? regid;
  var cancelrequest;

  late Future<Myoffer?> data;
  String? id;


  Future<bool> savedbookingofferPreference(
    String bookingofferid,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("bookingofferid", bookingofferid);
    return prefs.setString("bookingofferid", bookingofferid);
  }

  Future<String?> getNamePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("id");
    return id;

  }

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    getNamePreference().then((id) {
      setState(() {
        regid = id;
        print(regid);
      });
    });


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
                          "Are you sure you want to Cancel The Ride?",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Franklin_Gothic",
                              fontWeight: FontWeight.bold,
                              fontSize: 17.sp),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        InkWell(
                          onTap: () {
                            _showDialog2();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 45.h,
                            width: 130.w,
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
                        SizedBox(
                          height: 20.h,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 45.h,
                            width: 130.w,
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
                      ],
                    ),
                  ),
                )),
          );
        });
  }

  _showDialog2() {
    showDialog(
        context: context,
        builder: (
          BuildContext context,
        ) {
          return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                height: 200.h,
                width: 300.w,
                child: Padding(
                  padding:  EdgeInsets.only(top: 30.0.h),
                  child: Column(
                    children: [
                      Text(
                        "Select a reason for rejecting ride",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Franklin_Gothic",
                            fontWeight: FontWeight.bold,
                            fontSize: 17.sp),
                      ),
                      Padding(
                        padding:
                             EdgeInsets.only(top: 30.sp, right: 15.sp, left: 15.sp),
                        child: DropdownButton(
                          isExpanded: true,
                          hint: Text("Select Reason"),
                          value: valueChoose,
                          onChanged: (newValue) async{
                            final Canceloffermodel user = await cancelOffer().canceloffer(cancelrequest);
                            setState(() {
                              valueChoose = newValue.toString();

                              Fluttertoast.showToast(
                                msg: user.msg,
                                backgroundColor: Color(0xff060E57),
                                textColor: Colors.white,
                              );
                            });
                           
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },

                          items: listitem.map((valueItem) {
                            return DropdownMenuItem(
                                value: valueItem, child: Text(valueItem));
                          }).toList(),
                        ),
                      ),

                      // SizedBox(
                      //   height: 5,
                      // ),
                    ],
                  ),
                ),
              ));
        });
  }

  List listitem = [
    "Plan Changed",
    "For Being Late",
    "Pickup or Drop Location not correct",
    "Refused For Travelling",
    "Having Access Luggage"
  ];
  var valueChoose;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff060E57),
        leading: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: Text(
          "My Offers",
          style: TextStyle(fontFamily: "Franklin_Gothic"),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff060E57), Color(0xff010311)])),
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.only(right: 7.w, left: 7.w),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40.r)),
          child: Padding(
              padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
              child: FutureBuilder<Myoffer>(
                  future: myOffer().myoffer(regid),
                  builder: (context, snapshot) {
                    return (snapshot.hasData)
                        ? ListView.builder(
                            itemCount: snapshot.data!.detail.length,
                            itemBuilder: (context, index) {
                              var server = snapshot.data!.detail[index];
                              return Padding(
                                padding:
                                     EdgeInsets.only(right: 15.w, left: 15.w),
                                child: Column(
                                  children: [
                                    Container(
                                      height:
                                          330.h,
                                      width: 400.w,
                                      decoration: (BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(24.r),
                                        border: Border.all(
                                            color: Colors.grey.shade400),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 3,
                                              offset: Offset(0, 1))
                                        ],
                                      )),
                                      child: Padding(
                                        padding:  EdgeInsets.only(
                                            right: 25.w, left: 25.w),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              top: 15.h,
                                              right: 5.w,
                                              left: 5.w,
                                              bottom: 38.h,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Total Fare",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff020744),
                                                            fontFamily:
                                                                "Franklin_Gothic",
                                                            fontSize: 18.sp),
                                                      ),
                                                      // SizedBox(
                                                      //   height: MediaQuery.of(context).size.height*0.03,
                                                      // ),
                                                      Text(
                                                        "Vehicle Type",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff020744),
                                                            fontFamily:
                                                                "Franklin_Gothic",
                                                            fontSize: 18.sp),
                                                      ),
                                                      Text(
                                                        "Total Distance",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff020744),
                                                            fontFamily:
                                                                "Franklin_Gothic",
                                                            fontSize: 18.sp),
                                                      ),

                                                      Text(
                                                        "From",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff020744),
                                                            fontFamily:
                                                                "Franklin_Gothic",
                                                            fontSize: 18.sp
                                                        ),
                                                      ),
                                                      Text(
                                                        "To",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff020744),
                                                            fontFamily:
                                                                "Franklin_Gothic",
                                                            fontSize: 18.sp),
                                                      ),
                                                      Text(
                                                        "Stopover",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff020744),
                                                            fontFamily:
                                                                "Franklin_Gothic",
                                                            fontSize: 18.sp),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          print(server.id);
                                                          savedbookingofferPreference(
                                                                  server.id)
                                                              .then((bool
                                                                  committed) {
                                                            setState(() {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              BookingRequest()));
                                                            });
                                                          });
                                                        },
                                                        child: Container(
                                                          width: 110.w,
                                                          decoration: BoxDecoration(
                                                              gradient: LinearGradient(
                                                                  begin: Alignment
                                                                      .topCenter,
                                                                  end: Alignment.bottomCenter,
                                                                  colors: [
                                                                Color(
                                                                    0xff060E57),
                                                                Color(
                                                                    0xff010311)
                                                              ])),
                                                          child: Padding(
                                                            padding:
                                                                 EdgeInsets
                                                                    .all(3.0.h),
                                                            child: Center(
                                                              child: Text(
                                                                "Booking Request",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontFamily:
                                                                        "Franklin_Gothic",
                                                                    fontSize:
                                                                        16.sp),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          savedbookingofferPreference(
                                                              server.id)
                                                              .then((bool
                                                          committed) {
                                                            setState(() {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              BookingAccept()));
                                                            });
                                                          });
                                                          // Navigator.of(context).push(
                                                          //     MaterialPageRoute(
                                                          //         builder:
                                                          //             (context) =>
                                                          //                 BookingAccept()));
                                                        },
                                                        child: Container(
                                                          width: 110.w,
                                                          decoration: BoxDecoration(
                                                              gradient: LinearGradient(
                                                                  begin: Alignment
                                                                      .topCenter,
                                                                  end: Alignment.bottomCenter,
                                                                  colors: [
                                                                Color(
                                                                    0xff060E57),
                                                                Color(
                                                                    0xff010311)
                                                              ])),
                                                          child: Padding(
                                                            padding:
                                                                 EdgeInsets
                                                                    .all(3.0.h),
                                                            child: Center(
                                                              child: Text(
                                                                "Booking Accept",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontFamily:
                                                                        "Franklin_Gothic",
                                                                    fontSize:
                                                                        16.sp),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),

                                                      Text(
                                                        "${server.goDate.day}/${server.goDate.month}/${server.goDate.year}",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff020744),
                                                            fontFamily:
                                                                "Franklin_Gothic",
                                                            fontSize: 18.sp),
                                                      ),
                                                      SizedBox(
                                                        height: 15.h,
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "${server.leaveDestFare}",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff020744),
                                                            fontFamily:
                                                                "Franklin_Gothic",
                                                            fontSize: 18.sp),
                                                      ),
                                                      Text(
                                                        "${server.offertype}",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff020744),
                                                            fontFamily:
                                                                "Franklin_Gothic",
                                                            fontSize: 18.sp),
                                                      ),
                                                      Text(
                                                        "${server.distance}",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff020744),
                                                            fontFamily:
                                                                "Franklin_Gothic",
                                                            fontSize: 18.sp),
                                                      ),
                                                      Container(
                                                        width: 180.w,
                                                        child: Text(

                                                          "${server.leaveaddress}",
                                                          maxLines: 1,

                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff020744),
                                                              fontFamily:
                                                                  "Franklin_Gothic",
                                                              fontSize: 18.sp),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 180.w,
                                                        child: Text(

                                                          "${server.destaddress}",
                                                          overflow: TextOverflow.ellipsis,
                                                          maxLines: 1,

                                                          style: TextStyle(

                                                              color: Color(
                                                                  0xff020744),
                                                              fontFamily:
                                                                  "Franklin_Gothic",
                                                              fontSize: 18.sp),
                                                        ),
                                                      ),
                                                      Text(
                                                        (server.stopaddress ==
                                                                null)
                                                            ? "N/A"
                                                            : "${server.stopaddress}",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff020744),
                                                            fontFamily:
                                                                "Franklin_Gothic",
                                                            fontSize: 18.sp),
                                                      ),
                                                      Text(
                                                        "${server.totalBookingRequest}",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff020744),
                                                            fontFamily:
                                                                "Franklin_Gothic",
                                                            fontSize: 18.sp),
                                                      ),
                                                      Text(
                                                        "${server.totalBookingAccept}",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff020744),
                                                            fontFamily:
                                                                "Franklin_Gothic",
                                                            fontSize: 18.sp),
                                                      ),
                                                      Text(
                                                        "${server.goTime}",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff020744),
                                                            fontFamily:
                                                                "Franklin_Gothic",
                                                            fontSize: 18.sp),
                                                      ),
                                                      SizedBox(
                                                        height: 15.h,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              top: 280.h,
                                              right: 100.w,
                                              child: (server.goDate.isAtSameMomentAs(DateTime.now()) ||server.goDate.isBefore(DateTime.now()))?Container(
                                                alignment: Alignment.center,
                                                height: 45.h,
                                                width: 100.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        25.r),
                                                    color: Colors.grey,),
                                                child: Text(
                                                  "Expire",
                                                  style: TextStyle(
                                                      fontFamily:
                                                      "Franklin_Gothic",
                                                      color:
                                                      Color(0xff000000),
                                                      fontSize: 20.sp),
                                                ),
                                              ):InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    cancelrequest=server.id;
                                                    print(cancelrequest);
                                                  });
                                                  _showDialog();
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: 45.h,
                                                  width: 100.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      gradient: LinearGradient(
                                                          begin: Alignment
                                                              .topCenter,
                                                          end: Alignment
                                                              .bottomCenter,
                                                          colors: [
                                                            Color(0xff060E57),
                                                            Color(0xff010311)
                                                          ])),
                                                  child: Text(
                                                    "Cancel",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Franklin_Gothic",
                                                        color:
                                                            Color(0xffFFFFFF),
                                                        fontSize: 20.sp),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                  ],
                                ),
                              );
                            })
                        : Center(
                            child: Text("Data Not Found"),
                          );
                  })),
        ),
      ),
    );
  }
}
