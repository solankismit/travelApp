import 'package:flutter/material.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/allsendparcelmodel.dart';
import 'package:lechalo/screens/parceldetailsScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MyParcelRequestList extends StatefulWidget {
  @override
  _MyParcelRequestListState createState() => _MyParcelRequestListState();
}

class _MyParcelRequestListState extends State<MyParcelRequestList> {
  String? regid;

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
          "My Parcel Request",
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
          height: 810.h,
          margin: EdgeInsets.only(right: 7.w, left: 7.w),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40.r)),
          child: Padding(
              padding:  EdgeInsets.only(top: 15.h, bottom: 15.h),
              child: FutureBuilder<Allsendparcelmodel>(
                future: allSendparcel().allsendparcel(regid),
                builder: (context, snapshot) {
                  return (snapshot.hasData)
                      ? ListView.builder(
                      itemCount: snapshot.data!.data.length,
                      itemBuilder: (context, index) {
                        var server = snapshot.data!.data[index];
                        return Padding(
                          padding:  EdgeInsets.all(10.0.h),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context)
                              =>
                                  ParcelDetails(
                                      server.dItemHeight,
                                      server.dItemWidth,
                                      server.dItemLength,
                                      server.dItemWeight,
                                      server.tExtraDetails,
                                      server.vReceiverMobile,
                                      server.vReceiverName,
                                      server.vSenderName,
                                      server.vToCity,
                                      server.vFromCity,
                                      server.eItemSize,
                                      server.tItemName,
                                      server.ePickupDateTime,
                                      server.ePickupTime,
                                      server.vSenderMobile,
                                      server.tToLocation,
                                      server.tFromLocation,
                                      server.dFromLocationLat,
                                      server.dFromLocationLong,
                                      server.dItemValue,
                                      server.dToLocationLat,
                                      server.dToLocationLong,
                                      server.eReceiveDateTime,
                                      server.eRecieveTime,
                                      server.eWhoWillMeetDriverAtDeliveryLocation,
                                      server.eWhoWillMeetDriverAtPickupLocation,
                                      server.iSenderId,
                                      server.iSendParcelId,
                                      server.tItemDimention,
                                  server.vItemPhoto)));
                            },
                            child:
                            Container(
                              height:
                              270.h,
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
                                    bottom: 10.h,
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
                                              server.tFromLocation,
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
                                              server.tToLocation,
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
                                              "Parcel",
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
                                              "Parcel Size",
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
                                              "Pickup Time",
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
                                              "Parcel Status",
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
                                                  fontSize: 18.sp
                                              ),
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
                                              server.tItemName,
                                              style: TextStyle(
                                                  color: Color(0xff020744),
                                                  fontFamily:
                                                  "Franklin_Gothic",
                                                  fontSize: 18.sp
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Text(
                                              server.eItemSize,
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
                                              (server.ePickupTime == "1")
                                                  ? "Within 1 day"
                                                  : (server.ePickupTime ==
                                                  "0")
                                                  ? "Immediate"
                                                  : (server.ePickupTime ==
                                                  "2")
                                                  ? "Within 1 week"
                                                  : server
                                                  .ePickupDateTime,
                                              style: TextStyle(
                                                  color: Color(0xff020744),
                                                  fontFamily:
                                                  "Franklin_Gothic",
                                                  fontSize: (server
                                                      .ePickupTime ==
                                                      "1" ||
                                                      server.ePickupTime ==
                                                          "0" ||
                                                      server.ePickupTime ==
                                                          "2")
                                                      ? 18
                                                      : 12),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Text(
                                              server.eSendParcelStatus,
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
                          ),
                        );
                      })
                      : Center(
                    child: Text(
                      "No Data Found",
                      style: TextStyle(fontFamily: "Franklin_Gothic"),
                    ),
                  );
                },
              )),
        ),
      ),
    );
  }
}
