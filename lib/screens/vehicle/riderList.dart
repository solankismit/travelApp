import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/allrequestedride.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RiderList extends StatefulWidget {
  @override
  _RiderListState createState() => _RiderListState();
}

class _RiderListState extends State<RiderList> {
  String? regid;
  late Future<Allrequestedride?> data;
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
        print("${regid}" + "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
       // final Future<Allrequestedride> user = allRequestedride().allrequestedride(regid);
        print("${regid}" + ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      }
      );
    }


    );

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
            "Rider's List",
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
              padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
              child: FutureBuilder<Allrequestedride>(
                  future: allRequestedride().allrequestedride(regid),
                  builder:  (context,snapshot) {
                return (snapshot.hasData) ?

                ListView.builder(
                    itemCount: snapshot.data!.detail.length,
                    itemBuilder: (context, index) {
                      var server = snapshot.data!.detail[index];
                      return  Padding(
                              padding:
                               EdgeInsets.only(right: 15.w, left: 15.w),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height:
                                    20.h,
                                  ),
                                  Container(
                                    height: 250.h,
                                    width: 350.w,
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
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              // mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "From",
                                                  style: TextStyle(
                                                      color:
                                                      Color(0xff020744),
                                                      fontFamily:
                                                      "Franklin_Gothic",
                                                      fontSize: 18.sp),
                                                ),
                                                SizedBox(
                                                  height:
                                                  20.h,
                                                ),
                                                Text(
                                                  "To",
                                                  style: TextStyle(
                                                      color:
                                                      Color(0xff020744),
                                                      fontFamily:
                                                      "Franklin_Gothic",
                                                      fontSize: 18.sp),
                                                ),
                                                SizedBox(
                                                  height:
                                                  20.h,
                                                ),
                                                Text(
                                                  "Seats",
                                                  style: TextStyle(
                                                      color:
                                                      Color(0xff020744),
                                                      fontFamily:
                                                      "Franklin_Gothic",
                                                      fontSize: 18.sp),
                                                ),
                                                SizedBox(
                                                  height:
                                                  20.h,
                                                ),
                                                Text(
                                                  "Date",
                                                  style: TextStyle(
                                                      color:
                                                      Color(0xff020744),
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
                                                      color:
                                                      Color(0xff020744),
                                                      fontFamily:
                                                      "Franklin_Gothic",
                                                      fontSize: 18.sp),
                                                ),
                                                SizedBox(
                                                  height:
                                                  20.h,
                                                ),
                                                Text(
                                                  ":",
                                                  style: TextStyle(
                                                      color:
                                                      Color(0xff020744),
                                                      fontFamily:
                                                      "Franklin_Gothic",
                                                      fontSize: 18.sp),
                                                ),
                                                SizedBox(
                                                  height:
                                                  20.h,
                                                ),
                                                Text(
                                                  ":",
                                                  style: TextStyle(
                                                      color:
                                                      Color(0xff020744),
                                                      fontFamily:
                                                      "Franklin_Gothic",
                                                      fontSize: 18.sp),
                                                ),
                                                SizedBox(
                                                  height:
                                                  20.h,
                                                ),
                                                Text(
                                                  ":",
                                                  style: TextStyle(
                                                      color:
                                                      Color(0xff020744),
                                                      fontFamily:
                                                      "Franklin_Gothic",
                                                      fontSize: 18.sp),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              width: 100.w,
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${server.leaveaddress}",
                                                    overflow:TextOverflow.ellipsis,
                                                    softWrap: true,
                                                    style: TextStyle(
                                                        color:
                                                        Color(0xff020744),
                                                        fontFamily:
                                                        "Franklin_Gothic",
                                                        fontSize: 18.sp),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                    20.h,
                                                  ),
                                                  Text(
                                                    "${server.destaddress}",
                                                    style: TextStyle(
                                                        color:
                                                        Color(0xff020744),
                                                        fontFamily:
                                                        "Franklin_Gothic",
                                                        fontSize: 18.sp),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                    20.h,
                                                  ),
                                                  Text(
                                                    "${server.seats}",
                                                    style: TextStyle(
                                                        color:
                                                        Color(0xff020744),
                                                        fontFamily:
                                                        "Franklin_Gothic",
                                                        fontSize: 18.sp),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                    20.h,
                                                  ),
                                                  Text(
                                                    "${server.godate.day}/${server.godate.month}/${server.godate.year}",
                                                    style: TextStyle(
                                                        color:
                                                        Color(0xff020744),
                                                        fontFamily:
                                                        "Franklin_Gothic",
                                                        fontSize: 18.sp),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            );
                          }): Center(child: Text("Data Not Found"));

                    }
                )


          )
        )
        )

    );
  }
}
