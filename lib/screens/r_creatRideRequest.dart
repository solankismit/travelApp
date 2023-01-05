import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/googleplace/geo_locetor.dart';
import 'package:lechalo/googleplace/placeModel.dart';
import 'package:lechalo/googleplace/place_search.dart';
import 'package:lechalo/googleplace/place_services.dart';
import 'package:lechalo/models/hirevehiclecreaterequestmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RCreateRideRequest extends StatefulWidget {
  String vcity;
  String vtype;

  RCreateRideRequest(this.vcity, this.vtype, {Key? key}) : super(key: key);

  @override
  _RCreateRideRequestState createState() => _RCreateRideRequestState();
}

class _RCreateRideRequestState extends State<RCreateRideRequest> {
  String? regid;

  String? id;
  bool from = false;
  bool to = false;
  String location1 = "";
  String location2 = "";
  GeolocatorService geolocatorService = GeolocatorService();
  late Position currentPosition;
  String? currentAddress;
  late String llat;
  late String llng;
  late String dlat;
  late String dlmg;

  Future<String?> getNamePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("id");
    return id;
  }

  var datepicked;
  var timepicked;
  var singleDayPicker = DateTime.now();
  TextEditingController _pcity = TextEditingController();
  TextEditingController _from = TextEditingController();
  TextEditingController _to = TextEditingController();
  var valueChoose;
  var _timePicker = DateTime.now();
  List listitem = ["car", "rickshaw"];

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
    _pcity.text = widget.vcity;
  }

  @override
  Widget build(BuildContext context) {
    var formatSinglDate = DateFormat('dd-MM-yyyy').format(singleDayPicker);
    var formatDate = DateFormat.Hm().format(_timePicker);
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
          "Create Ride Request",
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
          child: ListView(
              padding: EdgeInsets.only(right: 15.w, left: 15.w),
              children: [
                Form(
                  child: Padding(
                    padding:  EdgeInsets.only(
                        top: 38.h, right: 30.w, left: 30.w, bottom: 10.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Preffered City",
                              style: TextStyle(
                                color: Colors.black,
                                //fontWeight: FontWeight.bold,
                                fontFamily: "Franklin_Gothic",
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          readOnly: true,
                          controller: _pcity,
                          decoration: InputDecoration(
                            hintText: "Enter City",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: "Franklin_Gothic",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "Select Vehicle Type",
                              style: TextStyle(
                                color: Colors.black,
                                // fontWeight: FontWeight.bold,
                                fontFamily: "Franklin_Gothic",
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 3.w),
                              height: 35.h,
                              width: 170.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffFF4A4A)),
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: DropdownButton(
                                underline: Container(),
                                isExpanded: true,
                                hint: Text("Your vehicle type?"),
                                value: valueChoose,
                                onChanged: (newValue) {
                                  setState(() {
                                    valueChoose = newValue.toString();
                                  });
                                },
                                items: listitem.map((valueItem) {
                                  return DropdownMenuItem(
                                      value: valueItem, child: Text(valueItem));
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          width: 300.w,
                          child: TextFormField(
                              controller: _from,
                              decoration: InputDecoration(
                                hintText: "From",
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Franklin_Gothic"),
                                suffixIcon: IconButton(
                                    onPressed: () async {
                                      currentPosition = await geolocatorService
                                          .getInitialLocation();
                                      print(currentPosition.latitude);
                                      print(currentPosition.longitude);

                                      currentAddress = await getAddress(
                                          currentPosition.latitude,
                                          currentPosition.longitude);
                                      print(currentAddress);
                                      _from.text = currentAddress!;
                                      dlat =
                                          currentPosition.latitude.toString();
                                      dlmg =
                                          currentPosition.longitude.toString();
                                    },
                                    icon: Icon(
                                      Icons.location_pin,
                                      color: Colors.black,
                                    )),
                              ),
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
                        ),
                        (_from.text.length > 0 && from == true)
                            ? Container(
                                decoration: BoxDecoration(color: Colors.white),
                                height: 300.h,
                                width: 414.w,
                                child: FutureBuilder<List<PlaceSearch>>(
                                    future: PlacesService()
                                        .getAutoComplate(location1),
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
                        SizedBox(
                          height: 50.h,
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.swap_vert_circle_outlined,
                              color: Colors.black,
                              size: 30,
                            )),
                        Container(
                          width: 300.w,
                          child: TextFormField(
                              controller: _to,
                              decoration: InputDecoration(
                                hintText: "To",
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Franklin_Gothic"),
                                suffixIcon: IconButton(
                                    onPressed: () async {
                                      currentPosition = await geolocatorService
                                          .getInitialLocation();
                                      print(currentPosition.latitude);
                                      print(currentPosition.longitude);

                                      currentAddress = await getAddress(
                                          currentPosition.latitude,
                                          currentPosition.longitude);
                                      print(currentAddress);
                                      _to.text = currentAddress!;
                                      dlat =
                                          currentPosition.latitude.toString();
                                      dlmg =
                                          currentPosition.longitude.toString();
                                    },
                                    icon: Icon(
                                      Icons.location_pin,
                                      color: Colors.black,
                                    )),
                              ),
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
                        ),
                        (_to.text.length > 0 && to == true)
                            ? Container(
                                decoration: BoxDecoration(color: Colors.white),
                                height: 300.h,
                                width: 414.w,
                                child: FutureBuilder<List<PlaceSearch>>(
                                    future: PlacesService()
                                        .getAutoComplate(location2),
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
                        SizedBox(
                          height: 60.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "When are you going ?",
                              style: TextStyle(
                                  color: Color(0xff020744),
                                  fontFamily: "Franklin_Gothic",
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 18.sp),
                            ),
                          ],
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "${formatSinglDate}",
                              hintStyle:
                                  TextStyle(fontFamily: "Franklin_Gothic")),
                          onTap: () {
                            showCupertinoModalPopup(
                                context: context,
                                builder: (context) => Container(
                                      margin:
                                          EdgeInsets.only(right: 7.w, left: 7.w),
                                      height:
                                          100.h,
                                      width: 414.w,
                                      child: CupertinoDatePicker(
                                        minimumDate: DateTime.now(),
                                        backgroundColor: Colors.white,
                                        initialDateTime: DateTime.now(),
                                        onDateTimeChanged: (dateTime) {
                                          setState(() {
                                            singleDayPicker = dateTime;
                                          });
                                          datepicked = DateFormat('dd-MM-yyyy')
                                              .format(singleDayPicker);
                                        },
                                        mode: CupertinoDatePickerMode.date,
                                      ),
                                    ));
                          },
                          readOnly: true,
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Text(
                          "What time will you pick passanger ?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Franklin_Gothic",
                              //color: Color(0xff060E57),
                              fontSize: 16.sp),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                            height: 120.h,
                            width: 200.w,
                            child: CupertinoDatePicker(
                              initialDateTime: DateTime.now(),
                              onDateTimeChanged: (dateTime) {
                                setState(() {
                                  _timePicker = dateTime;
                                });
                                timepicked=DateFormat('hh:mm').format(_timePicker);
                                print(timepicked);
                              },
                              mode: CupertinoDatePickerMode.time,
                            )),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          height: 26.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.r),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xff060E57),
                                    Color(0xff010311)
                                  ])),
                          child: Center(
                            child: Text(
                              "${timepicked}",
                              style: TextStyle(
                                  fontFamily: "Franklin_Gothic",
                                  color: Color(0xffFFFFFF),
                                  fontSize: 18.sp),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            print("aaaaaaa");
                            final Hirevehiclecreaterequestmodel user =
                                await hirevehiclereateRequest()
                                    .hirevehiclecreaterequest(
                                        regid,
                                        // "ahmedabad",
                                        // "bhanduri",
                                        _from.text,
                                        _to.text,
                                        widget.vtype,
                                        widget.vcity,
                                        datepicked.toString(),
                                        timepicked);

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
                            margin: EdgeInsets.only(top: 30.h),
                            alignment: Alignment.center,
                            height: 40.h,
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
                              "Confirm",
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
                ),
              ]),
        ),
      ),
    );
  }

  Future<String> getAddress(latitude, longitude) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    return '${placemarks[0].name},${placemarks[0].street},${placemarks[0].subLocality},${placemarks[0].locality},${placemarks[0].administrativeArea},${placemarks[0].postalCode},${placemarks[0].country}';
  }
}
