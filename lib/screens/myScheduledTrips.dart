import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/getvehicles.dart';
import 'package:lechalo/models/myschedule.dart';
import 'package:lechalo/models/removeschedulemodel.dart';
import 'package:lechalo/screens/requestList.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyScheduledTrips extends StatefulWidget {


  @override
  _MyScheduledTripsState createState() => _MyScheduledTripsState();
}

class _MyScheduledTripsState extends State<MyScheduledTrips> {
   var sid;

  String? regid;
  late Future<Getvehicles?> data;
  String? id;

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
    final Future<Getvehicles> user = getVehicles()
        .getvehicles(regid) ;
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
                  width: 350.w,
                  child: Padding(
                    padding:  EdgeInsets.only(top: 30.0.h,right: 20.w,left: 20.w),
                    child: Column(
                      children: [
                        Text(
                          "Are you sure you want to Delete This Schedule?",
                          textAlign: TextAlign.center,
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
                            width: 150.w,
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
                          onTap: ()async {

                            final Removeschedulemodel user = await removeSchedule().removeschedule(sid);

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
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 45.h,
                            width: 150.w,
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
      appBar: AppBar(
        backgroundColor: Color(0xff060E57),
        leading: IconButton(padding: EdgeInsets.zero,onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),


        title: Text("My Scheduled Trips",style: TextStyle(
            fontFamily: "Franklin_Gothic"
        ),),
        centerTitle: true,
        elevation: 0,

      ),
      body: Container(
        width: 414.w,
        height: 814.h,

        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff060E57),
                  Color(0xff010311)
                ]
            )
        ),
        child: Container(
          height: 814.h,
          width: 400.w,
          margin: EdgeInsets.only(right: 7.w,left: 7.w),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40.r)
          ),
          child: Padding(
            padding:  EdgeInsets.all(15.h),
            child: FutureBuilder<Myschedule>(future: mySchedule().myschedule(regid),
    builder: (context,snapshot) {
      return (snapshot.hasData) ? ListView.builder(
          itemCount: snapshot.data!.detail.length,
          itemBuilder: (context, index) {
            var server = snapshot.data!.detail[index];
            return Column(

              children: [
                Container(
                  height: 400.h,
                  width: double.infinity,
                  decoration: (
                      BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24.r),
                        border: Border.all(color: Colors.grey.shade400),

                        boxShadow: [BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3,
                            offset: Offset(0, 1)

                        )
                        ],
                      )
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Scheduled no:", style: TextStyle(
                                color: Color(0xff020744),
                                fontFamily: "Franklin_Gothic",

                                fontSize: 15.sp
                            ),),
                            Container(
                              width: 200.w,
                              child: Text(

                                "${server.scheduleRideData}", style: TextStyle(
                                  color: Color(0xff020744),
                                  fontFamily: "Franklin_Gothic",

                                  fontSize: 15.sp
                              ),
                              overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(onPressed: () {
                              this.sid=server.id;
                              _showDialog();
                            },
                                icon: Icon(CupertinoIcons.delete_solid,
                                  color: Color(0xff020744),))
                          ],
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(right: 25.w, left: 25.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Container(
                              height: 300.h,
                              width: 100.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [


                                  Text("From", style: TextStyle(
                                      color: Color(0xff020744),
                                      fontFamily: "Franklin_Gothic",

                                      fontSize: 18.sp
                                  ),),
                                  Text("To", style: TextStyle(
                                      color: Color(0xff020744),
                                      fontFamily: "Franklin_Gothic",

                                      fontSize: 18.sp
                                  ),),
                                  Text("Available seat", style: TextStyle(
                                      color: Color(0xff020744),
                                      fontFamily: "Franklin_Gothic",

                                      fontSize: 18.sp
                                  ),),
                                  // SizedBox(
                                  //   height: MediaQuery.of(context).size.height*0.03,
                                  // ),
                                  Text("Vehicle Type", style: TextStyle(
                                      color: Color(0xff020744),
                                      fontFamily: "Franklin_Gothic",
                                      fontSize: 18.sp
                                  ),),
                                  Text("Distance", style: TextStyle(
                                      color: Color(0xff020744),
                                      fontFamily: "Franklin_Gothic",
                                      fontSize: 18.sp
                                  ),),


                                  Text("Time", style: TextStyle(
                                      color: Color(0xff020744),
                                      fontFamily: "Franklin_Gothic",

                                      fontSize: 18.sp
                                  ),),
                                  Text("Offer Price", style: TextStyle(
                                      color: Color(0xff020744),
                                      fontFamily: "Franklin_Gothic",

                                      fontSize: 18.sp
                                  ),),
                                ],
                              ),
                            ),

                            Container(
                              height: 300.h,
                              width: 200.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [


                                  Text("${server.leavecity}", style: TextStyle(
                                      color: Color(0xff020744),
                                      fontFamily: "Franklin_Gothic",

                                      fontSize: 18.sp
                                  ),),
                                  Text("${server.destcity}", style: TextStyle(
                                      color: Color(0xff020744),
                                      fontFamily: "Franklin_Gothic",

                                      fontSize: 18.sp
                                  ),),
                                  Text("${server.availSeat}", style: TextStyle(
                                      color: Color(0xff020744),
                                      fontFamily: "Franklin_Gothic",

                                      fontSize: 18.sp
                                  ),),

                                  Text("${server.offertype}", style: TextStyle(
                                      color: Color(0xff020744),
                                      fontFamily: "Franklin_Gothic",

                                      fontSize: 18.sp
                                  ),),
                                  Text("${server.distance}", style: TextStyle(
                                      color: Color(0xff020744),
                                      fontFamily: "Franklin_Gothic",

                                      fontSize: 18.sp
                                  ),),


                                  Text("${server.goTime}", style: TextStyle(
                                      color: Color(0xff020744),
                                      fontFamily: "Franklin_Gothic",

                                      fontSize: 18.sp
                                  ),),

                                  Text("${server.offerpriceType}", style: TextStyle(
                                      color: Color(0xff020744),
                                      fontFamily: "Franklin_Gothic",

                                      fontSize: 18.sp
                                  ),),


                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                ),
                SizedBox(
                  height: 30.h,
                ),




              ],
            );
          }

      ):Center( child: Text("Data Not Found"));
    }
        ),


      ),
    )
    )
    );
  }

}