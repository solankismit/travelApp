import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/googleplace/placeModel.dart';
import 'package:lechalo/googleplace/place_search.dart';
import 'package:lechalo/googleplace/place_services.dart';
import 'package:lechalo/models/sendparcelmodel.dart';
import 'package:lechalo/screens/allParcelRequestList.dart';
import 'package:lechalo/screens/myParcelRequest.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/getProfile.dart';

class SendParcel extends StatefulWidget {
  @override
  _SendParcelState createState() => _SendParcelState();
}

class MyChoice {
  String choice;
  int index;
  MyChoice({required this.index, required this.choice});
}

class _SendParcelState extends State<SendParcel> {
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
   String? llat;
   String? llng;
   String? dlat;
   String? dlmg;
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

  late String base64image;
  final picker = ImagePicker();
  File? image;
  String? regid;
  var uplodedimage;

  // Future<void> pickImage() async {
  //   final _image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //
  //   final imageTemporary = File(_image!.path);
  //   setState(() {
  //     this.image = imageTemporary;
  //     base64image = base64Encode(image!.readAsBytesSync());
  //     print(image!.path);
  //   });
  // }
  // Future<void> pickImage2() async {
  //   final _image = await ImagePicker().pickImage(source: ImageSource.camera);
  //
  //   final imageTemporary = File(_image!.path);
  //   setState(() {
  //     this.image = imageTemporary;
  //     base64image = base64Encode(image!.readAsBytesSync());
  //     print(image!.path);
  //   });
  // }
  _showDialog2() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Container(
                  height: 250.h,
                  width: 300.w,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 30.w),
                            child: Text(
                              "Upload Parcel Picture",
                              style: TextStyle(
                                  fontFamily: "Franklin_Gothic",
                                  fontSize: 20.sp),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.close,
                                color: Colors.black,
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              pickImage();
                              Navigator.of(context).pop();
                            },
                            child: Padding(
                              padding: EdgeInsets.only(),
                              child: Column(
                                children: [
                                  Container(
                                    height: 100.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/gallery.png"))),
                                  ),
                                  Text(
                                    "Gallery",
                                    style: TextStyle(
                                        fontFamily: "Franklin_Gothic",
                                        fontSize: 18.sp),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              camImage();
                              Navigator.of(context).pop();
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 100.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              AssetImage("assets/camera.png"))),
                                ),
                                Text(
                                  "Camera",
                                  style: TextStyle(
                                      fontFamily: "Franklin_Gothic",
                                      fontSize: 18.sp),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  // title: Text("Upload Profile Picture",style: TextStyle(
                  //   fontFamily: "Franklin_Gothic"
                  // ),),
                  //   actions: [
                  //
                  //   ],
                  // )
                  //
                )),
          );
        });
  }

  String _Rvalue1 = "Me";
  String _Rvalue3 = "Me";
  int _Rvalue2 = 2;
  bool _showdata = false;
  String selected = "S";

  _showDialog(
      tFromLocation,
      tToLocation,
      vFromCity,
      vToCity,
      dFromLocationLat,
      dFromLocationLong,
      dToLocationLat,
      dToLocationLong,
      tItemName,
      dItemValue,
      dItemWeight,
      eItemSize,
      eWhoWillMeetDriverAtPickupLocation,
      vSenderName,
      vSenderMobile,
      eWhoWillMeetDriverAtDeliveryLocation,
      vReceiverName,
      vReceiverMobile,
      ePickupTime,
      ePickupDateTime,
      eRecieveTime,
      eReceiveDateTime,
      tItemDimention,
      dItemLength,
      dItemWidth,
      dItemHeight,
      tExtraDetails,
      vItemPhoto,
      iSenderID) {
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
                  height: 750.h,
                  width: 320.w,
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
                                  child: (image != null)
                                      ? Image.file(
                                          image!,
                                          height: 90.h,
                                          width: 90.w,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.asset("assets/uploadParcel.png"),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      tItemName,
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
                                        Text(
                                          eItemSize,
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
                                          tFromLocation,
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
                                        Text(tToLocation,
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
                                        Text(
                                          vSenderName,
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
                                          vReceiverName,
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
                                          vReceiverMobile,
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
                                          ePickupTime,
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
                                          tExtraDetails,
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
                                          dItemWeight,
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
                                          "$dItemLength*$dItemWidth*$dItemHeight",
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
                              print(regid.toString() + ">>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                              //calculateDistance(llat, llng, dlat, dlmg);
                              final Sendparcelmodel user = await Sendparcel().sendparcel(
                                      // "junagadh",
                                      // "bhanduri",
                                      // "junagadh",
                                      // "bhanduri",
                                      // "70.4579",
                                      // "21.5222",
                                      // "70.2810",
                                      // "21.1072",
                                      _from.text,
                                      _to.text,
                                      _from.text,
                                      _to.text,
                                      llat,
                                      llng,
                                      dlat,
                                      dlmg,
                                      _parcelname.text,
                                      _parcelvalue.text,
                                      "0",
                                      selected,
                                      _Rvalue1,
                                      _sname.text,
                                      _smobile.text,
                                      _Rvalue3,
                                      _rname.text,
                                      _rmobilr.text,
                                      _Rvalue2.toString(),
                                      date,
                                      "0",
                                      date,
                                      _weight.text,
                                      _length.text,
                                      _width.text,
                                      _height.text,
                                      _extra.text,
                                      base64image,
                                      regid,
                                      image!.path);
                              setState(() {
                                print("aaa");
                                print(user.status + "??????????????????");
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
                                    Navigator.of(context).pop();
                                  });
                                }
                              });
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
                )),
          );
        });
  }

  String? id;

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    print("aa");
    print(12742 * asin(sqrt(a)));
    return 12742 * asin(sqrt(a));
  }

  Future<String?> getNamePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("id");
    print(value);
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
          "Send Parcel",
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
          child: ListView(
              padding: EdgeInsets.only(right: 40.w, left: 40.w),
              children: [
                Form(
                  child: Padding(
                    padding: EdgeInsets.only(top: 12.0.h),
                    child: Column(
                      children: [
                        TextFormField(
                            controller: _from,
                            decoration: InputDecoration(
                                hintText: "From",
                                hintStyle: TextStyle(
                                    color: Colors.blueGrey,
                                    fontFamily: "Franklin_Gothic"),
                                suffixIcon: Icon(
                                  Icons.location_pin,
                                  color: Colors.black,
                                )),
                            onFieldSubmitted: (value) {
                              from = false;
                            },
                            onTap: () {
                              from = true;
                              to = false;
                            },
                            onChanged: (value) {
                              setState(() {
                                location1 = value;
                              });

                              //   PlacesService().getAutoComplate(value);
                              // print(PlacesService().getAutoComplate(value).toString().length);
                            }),
                        (_from.text.length > 0 && from == true)
                            ? Container(
                                decoration: BoxDecoration(color: Colors.white),
                                height: 810.h,
                                width: 414.w,
                                child: FutureBuilder<List<PlaceSearch>>(
                                    future: PlacesService()
                                        .getAutoComplate(location1!),
                                    builder: (context, snapshots) {
                                      return (snapshots.hasData)
                                          ? ListView.builder(
                                              itemCount: snapshots.data!.length,
                                              itemBuilder: (context, index) {
                                                var server =
                                                    snapshots.data![index];

                                                return (snapshots.hasData)
                                                    ? ListTile(
                                                        onTap: () async {
                                                          final Place user2 =
                                                              await PlacesService()
                                                                  .getlatlong(server
                                                                      .placeId);
                                                          this.llat = user2
                                                              .geometry
                                                              .location
                                                              .lat
                                                              .toString();
                                                          this.llng = user2
                                                              .geometry
                                                              .location
                                                              .lng
                                                              .toString();

                                                          setState(() {
                                                            List<String>
                                                                result = server
                                                                    .description
                                                                    .split(',');
                                                            _from.text =
                                                                result[0];
                                                            print(server
                                                                .description);
                                                          });
                                                          from = false;
                                                        },
                                                        title: Text(
                                                            server.description),
                                                      )
                                                    : CircularProgressIndicator();
                                              })
                                          : Center(
                                              child:
                                                  CircularProgressIndicator());
                                    }),
                              )
                            : Container(),
                        TextFormField(
                            controller: _to,
                            decoration: InputDecoration(
                                hintText: "To",
                                hintStyle: TextStyle(
                                    color: Colors.blueGrey,
                                    fontFamily: "Franklin_Gothic"),
                                suffixIcon: Icon(
                                  Icons.location_pin,
                                  color: Colors.black,
                                )),
                            onFieldSubmitted: (value) {
                              to = false;
                            },
                            onTap: () {
                              to = true;
                              from = false;
                            },
                            onChanged: (value) {
                              setState(() {
                                location2 = value;
                              });

                              //   PlacesService().getAutoComplate(value);
                              // print(PlacesService().getAutoComplate(value).toString().length);
                            }),
                        (_to.text.length > 0 && to == true)
                            ? Container(
                                decoration: BoxDecoration(color: Colors.white),
                                height: 300.h,
                                width: 414.w,
                                child: FutureBuilder<List<PlaceSearch>>(
                                    future: PlacesService()
                                        .getAutoComplate(location2!),
                                    builder: (context, snapshots) {
                                      return (snapshots.hasData)
                                          ? ListView.builder(
                                              itemCount: snapshots.data!.length,
                                              itemBuilder: (context, index) {
                                                var server =
                                                    snapshots.data![index];

                                                return (snapshots.hasData)
                                                    ? ListTile(
                                                        onTap: () async {
                                                          print(server.placeId);

                                                          final Place user1 =
                                                              await PlacesService()
                                                                  .getlatlong(server
                                                                      .placeId);
                                                          this.dlat = user1
                                                              .geometry
                                                              .location
                                                              .lat
                                                              .toString();
                                                          this.dlmg = user1
                                                              .geometry
                                                              .location
                                                              .lng
                                                              .toString();

                                                          setState(() {
                                                            List<String> res =
                                                                server
                                                                    .description
                                                                    .split(',');
                                                            _to.text = res[0];
                                                          });
                                                          to = false;
                                                        },
                                                        title: Text(
                                                            server.description),
                                                      )
                                                    : CircularProgressIndicator();
                                              })
                                          : Center(
                                              child:
                                                  CircularProgressIndicator());
                                    }),
                              )
                            : Container(),
                        Container(
                          child: FutureBuilder<Getprofile?>(
                              future: getProfile().getprofile(regid),
                              builder: (context, snapshots) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: 50.h,
                                    ),
                                    Row(
                                      children: [
                                        Text("Enter parcel name",
                                            style: TextStyle(
                                              color: Colors.black,
                                              // fontWeight: FontWeight.bold,
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 16.sp,
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    TextFormField(
                                      controller: _parcelname,
                                      decoration: InputDecoration(
                                        hintText: "Parcel name",
                                        hintStyle: TextStyle(

                                            // fontWeight: FontWeight.bold,
                                            fontFamily: "Franklin_Gothic"),
                                      ),
                                      onChanged: (data) {},
                                    ),
                                    SizedBox(
                                      height: 50.h,
                                    ),
                                    Row(
                                      children: [
                                        Text("Enter parcel value",
                                            style: TextStyle(
                                              color: Colors.black,
                                              //fontWeight: FontWeight.bold,
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 16.sp,
                                            )),
                                        SizedBox(
                                          width: 7.w,
                                        ),
                                        Container(
                                            height: 17.h,
                                            width: 17.w,
                                            child: Image.asset(
                                                "assets/money.png")),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    TextFormField(
                                      controller: _parcelvalue,
                                      decoration: InputDecoration(
                                        hintText: "Parcel value",
                                        hintStyle: TextStyle(
                                            // fontWeight: FontWeight.bold,
                                            fontFamily: "Franklin_Gothic"),
                                      ),
                                      onChanged: (data) {},
                                      keyboardType: TextInputType.number,
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    Row(
                                      children: [
                                        Text("Define size",
                                            style: TextStyle(
                                              color: Colors.black,
                                              //fontWeight: FontWeight.bold,
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 16.sp,
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        buildOption("assets/layer.jpeg", "S"),
                                        buildOption(
                                            "assets/autoRickshaw.png", "M"),
                                        buildOption("assets/cab2.png", "L"),
                                        buildOption(
                                            "assets/deliveryTruck.png", "XL"),
                                        buildOption(
                                            "assets/moverTruck.png", "XXL"),
                                        buildOption("assets/logisticsTruck.png",
                                            "XXXL"),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    Row(
                                      children: [
                                        Text("Upload picture of your parcel",
                                            style: TextStyle(
                                              color: Colors.black,
                                              // fontWeight: FontWeight.bold,
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 16.sp,
                                            )),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _showDialog2();
                                        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FRRouteDetails()));
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 180.h,
                                        width: 100.w,

                                        // decoration: BoxDecoration(
                                        //   image: DecorationImage(
                                        //     image: AssetImage("assets/uploadParcel.png")
                                        //   )
                                        // ),
                                        child: (image != null)
                                            ? Image.file(
                                                image!,
                                                height: 100.h,
                                                width: 100.w,
                                                fit: BoxFit.cover,
                                              )
                                            : Image.asset(
                                                "assets/uploadParcel.png"),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text("Sender Details",
                                            style: TextStyle(
                                              color: Colors.black,
                                              // fontWeight: FontWeight.bold,
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 16.sp,
                                            )),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                          activeColor: Color(0xff292DA1),
                                          value: "Me",
                                          groupValue: _Rvalue1,
                                          onChanged: (value) {
                                            setState(() {
                                              _Rvalue1 = value.toString();
                                              print("------------------------------------");
                                              print(value);
                                              print("------------------------------------");
                                              Container(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      // controller: _sname,
                                                        child: Text(snapshots.data!.detail!.name.toString())
                                                    ),
                                                    Container(
                                                      //   controller: _smobile,
                                                        child: Text(snapshots.data!.detail!.mobile.toString())
                                                    ),
                                                  ],
                                                ),

                                              );
                                            });
                                          },
                                        ),
                                        Text(
                                          "My self",
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              // fontWeight: FontWeight.bold,
                                              fontSize: 16.sp),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                          activeColor: Color(0xff292DA1),
                                          value: "Other",
                                          groupValue: _Rvalue1,
                                          onChanged: (value) {
                                            setState(() {
                                              _Rvalue1 = value.toString();
                                              print("------------------------------------");
                                              print(value);
                                              print("------------------------------------");
                                              Container(
                                                child: Column(
                                                  children: [
                                                    TextFormField(
                                                      controller: _sname,
                                                      decoration: InputDecoration(
                                                        hintText: "Sender name",
                                                        hintStyle: TextStyle(

                                                          //fontWeight: FontWeight.bold,
                                                            fontFamily: "Franklin_Gothic"),
                                                      ),
                                                      onChanged: (data) {},
                                                    ),
                                                    TextFormField(
                                                      controller: _smobile,
                                                      decoration: InputDecoration(
                                                        hintText: "Sender mobile number",
                                                        hintStyle: TextStyle(
                                                          // fontWeight: FontWeight.bold,
                                                            fontFamily: "Franklin_Gothic"),
                                                      ),
                                                      keyboardType: TextInputType.number,
                                                      onChanged: (data) {},
                                                    ),
                                                  ],
                                                ),
                                              );

                                            });
                                          },
                                        ),
                                        Text(
                                          "Someone else on behalf of me",
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              // fontWeight: FontWeight.bold,
                                              fontSize: 16.sp),
                                        ),
                                      ],
                                    ),

                                   // if (value == "Me")  else


                                    Stack(
                                      children: [
                                        Container(
                                          child: Row(
                                            children: choices
                                                .map((data) => Expanded(
                                                      child: RadioListTile(
                                                        title: Text(
                                                          '${data.choice}',
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: Colors.blue),
                                                        ),
                                                        groupValue: def_index,
                                                        value: data.index,
                                                        onChanged: (value) {
                                                          print(def_choice +
                                                              "------------=========---------=-=-=-==");
                                                          setState(() {
                                                            def_choice =
                                                                data.choice;
                                                            def_index =
                                                                data.index;
                                                            switch (def_index) {
                                                              case 0:
                                                                print(def_index
                                                                        .toString() +
                                                                    "]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]");
                                                                Container(
                                                                  color: Colors.blueGrey,
                                                                  height: 100,
                                                                  child: Column(
                                                                    children: [
                                                                      Container(
                                                                          // controller: _sname,
                                                                          child: Text("jsjjs")),
                                                                      Container(
                                                                          //   controller: _smobile,
                                                                          child: Text("sdds")),
                                                                    ],
                                                                  ),
                                                                );
                                                                break;
                                                              case 1:

                                                                print(def_index
                                                                    .toString() +
                                                                    ""
                                                                        "");
                                                                Container(
                                                                  color: Colors.blueGrey,
                                                                  height: 100,
                                                                  child: Column(
                                                                    children: [
                                                                      TextFormField(
                                                                        controller:
                                                                            _sname,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          hintText:
                                                                              "Sender name",
                                                                          hintStyle: TextStyle(

                                                                              //fontWeight: FontWeight.bold,
                                                                              fontFamily: "Franklin_Gothic"),
                                                                        ),
                                                                        onChanged:
                                                                            (data) {},
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            _smobile,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          hintText:
                                                                              "Sender mobile number",
                                                                          hintStyle: TextStyle(
                                                                              // fontWeight: FontWeight.bold,
                                                                              fontFamily: "Franklin_Gothic"),
                                                                        ),
                                                                        keyboardType:
                                                                            TextInputType
                                                                                .number,
                                                                        onChanged:
                                                                            (data) {},
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                            }
                                                          });
                                                        },
                                                      ),
                                                    ))
                                                .toList(),
                                          ),
                                        ),
                                      ],
                                    ),


                                    ListTile(
                                      leading: Radio<String>(
                                        value: 'male',
                                        groupValue: _selectedGender,
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedGender = value!;
                                          });
                                        },
                                      ),
                                      title: const Text('Male'),
                                    ),
                                    ListTile(
                                      leading: Radio<String>(
                                        value: 'female',
                                        groupValue: _selectedGender,
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedGender = value!;
                                          });
                                        },
                                      ),
                                      title: const Text('Female'),
                                    ),
                                    const SizedBox(height: 25),
                                   // TextFormField(_selectedGender == 'male' ? 'Hello gentlement!' : 'Hi lady!'),

                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    Row(
                                      children: [
                                        Text("Receiver Details",
                                            style: TextStyle(
                                              color: Colors.black,
                                              // fontWeight: FontWeight.bold,
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 16.sp,
                                            )),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                          activeColor: Color(0xff292DA1),
                                          value: "Me",
                                          groupValue: _Rvalue3,
                                          onChanged: (value) {
                                            setState(() {
                                              _Rvalue3 = value.toString();
                                            });
                                          },
                                        ),
                                        Text(
                                          "My self",
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              // fontWeight: FontWeight.bold,
                                              fontSize: 16.sp),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                          activeColor: Color(0xff292DA1),
                                          value: "Other",
                                          groupValue: _Rvalue3,
                                          onChanged: (value) {
                                            setState(() {
                                              _Rvalue3 = value.toString();
                                            });
                                          },
                                        ),
                                        Text(
                                          "Someone else on behalf of me",
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              // fontWeight: FontWeight.bold,
                                              fontSize: 16.sp),
                                        ),
                                      ],
                                    ),
                                    TextFormField(
                                      controller: _rname,
                                      decoration: InputDecoration(
                                        hintText: "Receiver name",
                                        hintStyle: TextStyle(

                                            //fontWeight: FontWeight.bold,
                                            fontFamily: "Franklin_Gothic"),
                                      ),
                                      onChanged: (data) {},
                                    ),
                                    TextFormField(
                                      controller: _rmobilr,
                                      decoration: InputDecoration(
                                        hintText: "Receiver mobile number",
                                        hintStyle: TextStyle(

                                            // fontWeight: FontWeight.bold,
                                            fontFamily: "Franklin_Gothic"),
                                      ),
                                      keyboardType: TextInputType.number,
                                      onChanged: (data) {},
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    Row(
                                      children: [
                                        Text("Pickup time ?",
                                            style: TextStyle(
                                              color: Colors.black,
                                              //fontWeight: FontWeight.bold,
                                              fontFamily: "Franklin_Gothic",
                                              fontSize: 16.sp,
                                            )),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                          activeColor: Color(0xff292DA1),
                                          value: 0,
                                          groupValue: _Rvalue2,
                                          onChanged: (value) {
                                            setState(() {
                                              _Rvalue2 = value as int;
                                            });
                                          },
                                        ),
                                        Text(
                                          "Immediate (within 45 minutes)",
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              //fontWeight: FontWeight.bold,
                                              fontSize: 16.sp),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                          activeColor: Color(0xff292DA1),
                                          value: 1,
                                          groupValue: _Rvalue2,
                                          onChanged: (value) {
                                            setState(() {
                                              _Rvalue2 = value as int;
                                            });
                                          },
                                        ),
                                        Text(
                                          "Within 1 Day",
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              // fontWeight: FontWeight.bold,
                                              fontSize: 16.sp),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                          activeColor: Color(0xff292DA1),
                                          value: 2,
                                          groupValue: _Rvalue2,
                                          onChanged: (value) {
                                            setState(() {
                                              _Rvalue2 = value as int;
                                            });
                                          },
                                        ),
                                        Text(
                                          "Within 1 Week",
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              //fontWeight: FontWeight.bold,
                                              fontSize: 16.sp),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                          activeColor: Color(0xff292DA1),
                                          value: 3,
                                          groupValue: _Rvalue2,
                                          onChanged: (value) {
                                            setState(() {
                                              _Rvalue2 = value as int;
                                            });
                                            showCupertinoModalPopup(
                                                context: context,
                                                builder: (context) => Container(
                                                      margin: EdgeInsets.only(
                                                          right: 7.w,
                                                          left: 7.w),
                                                      height: 300.h,
                                                      width: 414.w,
                                                      child:
                                                          CupertinoDatePicker(
                                                        backgroundColor:
                                                            Colors.white,
                                                        initialDateTime:
                                                            DateTime.now(),
                                                        onDateTimeChanged:
                                                            (dateTime) {
                                                          setState(() {
                                                            dateTime;
                                                            date = dateTime
                                                                .toString();
                                                            print(dateTime);
                                                          });
                                                        },
                                                        mode:
                                                            CupertinoDatePickerMode
                                                                .date,
                                                      ),
                                                    ));
                                          },
                                        ),
                                        Text(
                                          "Select Date and Time",
                                          style: TextStyle(
                                              color: Color(0xff020744),
                                              fontFamily: "Franklin_Gothic",
                                              // fontWeight: FontWeight.bold,
                                              fontSize: 16.sp),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    Row(
                                      children: [
                                        Text("Extra Details",
                                            style: TextStyle(
                                                color: Colors.black,
                                                // fontWeight: FontWeight.bold,
                                                fontFamily: "Franklin_Gothic",
                                                fontSize: 16.sp)),
                                      ],
                                    ),
                                    TextFormField(
                                      controller: _extra,
                                      decoration: InputDecoration(
                                        hintText:
                                            "Flammable or handle with care etc",
                                        hintStyle: TextStyle(

                                            //  fontWeight: FontWeight.bold,
                                            fontFamily: "Franklin_Gothic"),
                                      ),
                                      onChanged: (data) {},
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _showdata = !_showdata;
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(top: 30.h),
                                        alignment: Alignment.center,
                                        height: 40.h,
                                        width: 250.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Color(0xffBF0000))),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              _showdata
                                                  ? "Hide Details (Optional)"
                                                  : "Add more Details (Optional)  ",
                                              style: TextStyle(
                                                  fontFamily: "Franklin_Gothic",
                                                  fontSize: 16.sp),
                                            ),
                                            Icon(
                                              _showdata
                                                  ? Icons.arrow_drop_down
                                                  : Icons.arrow_drop_up,
                                              color: Color(0xff020744),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    _showdata
                                        ? Container(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 40.h,
                                                ),
                                                Row(
                                                  children: [
                                                    Text("Gross weight",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            //fontWeight: FontWeight.bold,
                                                            fontFamily:
                                                                "Franklin_Gothic",
                                                            fontSize: 16.sp)),
                                                  ],
                                                ),
                                                TextFormField(
                                                  controller: _weight,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        "Total weight (Kg)",
                                                    hintStyle: TextStyle(
                                                      // fontWeight: FontWeight.bold,
                                                      fontFamily:
                                                          "Franklin_Gothic",
                                                    ),
                                                  ),
                                                  onChanged: (data) {},
                                                  keyboardType:
                                                      TextInputType.number,
                                                ),
                                                SizedBox(
                                                  height: 40.h,
                                                ),
                                                Row(
                                                  children: [
                                                    Text("Dimension (Inch)",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            //fontWeight: FontWeight.bold,
                                                            fontFamily:
                                                                "Franklin_Gothic",
                                                            fontSize: 16.sp)),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 60.w,
                                                      child: TextFormField(
                                                        controller: _length,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: "Length",
                                                          hintStyle: TextStyle(

                                                              // fontWeight: FontWeight.bold,
                                                              fontFamily:
                                                                  "Franklin_Gothic"),
                                                        ),
                                                        onChanged: (data) {},
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 20.h,
                                                    ),
                                                    Container(
                                                      width: 60.w,
                                                      child: TextFormField(
                                                        controller: _width,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: "Width",
                                                          hintStyle: TextStyle(

                                                              // fontWeight: FontWeight.bold,
                                                              fontFamily:
                                                                  "Franklin_Gothic"),
                                                        ),
                                                        onChanged: (data) {},
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 20.w,
                                                    ),
                                                    Container(
                                                      width: 60.w,
                                                      child: TextFormField(
                                                        controller: _height,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: "Height",
                                                          hintStyle: TextStyle(

                                                              //fontWeight: FontWeight.bold,
                                                              fontFamily:
                                                                  "Franklin_Gothic"),
                                                        ),
                                                        onChanged: (data) {},
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        : Container(
                                            height: 0.h,
                                            width: 0.w,
                                          ),
                                    // Container(
                                    //
                                    // )

                                    InkWell(
                                      onTap: () {
                                        print(regid);
                                        //calculateDistance(llat, llng, dlat, dlmg);
                                        _showDialog(
                                            "junagadh",
                                            "bhanduri",
                                            "junagadh",
                                            "bhanduri",
                                            "70.4579",
                                            "21.5222",
                                            "70.2810",
                                            "21.1072",
                                            // _from.text,
                                            // _to.text,
                                            // _from.text,
                                            // _to.text,
                                            // llat,
                                            // llng,
                                            // dlat,
                                            // dlmg,
                                            _parcelname.text,
                                            _parcelvalue.text,
                                            "0",
                                            selected,
                                            _Rvalue1,
                                            _sname.text,
                                            _smobile.text,
                                            _Rvalue3,
                                            _rname.text,
                                            _rmobilr.text,
                                            _Rvalue2.toString(),
                                            date,
                                            "0",
                                            date,
                                            _weight.text,
                                            _length.text,
                                            _width.text,
                                            _height.text,
                                            _extra.text,
                                            image.toString(),
                                            regid);
// final Sendparcelmodel user = await Sendparcel().sendparcel(_from.text, _to.text, _from.text, _to.text, llat, llng, dlat,dlmg,_parcelname.text,_parcelvalue.text, "0", selected, _Rvalue1,_sname.text, _smobile.text, _Rvalue3, _rname.text, _rmobilr.text, _Rvalue2.toString(), date, "0", date, _weight.text, _length.text,_width.text,_height.text, _extra.text, image.toString(),regid);
// setState(() async {
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
//
//     setState(() {
//       Fluttertoast.showToast(
//         msg: user.msg,
//         backgroundColor: Color(0xff060E57),
//         textColor: Colors.white,
//       );
//       Navigator.of(context).pop();
//
//     });
//   }
// });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: 50.h, bottom: 10.h),
                                        alignment: Alignment.center,
                                        height: 35.h,
                                        width: 170.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25.r),
                                            gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(0xff060E57),
                                                  Color(0xff010311)
                                                ])),
                                        child: Text(
                                          "View Summary",
                                          style: TextStyle(
                                              fontFamily: "Franklin_Gothic",
                                              color: Color(0xffFFFFFF),
                                              fontSize: 20.sp),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  buildOption(String image, String index) {
    return InkWell(
      onTap: () {
        setState(() {
          selected = index;
          print(selected);
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width * 0.1,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("${image}")),
            border: Border(
                bottom: BorderSide(
              color: (selected == index) ? Colors.red : Colors.transparent,
              width: 2,
            ))),
      ),
    );
  }

  Future<void> pickImage() async {
    final _image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      this.image = File(_image!.path);
      base64image = base64Encode(image!.readAsBytesSync());
      print(image!.path);
    });
  }

  Future<void> camImage() async {
    final _image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      this.image = File(_image!.path);
      base64image = base64Encode(image!.readAsBytesSync());
      print(image!.path);
    });
  }
}
