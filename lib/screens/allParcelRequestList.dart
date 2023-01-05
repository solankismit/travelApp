import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/currentallsendparcelmodel.dart';
import 'package:lechalo/models/sendnotificationtopickparcelmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllParcelRequestList extends StatefulWidget {
  @override
  _AllParcelRequestListState createState() => _AllParcelRequestListState();
}

class _AllParcelRequestListState extends State<AllParcelRequestList> {
  _showDialog(String driverid, sendparcelid, pname, psize, padd, dadd, sname,
      smobile, rname, rmobile, ptime, edetails, gweight, dimension) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Container(
                  height: 700.h,
                  width: 330.w,

                  child: Padding(
                    padding:  EdgeInsets.only(top: 9.h),
                    child: ListView(children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 8.0.w),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("Parcel Details",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Franklin_Gothic")),
                                  SizedBox(
                                    width:
                                        100.w,
                                  ),
                                  Container(
                                    height: 30.h,
                                    width: 30.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black),
                                    child: IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(
                                          Icons.close,
                                          color: Colors.white,
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 40.w, right: 40.w),
                            child: Column(
                              children: [
                                Container(
                                  height:
                                     120.h,
                                  width:
                                      120.w,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/uploadParcel.png"),
                                      ),
                                      border: Border.all(
                                          color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.circular(10.r)),
                                ),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Parcel Name ",
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 16.sp),
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.only(right: 45.w),
                                          child: Text(
                                            pname,
                                            style: TextStyle(
                                                color: Color(0xff020744),
                                                fontFamily: "Franklin_Gothic",
                                                fontSize: 16.sp),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 13.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Parcel size ",
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 16.sp),
                                        ),
                                        Text(
                                          psize,
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 15.sp),
                                        ),
                                        SizedBox(height: 13.h),
                                        Text(
                                          "Pickup Address",
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 16.sp),
                                        ),
                                        Text(
                                          padd,
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 15.sp),
                                        ),
                                        SizedBox(height: 13.h),
                                        Text(
                                          "Delivery Address",
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 16.sp),
                                        ),
                                        Text(dadd,
                                            style: TextStyle(
                                                color: Color(0xff020744),
                                                fontFamily: "Franklin_Gothic",
                                                fontSize: 15.sp)),
                                        SizedBox(height: 13.h),
                                        Text(
                                          "Sender Name",
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 16.sp),
                                        ),
                                        Text(
                                          sname,
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 15.sp),
                                        ),
                                        SizedBox(height: 13.h),
                                        Text(
                                          "Sender Mobile",
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 16.sp),
                                        ),
                                        Text(
                                          smobile,
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 15.sp),
                                        ),
                                        SizedBox(height: 13.h),
                                        Text(
                                          "Receiver Name ",
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 16.sp),
                                        ),
                                        Text(
                                          rname,
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 15.sp),
                                        ),
                                        SizedBox(height: 13.h),
                                        Text(
                                          "Receiver No",
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 16.sp),
                                        ),
                                        Text(
                                          rmobile,
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 15.sp),
                                        ),
                                        SizedBox(height: 13.h),
                                        Text(
                                          "Pickup Time ?",
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 16.sp),
                                        ),
                                        Text(
                                          ptime,
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 15.sp),
                                        ),
                                        SizedBox(height: 13.h),
                                        Text(
                                          "Extra Details",
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 16.sp),
                                        ),
                                        Text(
                                          edetails,
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 15.sp),
                                        ),
                                        SizedBox(height: 13.h),
                                        Text(
                                          "Gross Weight",
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 16.sp),
                                        ),
                                        Text(
                                          gweight,
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 15.sp),
                                        ),
                                        SizedBox(height: 13.h),
                                        Text(
                                          "Dimension",
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 16.sp),
                                        ),
                                        Text(
                                          dimension,
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 15.sp),
                                        ),
                                      ],
                                    ),
                                    //                   Column(
                                    //                     crossAxisAlignment: CrossAxisAlignment.start,
                                    //                     children: [
                                    //                       Text("M",style: TextStyle(
                                    //                           color: Color(0xff020744),
                                    //                           fontFamily: "Franklin_Gothic",
                                    //
                                    //                           fontSize: 15
                                    //                       ),),
                                    //                       SizedBox(height: 13),
                                    //                       Text("Ahmedabad",style: TextStyle(
                                    //                           color: Color(0xff020744),
                                    //                           fontFamily: "Franklin_Gothic",
                                    //
                                    //                           fontSize: 15
                                    //                       ),),
                                    //                       SizedBox(height: 13),
                                    //                       Text("Gandhinagar",style: TextStyle(
                                    //                           color: Color(0xff020744),
                                    //                           fontFamily: "Franklin_Gothic",
                                    //
                                    //                           fontSize: 15
                                    //                       ),), SizedBox(height: 13),
                                    //                       Text("Me",style: TextStyle(
                                    //                           color: Color(0xff020744),
                                    //                           fontFamily: "Franklin_Gothic",
                                    //
                                    //                           fontSize: 15
                                    //                       ),), SizedBox(height: 13),
                                    //                       Text("Ashok",style: TextStyle(
                                    //                           color: Color(0xff020744),
                                    //                           fontFamily: "Franklin_Gothic",
                                    //
                                    //                           fontSize: 15
                                    //                       ),),  SizedBox(height: 13),
                                    //                       Text("989***9898",style: TextStyle(
                                    //                           color: Color(0xff020744),
                                    //                           fontFamily: "Franklin_Gothic",
                                    //
                                    //                           fontSize: 15
                                    //                       ),), SizedBox(height: 13),
                                    //                       Text("Within 1 week",style: TextStyle(
                                    //                           color: Color(0xff020744),
                                    //                           fontFamily: "Franklin_Gothic",
                                    //
                                    //                           fontSize: 15
                                    //                       ),),
                                    //                       SizedBox(height: 13),
                                    //                       Text("aksn***jhjh",style: TextStyle(
                                    //                           color: Color(0xff020744),
                                    //                           fontFamily: "Franklin_Gothic",
                                    //
                                    //                           fontSize: 15
                                    //                       ),),
                                    //                       SizedBox(height: 13),
                                    //                       Text("10",style: TextStyle(
                                    //                           color: Color(0xff020744),
                                    //                           fontFamily: "Franklin_Gothic",
                                    //
                                    //                           fontSize: 15
                                    //                       ),),
                                    //                       SizedBox(height: 13),
                                    //                       Text("10*15*21",style: TextStyle(
                                    //                           color: Color(0xff020744),
                                    //                           fontFamily: "Franklin_Gothic",
                                    //
                                    //                           fontSize: 15
                                    //                       ),),
                                    //
                                    // ]
                                    //
                                    //
                                    //                   )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              final Sendnotificationtopickparcelmodel user =
                                  await sendnotificationtoPickparcel()
                                      .sendnotificationtopickparcel(
                                          driverid, sendparcelid);

                              setState(() async {
                                print("aaa");
                                print(user.status);
                                if (user.status != "success") {
                                  setState(() {
                                    Fluttertoast.showToast(
                                      msg: user.msg,
                                      backgroundColor: Color(0xff060E57),
                                      textColor: Colors.white,
                                    );
                                  });
                                } else {
                                  setState(() {
                                    Fluttertoast.showToast(
                                      msg: user.msg,
                                      backgroundColor: Color(0xff060E57),
                                      textColor: Colors.white,
                                    );
                                    Navigator.of(context).pop();
                                  });
                                }
                              });
                              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyParcelRequestList()));
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 30.h, bottom: 10.h),
                              alignment: Alignment.center,
                              height: 50.h,
                              width: 200.w,
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
                                "Request to pick Parcel",
                                style: TextStyle(
                                    fontFamily: "Franklin_Gothic",
                                    color: Color(0xffFFFFFF),
                                    fontSize: 18.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                )),
          );
        });
  }

  String? regid;

  String? id;

  Future<String?> getNamePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("id");
    return id;
  }

  var timep;

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
          "All Parcel RequestList",
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
            padding: EdgeInsets.only(top: 20.h, bottom: 15.h),
            child: FutureBuilder<Currentallsendparcelmodel>(
                future: currentAllsendparcel().currentallsendparcel(),
                builder: (context, snapshot) {
                  return (snapshot.hasData)
                      ? ListView.builder(
                          itemCount: snapshot.data!.data.length,
                          itemBuilder: (context, index) {
                            var server = snapshot.data!.data[index];
                            if (server.ePickupTime == "0") {
                              timep = "within 45 mins";
                            } else if (server.ePickupTime == "1") {
                              timep = "within 1 Day";
                            } else if (server.ePickupTime == "2") {
                              timep = "within 1 Week";
                            } else if (server.ePickupTime == "3") {
                              timep = DateFormat("dd-MM-yyyy")
                                  .format(
                                      DateTime.parse(server.ePickupDateTime))
                                  .toString();
                            }
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    _showDialog(
                                        regid!,
                                        server.iSendParcelId,
                                        server.tItemName,
                                        server.eItemSize,
                                        server.tFromLocation,
                                        server.tToLocation,
                                        server.vSenderName,
                                        server.vSenderMobile,
                                        server.vReceiverName,
                                        server.vReceiverMobile,
                                        timep.toString(),
                                        server.tExtraDetails,
                                        server.dItemWeight,
                                        "${server.dItemLength}*${server.dItemWidth}*${server.dItemHeight}");
                                    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TOfferRide()));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 20.w, bottom: 20.h, right: 20.w),
                                    height: 300.h,
                                    width: MediaQuery.of(context).size.width,
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
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          "${server.tFromLocation}",
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 16.sp),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          "To",
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 14.sp),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          "${server.tToLocation}",
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 16.sp),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(15.0.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Parcel",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff020744),
                                                        fontFamily:
                                                            "Franklin_Gothic",
                                                        fontSize: 16.sp),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        10.h,
                                                  ),
                                                  Text(
                                                    "Parcel Size",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff020744),
                                                        fontFamily:
                                                            "Franklin_Gothic",
                                                        fontSize: 16.sp),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        10.h,
                                                  ),
                                                  Text(
                                                    "Pickup Time",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff020744),
                                                        fontFamily:
                                                            "Franklin_Gothic",
                                                        fontSize: 16.sp),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${server.tItemName}",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff020744),
                                                        fontFamily:
                                                            "Franklin_Gothic",
                                                        fontSize: 16.sp),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        10.h,
                                                  ),
                                                  Text(
                                                    "${server.eItemSize}",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff020744),
                                                        fontFamily:
                                                            "Franklin_Gothic",
                                                        fontSize: 16.sp),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        10.h,
                                                  ),
                                                  Text(
                                                    timep,
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff020744),
                                                        fontFamily:
                                                            "Franklin_Gothic",
                                                        fontSize: 16.sp),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0.h),
                                          child: Icon(
                                            CupertinoIcons.right_chevron,
                                            color: Color(0xff020744),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          })
                      : Center(
                          child: Text("Data Note Found"),
                        );
                }),
          ),
        ),
      ),
    );
  }
}
