


import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lechalo/screens/sendParcel.dart';

import '../api/db.dart';
import '../models/parcelscheduleride_model.dart';

class CreateRequestDitails extends StatefulWidget {
  const CreateRequestDitails({Key? key}) : super(key: key);

  @override
  State<CreateRequestDitails> createState() => _CreateRequestDitailsState();
}

class _CreateRequestDitailsState extends State<CreateRequestDitails> {
  List<MyChoice> choices = [
    MyChoice(index: 0, choice: "me"),
    MyChoice(index: 1, choice: "other"),
  ];

  String def_choice = "me";
  int def_index = 0;
  String _selectedGender = 'male';


  String date = "";
  String? location1;
  String? location2;
  late String llat;
  late String llng;
  late String dlat;
  late String dlmg;
  String tampLocation = "";
  bool from = false;
  bool to = false;
  TextEditingController _from = TextEditingController();
  TextEditingController _to = TextEditingController();
  TextEditingController _parcelname = TextEditingController();
  TextEditingController _parcelvalue = TextEditingController();
  TextEditingController _rname = TextEditingController();
  TextEditingController _rmobilr = TextEditingController();
  TextEditingController _extra = TextEditingController();
  TextEditingController _sname = TextEditingController();
  TextEditingController _smobile = TextEditingController();
  TextEditingController _weight = TextEditingController();
  TextEditingController _length = TextEditingController();
  TextEditingController _width = TextEditingController();
  TextEditingController _height = TextEditingController();
  bool value = false;


  // late String base64image;
  // final picker = ImagePicker();
  // File? image;
  // String? regid;
  // var uplodedimage;


  String _Rvalue1 = "Me";
  String _Rvalue3 = "Me";
  int _Rvalue2 = 2;
  bool _showdata = false;
  String selected = "S";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
      BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
      child: Container(
        height: 800.h,
        width: 400.w,
        child: Padding(
          padding: EdgeInsets.only(top: 9.h),
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
                          width: 100.w,
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
                        height: 90.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                          // image: DecorationImage(
                          //   image: AssetImage(
                          //       "assets/uploadParcel.png"),
                          // ),
                            border: Border.all(
                                color: Colors.grey.shade400),
                            borderRadius:
                            BorderRadius.circular(10.r)),
                        child:
                        // (image != null)
                        //     ? Image.file(
                        //   image!!,
                        //   height: 90.h,
                        //   width: 90.w,
                        //   fit: BoxFit.cover,
                        // )
                             Image.asset("assets/uploadParcel.png"),
                      ),
                      Row(
                        children: [
                          Text("",
                            //tItemName,
                            style: TextStyle(
                                color: Color(0xff020744),
                                fontFamily: "Franklin_Gothic",
                                fontSize: 16.sp),
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
                              Text("",
                                //eItemSize,
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
                              Text("",
                                //tFromLocation,
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
                              Text("",
                                  //tToLocation,
                                  style: TextStyle(
                                      color: Color(0xff020744),
                                      fontFamily: "Franklin_Gothic",
                                      fontSize: 15.sp)),
                              SizedBox(height: 13.h),
                              Text(
                                "Sender Details",
                                style: TextStyle(
                                    color: Color(0xff020744),
                                    fontFamily: "Franklin_Gothic",
                                    fontSize: 16.sp),
                              ),
                              Text("",
                                //vSenderName,
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
                              Text("",
                                //vReceiverName,
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
                              Text("",
                                //vReceiverMobile,
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
                              Text("",
                                //ePickupTime,
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
                              Text("",
                                //tExtraDetails,
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
                              Text("",
                                //dItemWeight,
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
                              Text("",
                                //"$dItemLength*$dItemWidth*$dItemHeight",
                                style: TextStyle(
                                    color: Color(0xff020744),
                                    fontFamily: "Franklin_Gothic",
                                    fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    String LeaveCity = "Gandhidham";
                    String DestCity = "Adipur";
                    String goDate = "2019-11-16";
                    final parcelscheduleride_model data = await parcels_schedule().parcels_schedulelist(LeaveCity, DestCity, goDate);

                    //print(regid);
                    //calculateDistance(llat, llng, dlat, dlmg);
                    // final Sendparcelmodel user = await Sendparcel().sendparcel(
                    //   // "junagadh",
                    //   // "bhanduri",
                    //   // "junagadh",
                    //   // "bhanduri",
                    //   // "70.4579",
                    //   // "21.5222",
                    //   // "70.2810",
                    //   // "21.1072",
                    //     _from.text,
                    //     _to.text,
                    //     _from.text,
                    //     _to.text,
                    //     llat,
                    //     llng,
                    //     dlat,
                    //     dlmg,
                    //     _parcelname.text,
                    //     _parcelvalue.text,
                    //     "0",
                    //     selected,
                    //     _Rvalue1,
                    //     _sname.text,
                    //     _smobile.text,
                    //     _Rvalue3,
                    //     _rname.text,
                    //     _rmobilr.text,
                    //     _Rvalue2.toString(),
                    //     date,
                    //     "0",
                    //     date,
                    //     _weight.text,
                    //     _length.text,
                    //     _width.text,
                    //     _height.text,
                    //     _extra.text,
                    //     base64image,
                    //     regid,
                    //     image!.path);
                    // setState(() {
                    //   print("aaa");
                    //   print(user.status);
                    //   if (user.status != "success") {
                    //     setState(() {
                    //       Fluttertoast.showToast(
                    //         msg: user.msg,
                    //         backgroundColor: Color(0xff060E57),
                    //         textColor: Colors.white,
                    //       );
                    //     });
                    //   } else {
                    //     setState(() {
                    //       Fluttertoast.showToast(
                    //         msg: user.msg,
                    //         backgroundColor: Color(0xff060E57),
                    //         textColor: Colors.white,
                    //       );
                    //       Navigator.of(context).pop();
                    //       Navigator.of(context).pop();
                    //     });
                    //   }
                    // });
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 30.h, bottom: 10.h),
                    alignment: Alignment.center,
                    height: 37.h,
                    width: 155.w,
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
          ]),
        ),
      ),
    )
        ],
      ),
    );
  }
}
