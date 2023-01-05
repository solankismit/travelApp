import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/allride.dart';
import 'package:lechalo/models/findridemodel.dart';
import 'package:lechalo/models/getpreferencemodel.dart';
import 'package:lechalo/models/singleoffer1model.dart';
import 'package:lechalo/screens/confirmBooking.dart';
import 'package:lechalo/screens/creatRideRequest.dart';
import 'package:lechalo/screens/loginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllRide extends StatefulWidget {
  String fromloc;
  String toloc;
  String llat;
  String llang;
  String dlat;
  String dlng;
  String distance;
  String type;

  AllRide(this.fromloc, this.toloc, this.llat, this.llang, this.dlat, this.dlng,
      this.distance, this.type,
      {Key? key})
      : super(key: key);

  @override
  _AllRideState createState() => _AllRideState();
}

class _AllRideState extends State<AllRide> {
  Future<bool> savedOfferidPreference(
    String offerid,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("offerid", offerid);
    return prefs.setString("offerid", offerid);
  }

  Future<bool> savedNamePreference(
    String id,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("id", id);

    return prefs.setString("id", id);
  }

  String? ptype;
  String? regid;
  late Future<Allride?> data;
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

    print(widget.type);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(414, 896),
        builder:(context, child) => Scaffold(
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
                "Ride List",
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
                height: 896.h,
                margin: EdgeInsets.only(right: 7.w, left: 7.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40.r)),
                child: Padding(
                  padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
                  child: Stack(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top:35.h),
                        child: FutureBuilder<Allride>(
                            future: allRide().allride(regid, "car"),
                            builder: (context, snapshot) {
                              return (snapshot.hasData)
                                  ? Padding(
                                      padding:
                                          EdgeInsets.only(top: 10.h, bottom: 10.h),
                                      child: ListView.builder(
                                          itemCount: snapshot.data!.detail.length,
                                          itemBuilder: (context, index) {
                                            var server =
                                                snapshot.data!.detail[index];
                                            if (server.offerpriceType == "0") {
                                              ptype = "Person";
                                            } else if (server.offerpriceType ==
                                                "1") {
                                              ptype = "KM";
                                            } else if (server.offerpriceType ==
                                                "3") {
                                              ptype = "Trip";
                                            }
                                            return Column(
                                              children: [
                                                SizedBox(
                                                  height: 20.h,
                                                ),
                                                InkWell(
                                                  onTap: () async {
                                                    print("aaa");
                                                    print(server.offerid);
                                                    savedOfferidPreference(
                                                            server.offerid)
                                                        .then((bool commited) {
                                                      setState(() {
                                                        print("cccc");
                                                      });
                                                    });
                                                    savedNamePreference(
                                                      regid as String,
                                                    ).then((bool committed) {
                                                      setState(() {
                                                        print(savedNamePreference(
                                                            regid!));

                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                ConfirmBooking(
                                                                    server
                                                                        .offerid),
                                                          ),
                                                        );
                                                      });
                                                    });
                                                    // Navigator.of(context).push(MaterialPageRoute(
                                                    //     builder: (context) => ConfirmBooking()));
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        right: 13.w,
                                                        left: 13.w,
                                                        top: 10.h),
                                                    height: 230.h,
                                                    width: 365.w,
                                                    decoration: (BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.r),
                                                      border: Border.all(
                                                          color: Colors
                                                              .grey.shade400),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Colors.grey,
                                                            blurRadius: 3,
                                                            offset: Offset(0, 1))
                                                      ],
                                                    )),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                                height: 50.h,
                                                                width: 50.w,
                                                                decoration: BoxDecoration(
                                                                    image: DecorationImage(
                                                                        image: AssetImage(
                                                                            "assets/profile.png")))),
                                                            SizedBox(
                                                              width: 16.w,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "${server.drivername}",
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xff040E86),
                                                                      fontFamily:
                                                                          "Franklin_Gothic",
                                                                      fontSize:
                                                                          14.sp),
                                                                ),
                                                                SizedBox(
                                                                  height: 18.h,
                                                                ),
                                                                Text(
                                                                  "Vehicle Type : ${server.offertype}",
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xff020744),
                                                                      fontFamily:
                                                                          "Franklin_Gothic",
                                                                      fontSize:
                                                                          14.sp),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              width: 38.w,
                                                            ),
                                                            Text(
                                                              "|",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff020744),
                                                                  fontSize: 30.sp),
                                                            ),
                                                            SizedBox(
                                                              width: 28.w,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .location_pin,
                                                                      color: Color(
                                                                          0xffE50027),
                                                                      size: 13.sp,
                                                                    ),
                                                                    SizedBox(
                                                                      width: 8.w,
                                                                    ),
                                                                    Text(
                                                                      "${server.leavecity}",
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xff020744),
                                                                          fontFamily:
                                                                              "Franklin_Gothic",
                                                                          fontSize:
                                                                              14.sp),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 3.h,
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              30),
                                                                  child: Text(
                                                                    "To",
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xff020744),
                                                                        fontFamily:
                                                                            "Franklin_Gothic",
                                                                        fontSize:
                                                                            12.sp),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 3.h,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .location_pin,
                                                                      color: Color(
                                                                          0xffE50027),
                                                                      size: 13.sp,
                                                                    ),
                                                                    SizedBox(
                                                                      width: 8.w,
                                                                    ),
                                                                    Text(
                                                                      "${server.destcity}",
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffE50027),
                                                                          fontFamily:
                                                                              "Franklin_Gothic",
                                                                          fontSize:
                                                                              14.sp),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 28.h,
                                                        ),

                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 38.w,
                                                            ),
                                                            Text(
                                                              "Time: ${server.goTime}",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff020744),
                                                                  fontFamily:
                                                                      "Franklin_Gothic",
                                                                  fontSize:
                                                                      14.sp),
                                                            ),
                                                            SizedBox(
                                                              width: 106.w,
                                                            ),
                                                            Text(
                                                              "Date: ${server.goDate.day}/${server.goDate.month}/${server.goDate.year}",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff020744),
                                                                  fontFamily:
                                                                      "Franklin_Gothic",
                                                                  fontSize:
                                                                      14.sp),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 10.h,
                                                        ),
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 122.w,
                                                            ),
                                                            Container(
                                                              height: 20.h,
                                                              width: 20.w,
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          "assets/money.png"))),
                                                            ),
                                                            SizedBox(
                                                              width: 5.w,
                                                            ),
                                                            (server.offerpriceType !=
                                                                    "3")
                                                                ? Text(
                                                                    "${server.leaveDestFare} / $ptype ",
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xff020744),
                                                                        fontFamily:
                                                                            "Franklin_Gothic",
                                                                        fontSize:
                                                                            14.sp),
                                                                  )
                                                                : Text(
                                                                    "Free",
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xff020744),
                                                                        fontFamily:
                                                                            "Franklin_Gothic",
                                                                        fontSize:
                                                                            14.sp),
                                                                  ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 17.h,
                                                        ),
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 78.w,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                (server.pet ==
                                                                        "Allow")
                                                                    ? Container(
                                                                        height:
                                                                            70.h,
                                                                        width: 70.w,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                                image: DecorationImage(image: AssetImage("assets/pets.png"))),
                                                                      )
                                                                    : Container(
                                                                        height:
                                                                            50.h,
                                                                        width: 50.w,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                                image: DecorationImage(image: AssetImage("assets/dp.png"))),
                                                                      ),
                                                                (server.music ==
                                                                        "Allow")
                                                                    ? Container(
                                                                        height:
                                                                            70.h,
                                                                        width: 70.w,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                                image: DecorationImage(image: AssetImage("assets/music.png"))),
                                                                      )
                                                                    : Container(
                                                                        height:
                                                                            50.h,
                                                                        width: 50.w,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                                image: DecorationImage(image: AssetImage("assets/dm.png"))),
                                                                      ),
                                                                (server.smoke ==
                                                                        "Allow")
                                                                    ? Container(
                                                                        height:
                                                                            70.h,
                                                                        width: 70.w,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                                image: DecorationImage(image: AssetImage("assets/smoking.png"))),
                                                                      )
                                                                    : Container(
                                                                        height:
                                                                            50.h,
                                                                        width: 50.w,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                                image: DecorationImage(image: AssetImage("assets/ds.png"))),
                                                                      ),
                                                                (server.chat ==
                                                                        "Allow")
                                                                    ? Container(
                                                                        height:
                                                                            70.h,
                                                                        width: 70.w,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                                image: DecorationImage(image: AssetImage("assets/chattiness.png"))),
                                                                      )
                                                                    : Container(
                                                                        height:
                                                                            50.h,
                                                                        width: 50.w,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                                image: DecorationImage(image: AssetImage("assets/dc.png"))),
                                                                      ),
                                                              ],
                                                            )
                                                          ],
                                                        )

                                                        // SizedBox(
                                                        //   height: MediaQuery.of(context).size.height*0.03,
                                                        // ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }),
                                    )
                                  : Center(child: CircularProgressIndicator());
                            }),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10.w, left: 10.w),
                        decoration: BoxDecoration(color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CreatRideRequest(
                                        widget.llat,
                                        widget.llang,
                                        widget.dlat,
                                        widget.dlng,
                                        widget.fromloc,
                                        widget.toloc,
                                        widget.distance,
                                        widget.type)));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height:
                                    55.h,
                                width: 160.w,
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
                                  "Create Request",
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
                    ],
                  ),
                ),
              ),
            )));
  }
}
