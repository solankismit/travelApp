import 'package:flutter/material.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/driverhirevehiclebookingbiddinglistmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BidList extends StatefulWidget {


  @override
  _BidListState createState() => _BidListState();
}

class _BidListState extends State<BidList> {
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


        title: Text("Bid List", style: TextStyle(
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
            padding:  EdgeInsets.only(top: 20.h,bottom: 20.h),
            child: FutureBuilder<DriverhirevehiclebookingbiddinglistModel>(
            future: driverhirevehiclebookingBiddinglist().driverhirevehiclebookingbiddinglist(regid),builder: (context,snapshots) {

              return (snapshots.hasData)?ListView.builder(itemCount: snapshots.data!.driverBiddingList.length,itemBuilder: (context,index) {
                var server = snapshots.data!.driverBiddingList[index];
             return (server.biddingStatus=="Confirm")?
             Padding(
                padding:  EdgeInsets.only(right: 15.w,left: 15.w,bottom: 15.h),
                child:
                  Container(
                    height:
                    MediaQuery.of(context).size.height * 0.35,
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
                                    server.requestPickupLocation,
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
                                    server.requestDropLocation,
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
                                    "Date",
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
                                    "Passenger Name",
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
                                    "Passenger Number",
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
                                ],
                              ),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    server.preferCity,
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
                                    server.dtRequestBooking,
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
                                      server.dBiddingRate,
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
                                  server.passengerName,
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
                                  server.passengerMobile,
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

              ):Container();

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
