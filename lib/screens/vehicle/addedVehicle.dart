import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/homePage.dart';
import 'package:lechalo/models/getvehicleoffermodel.dart';
import 'package:lechalo/models/getvehicles.dart';
import 'package:lechalo/models/removeuservehiclemodel.dart';
import 'package:lechalo/screens/offerRide.dart';
import 'package:lechalo/screens/setSchedule.dart';
import 'package:lechalo/screens/updateVehicle.dart';
import 'package:lechalo/screens/vehicle/addVehicle.dart';
import 'package:lechalo/screens/drawer.dart';
import 'package:lechalo/screens/vehicle/riderList.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddedVehicles extends StatefulWidget {
  String type;
 // double lat, lng;

  AddedVehicles(this.type,{Key? key}) : super(key: key);

  @override
  _AddedVehiclesState createState() => _AddedVehiclesState();
}

class _AddedVehiclesState extends State<AddedVehicles> {
  String regid = "";
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
        regid = id!;
        print(regid);
        final Future<Getvehicles> user = getVehicles().getvehicles(regid);

        print("${regid}" + "after user getVehicles");
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: DrawerView(),
      appBar: AppBar(
        backgroundColor: Color(0xff060E57),
        leading: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.pop(context);
           //   Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: Text(
          "Added Vehicles List",
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
          margin: EdgeInsets.only(right: 7.w, left: 7.w),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40.r)),
          child: Padding(
              padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
              child: Stack(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: 35.h),
                    child: FutureBuilder<Getvehicleoffermodel>(
                        future: getvehicleOffer()
                            .getvehicleoffer(regid, widget.type),
                        builder: (context, snapshot) {
                          print("${regid}"  + "????????????????????????");
                          print("${widget.type}"  + "????????????????????????");
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
                                          SizedBox(
                                            height: 20.h
                                          ),
                                          Stack(children: [
                                            Container(
                                              height: 100.h,
                                              width: 200.w,
                                              decoration: (BoxDecoration(
                                                color: Color(0xff020744),
                                                borderRadius:
                                                    BorderRadius.circular(24.r),
                                              )),
                                            ),
                                            Slidable(
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              OfferRide(
                                                                  server
                                                                      .uservehicleid,
                                                                  server
                                                                      .maxseats,
                                                                  widget
                                                                      .type)));
                                                },
                                                child: Container(
                                                  height: 140.h,
                                                  width: 360.w,
                                                  decoration: (BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.r),
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
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Text(
                                                                "Vehicle Type",
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xff020744),
                                                                    fontFamily:
                                                                        "Franklin_Gothic",
                                                                    fontSize:
                                                                        18),
                                                              ),
                                                              SizedBox(
                                                                height: 30.h,
                                                              ),
                                                              Text(
                                                                "Vehicle Number",
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xff020744),
                                                                    fontFamily:
                                                                        "Franklin_Gothic",
                                                                    fontSize:
                                                                        18.sp),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Text(
                                                                ":",
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xff020744),
                                                                    fontFamily:
                                                                        "Franklin_Gothic",
                                                                    fontSize:
                                                                        18.sp),
                                                              ),
                                                              SizedBox(
                                                                height: 30.h,
                                                              ),
                                                              Text(
                                                                ":",
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xff020744),
                                                                    fontFamily:
                                                                        "Franklin_Gothic",
                                                                    fontSize:
                                                                        18.sp),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "${server.typename}",
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xff020744),
                                                                    fontFamily:
                                                                        "Franklin_Gothic",
                                                                    fontSize:
                                                                        18.sp),
                                                              ),
                                                              SizedBox(
                                                                height: 30.h,
                                                              ),
                                                              Text(
                                                                "${server.vehicleno}",
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xff020744),
                                                                    fontFamily:
                                                                        "Franklin_Gothic",
                                                                    fontSize:
                                                                        18),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .arrow_back,
                                                                color: Color(
                                                                    0xff020744),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              actionPane:
                                                  SlidableBehindActionPane(),
                                              actionExtentRatio: 0.20,
                                              secondaryActions: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.r),
                                                    color: Color(0xff020744),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      IconButton(
                                                          onPressed: () async {
                                                            print("aaaaaaa");
                                                            final Removeuservehiclemodel
                                                                user =
                                                                await removeUservehicle()
                                                                    .removeuservehicle(
                                                                        server
                                                                            .uservehicleid);

                                                            setState(() async {
                                                              print("aaa");
                                                              print(
                                                                  user.status);
                                                              if (user.status !=
                                                                  "success") {
                                                                setState(() {
                                                                  Fluttertoast
                                                                      .showToast(
                                                                    msg: user
                                                                        .msg,
                                                                    backgroundColor:
                                                                        Color(
                                                                            0xff060E57),
                                                                    textColor:
                                                                        Colors
                                                                            .white,
                                                                  );
                                                                });
                                                              } else {
                                                                setState(() {
                                                                  Fluttertoast
                                                                      .showToast(
                                                                    msg: user
                                                                        .msg,
                                                                    backgroundColor:
                                                                        Color(
                                                                            0xff060E57),
                                                                    textColor:
                                                                        Colors
                                                                            .white,
                                                                  );
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                });
                                                              }
                                                            });
                                                          },
                                                          icon: Icon(
                                                            CupertinoIcons
                                                                .delete_solid,
                                                            color: Colors.white,
                                                          )),
                                                      IconButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .push(MaterialPageRoute(
                                                                    builder: (context) =>
                                                                        EditVehcleDetails(
                                                                            server.uservehicleid)));
                                                          },
                                                          icon: Icon(
                                                            CupertinoIcons
                                                                .doc_text_fill,
                                                            color: Colors.white,
                                                          )),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ]),
                                        ],
                                      ),
                                    );
                                  },
                                )
                              : Center(child: Text("Data Not Found"));
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10.w, left: 10.w),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding:  EdgeInsets.only(right: 20.w, left: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AddVehicle()));
                            },
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffD60000),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 3,
                                          offset: Offset(0, 1))
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.all(8.0.h),
                                  child: Text(
                                    "Add New Vehicle",
                                    style: TextStyle(
                                        color: Color(0xff020744),
                                        fontFamily: "Franklin_Gothic",
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 18.sp),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => RiderList()));
                            },
                            child: Row(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 27,
                                            offset: Offset(0, 3))
                                      ],
                                    ),
                                    child: Icon(
                                      Icons.remove_red_eye,
                                      color: Color(0xff21B1DC),
                                    )),
                                Padding(
                                  padding:  EdgeInsets.all(8.0.h),
                                  child: Text(
                                    "All Rider's List",
                                    style: TextStyle(
                                        color: Color(0xff020744),
                                        fontFamily: "Franklin_Gothic",
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 18.sp),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
