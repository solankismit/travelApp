import 'package:flutter/material.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/passengerconfirmhirevehiclerequestModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAcceptedTrips extends StatefulWidget {


  @override
  _MyAcceptedTripsState createState() => _MyAcceptedTripsState();
}

class _MyAcceptedTripsState extends State<MyAcceptedTrips> {
  String? id;
  String? regid;

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff060E57),
        leading: IconButton(padding: EdgeInsets.zero, onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),


        title: Text("My Accepted Trips", style: TextStyle(
            fontFamily: "Franklin_Gothic"
        ),),
        centerTitle: true,
        elevation: 0,

      ),
      body: Container(
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
          margin: EdgeInsets.only(right: 7.w, left: 7.w),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40.r)
          ),
          child:
          Padding(
            padding: EdgeInsets.only(top: 20.h,bottom: 20.h),
            child: FutureBuilder<PassengerconfirmhirevehiclerequestModel>(
                future: passengerConfirmhirevehiclerequest().passengerconfirmhirevehiclerequest(regid),builder: (context,snapshots) {

              return (snapshots.hasData)?ListView.builder(itemCount: snapshots.data!.passengerConfirmRequests.length,itemBuilder: (context,index) {
                var server = snapshots.data!.passengerConfirmRequests[index];
                return
                Padding(
                  padding: EdgeInsets.only(right: 15.w,left: 15.w,bottom: 15.h),
                  child:
                  Container(
                    height:
                    MediaQuery.of(context).size.height * 0.45,
                    width: 414.w,
                    decoration: (BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.r),
                      border:
                      Border.all(color: Colors.grey.shade400),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3,
                            offset: Offset(0, 1))
                      ],
                    )),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 10.h,

                          right: 25.w,
                          left: 20.w),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    server.vPickupLocation,
                                    style: TextStyle(
                                        color: Color(0xff020744),
                                        fontFamily:
                                        "Franklin_Gothic",
                                        fontSize: 18.sp),
                                  ),
                                  Text(
                                    "To",
                                    style: TextStyle(
                                        color: Color(0xff020744),
                                        fontFamily:
                                        "Franklin_Gothic",
                                        fontSize: 18.sp),
                                  ),
                                  Text(
                                    server.vDropLocation,
                                    style: TextStyle(
                                        color: Color(0xff020744),
                                        fontFamily:
                                        "Franklin_Gothic",
                                        fontSize: 18.sp),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "City",
                                    style: TextStyle(
                                        color: Color(0xff020744),
                                        fontFamily:
                                        "Franklin_Gothic",
                                        fontSize: 18.sp),
                                  ),

                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    "Bid Rate",
                                    style: TextStyle(
                                        color: Color(0xff020744),
                                        fontFamily:
                                        "Franklin_Gothic",
                                        fontSize: 18.sp),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    "Vehicle Type",
                                    style: TextStyle(
                                        color: Color(0xff020744),
                                        fontFamily:
                                        "Franklin_Gothic",
                                        fontSize: 18.sp),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    "Vehicle Number",
                                    style: TextStyle(
                                        color: Color(0xff020744),
                                        fontFamily:
                                        "Franklin_Gothic",
                                        fontSize: 18.sp),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    "Driver Name",
                                    style: TextStyle(
                                        color: Color(0xff020744),
                                        fontFamily:
                                        "Franklin_Gothic",
                                        fontSize: 18.sp),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    "Driver Number",
                                    style: TextStyle(
                                        color: Color(0xff020744),
                                        fontFamily:
                                        "Franklin_Gothic",
                                        fontSize: 18.sp),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    "Ride Date",
                                    style: TextStyle(
                                        color: Color(0xff020744),
                                        fontFamily:
                                        "Franklin_Gothic",
                                        fontSize: 18.sp),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    "Ride Time",
                                    style: TextStyle(
                                        color: Color(0xff020744),
                                        fontFamily:
                                        "Franklin_Gothic",
                                        fontSize: 18.sp),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ":",
                                    style: TextStyle(
                                        color: Color(0xff020744),
                                        fontFamily:
                                        "Franklin_Gothic",
                                        fontSize: 18.sp),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    ":",
                                    style: TextStyle(
                                        color: Color(0xff020744),
                                        fontFamily:
                                        "Franklin_Gothic",
                                        fontSize: 18.sp),
                                  ),

                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    ":",
                                    style: TextStyle(
                                        color: Color(0xff020744),
                                        fontFamily:
                                        "Franklin_Gothic",
                                        fontSize: 18.sp),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    ":",
                                    style: TextStyle(
                                        color: Color(0xff020744),
                                        fontFamily:
                                        "Franklin_Gothic",
                                        fontSize: 18.sp),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    ":",
                                    style: TextStyle(
                                        color: Color(0xff020744),
                                        fontFamily:
                                        "Franklin_Gothic",
                                        fontSize: 18.sp),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    ":",
                                    style: TextStyle(
                                        color: Color(0xff020744),
                                        fontFamily:
                                        "Franklin_Gothic",
                                        fontSize: 18.sp),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    ":",
                                    style: TextStyle(
                                        color: Color(0xff020744),
                                        fontFamily:
                                        "Franklin_Gothic",
                                        fontSize: 18.sp),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    ":",
                                    style: TextStyle(
                                        color: Color(0xff020744),
                                        fontFamily:
                                        "Franklin_Gothic",
                                        fontSize: 18.sp),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    server.vCity,
                                    style: TextStyle(
                                        color: Color(0xff020744),
                                        fontFamily:
                                        "Franklin_Gothic",
                                        fontSize: 18.sp),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    server.driverBiddingRate,
                                    style: TextStyle(
                                        color: Color(0xff020744),
                                        fontFamily:
                                        "Franklin_Gothic",
                                        fontSize: 18.sp),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                      server.eVehicleType,
                                      style: TextStyle(
                                        color: Color(0xff020744),
                                        fontFamily:
                                        "Franklin_Gothic",
                                        fontSize: 18.sp,
                                      )
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    server.driverVehicleNo,
                                    style: TextStyle(
                                        color: Color(0xff020744),
                                        fontFamily:
                                        "Franklin_Gothic",
                                        fontSize: 18.sp),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    server.driverName,
                                    style: TextStyle(
                                        color: Color(0xff020744),
                                        fontFamily:
                                        "Franklin_Gothic",
                                        fontSize: 18.sp),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    server.driverMobile,
                                    style: TextStyle(
                                        color: Color(0xff020744),
                                        fontFamily:
                                        "Franklin_Gothic",
                                        fontSize: 18.sp),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    "${server.requestBookingDate.day}-${server.requestBookingDate.month}-${server.requestBookingDate.year}",
                                    style: TextStyle(
                                        color: Color(0xff020744),
                                        fontFamily:
                                        "Franklin_Gothic",
                                        fontSize: 18.sp),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    server.requestBookingTime,
                                    style: TextStyle(
                                        color: Color(0xff020744),
                                        fontFamily:
                                        "Franklin_Gothic",
                                        fontSize: 18.sp),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                );

              }
              ):
              Center(child: Text("Data Not Found"));


            }
            ),
          ),
        ),


      ),
    );
  }
}