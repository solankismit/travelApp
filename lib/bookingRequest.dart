import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/acceptorrejectbookingrequestmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'models/getbookingrequestbyoffer.dart';
class BookingRequest extends StatefulWidget {


  @override
  _BookingRequestState createState() => _BookingRequestState();
}

class _BookingRequestState extends State<BookingRequest> {

  String? regid;
  String? regbookibgofferid;
  String? requesrid;

  late Future<Getbookingrequestbyoffer?> data;
  String? id;
  String? bookibgofferid;
  Future<String?> getbookingofferPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bookibgofferid = prefs.getString("bookingofferid");
    return bookibgofferid;
  }


  // Future<String?> getNamePreference() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   id = prefs.getString("id");
  //   return id;
  // }


  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    getbookingofferPreference().then((bookingofferid) {
      setState(() {
        regbookibgofferid = bookingofferid;
        print("aaa");
        print(regbookibgofferid);
      });
    });

  }
  String _Rvalue1="1";
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
                  height: 300.h,
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
                          padding:  EdgeInsets.only(left: 20.0.w),
                          child: Row(
                            children: [
                              Radio(
                                activeColor: Colors.black,
                                value:"Cancel my plan",
                                groupValue: _Rvalue1,
                                onChanged: (value)async {
                                setState(() {
                                  _Rvalue1=value.toString() ;
                                });
                                  print("aaaaaaa");
                                  final Acceptorrejectbookingrequestmodel user = await acceptorrejectBookingrequest().acceptorrejectbookingrequest(requesrid,value, "Reject");

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
                              ),
                              Text(
                                "Cancel my plan",
                                style: TextStyle(
                                    fontFamily: "Franklin_Gothic",

                                    fontSize: 19.sp),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: 20.0.w),
                          child: Row(
                            children: [
                              Radio(

                                activeColor: Colors.black,

                                value: "Not able to come",
                                groupValue: _Rvalue1,
                                onChanged: (value)async {
                                  setState(() {
                                    _Rvalue1=value.toString();
                                  });

                                  print("aaaaaaa");
                                  final Acceptorrejectbookingrequestmodel user = await acceptorrejectBookingrequest().acceptorrejectbookingrequest(requesrid,value, "Reject");

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
                              ),
                              Text(
                                "Not able to come",
                                style: TextStyle(
                                    fontFamily: "Franklin_Gothic",

                                    fontSize: 19.sp),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),


                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();

                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 45.h,
                            width: 100.w,
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
                              "Cancel",
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
          "Booking Request",
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
          child: FutureBuilder<Getbookingrequestbyoffer>(future: getBookingrequestbyoffer().getbookingrequestbyoffer(regbookibgofferid),
              builder: (context,snapshot){
                return (snapshot.hasData)?ListView.builder(
                    itemCount: snapshot.data!.detail.length,
                    itemBuilder: (context,index){
                      var server = snapshot.data!.detail[index];
                      return
                  Padding(
                    padding: EdgeInsets.only(right: 15.w, left: 15.w),
                    child: Column(
                        children: [
                          SizedBox(
                            height: 40.h,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                right: 8.0.w, left: 8.0.w, top: 8.0.h),
                            height: 180.h,
                            width: 414.w,
                            decoration: (BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24.r),
                              border: Border.all(color: Colors.grey.shade400),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 3,
                                    offset: Offset(0, 1))
                              ],
                            )),
                            child: Column(

                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(

                                      height:
                                      80.h,
                                      width: 80.w,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image:
                                              AssetImage("assets/profile.png"))),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,

                                      children: [
                                        Text(
                                          server.name,
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 16.sp),
                                        ),
                                        // SizedBox(
                                        //   height: MediaQuery.of(context).size.height*0.023,
                                        // ),
                                        Text(
                                          server.mobile,
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 16.sp),
                                        ),
                                      ],
                                    ),


                                  ],
                                ),

                                Row(
                                  children: [
                                    SizedBox(
                                      width: 60.w,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                    print("aaaaaaa");
                                    final Acceptorrejectbookingrequestmodel user = await acceptorrejectBookingrequest().acceptorrejectbookingrequest(server.bookingrequestid,"", "Accept");

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
                                        height: 40.h,
                                        width: 90.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25.r),
                                          color: Color(0xff060E57),
                                        ),
                                        child: Text(
                                          "Accept",
                                          style: TextStyle(
                                              fontFamily: "Franklin_Gothic",
                                              color: Color(0xffFFFFFF),
                                              fontSize: 16.sp),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        requesrid=server.bookingrequestid;
                                        _showDialog();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 40.h,
                                        width: 90.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25.r),
                                          color: Color(0xffF24646),
                                        ),
                                        child: Text(
                                          "Reject",
                                          style: TextStyle(
                                              fontFamily: "Franklin_Gothic",
                                              color: Color(0xffFFFFFF),
                                              fontSize: 16.sp),
                                        ),
                                      ),
                                    ),


                                  ],
                                )


                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),

                        ]
                    ),
                  );
                }
            ):Center(child: Text("Data Not Found"),);

          }
          ),
      )
      ),
    );
  }
}

