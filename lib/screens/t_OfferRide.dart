import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:lechalo/googleplace/geo_locetor.dart';
import 'package:lechalo/googleplace/placeModel.dart';
import 'package:lechalo/googleplace/place_search.dart';
import 'package:lechalo/googleplace/place_services.dart';
import 'package:lechalo/screens/AVrouteDeails.dart';
import 'package:lechalo/screens/t_RootDetails.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TOfferRide extends StatefulWidget {
  String iVehicleID;

  TOfferRide(this.iVehicleID, {Key? key}) : super(key: key);

  @override
  _TOfferRideState createState() => _TOfferRideState();
}

class _TOfferRideState extends State<TOfferRide> {
  GeolocatorService geolocatorService = GeolocatorService();
  String? currentAddress;
  late Position currentPosition;
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
  TextEditingController _price = TextEditingController();
  bool value = false;
  int selected = 1;

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
          "Offer Ride",
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
            padding: EdgeInsets.only(top: 40.h),
            child: ListView(
                padding: EdgeInsets.only(right: 40.w, left: 40.w),
                children: [
                  Form(
                    child: Column(
                      children: [
                        Container(
                          height: 110.h,
                          width: 110.w,
                          decoration: BoxDecoration(
                              //color: Colors.red,
                              image: DecorationImage(
                                  image: AssetImage("assets/map.png"))),
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        TextFormField(
                            controller: _from,
                            decoration: InputDecoration(
                                hintText: "Select Leaving Location",
                                hintStyle: TextStyle(
                                    color: Colors.blueGrey,
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
                                    ))),
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
                                height: 300.h,
                                width: MediaQuery.of(context).size.width,
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
                                hintText: "Select Destination",
                                hintStyle: TextStyle(
                                    color: Colors.blueGrey,
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
                                    ))),
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
                                width: MediaQuery.of(context).size.width,
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
                        SizedBox(
                          height: 40.h,
                        ),
                        topnavigation(),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextFormField(
                          controller: _price,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Offer Price",
                            hintStyle: TextStyle(
                                color: Colors.blueGrey,
                                fontFamily: "Franklin_Gothic"),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Checkbox(
                                value: value,
                                onChanged: (value) {
                                  setState(() {
                                    this.value = value!;
                                  });
                                },
                              ),
                            ),
                            Container(
                              width: 190.w,
                              child: Text(
                                "I have read and agree to the Terms & Conditions",
                                style: TextStyle(
                                  fontFamily: "Franklin_Gothic",
                                  color: Colors.grey.shade700,
                                  fontSize: 15.sp,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            if (value == true) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => TRouteDetails(
                                      widget.iVehicleID,
                                      // "70.4579",
                                      // "21.5222",
                                      // "70.2810",
                                      // "21.1072",
                                      // "junagadh",
                                      // "bhanduri",
                                      llng.toString(),
                                      llat.toString(),
                                      dlmg.toString(),
                                      dlat.toString(),
                                      _from.text,
                                      _to.text,
                                      selected.toString(),
                                      _price.text)));
                            } else {
                              setState(() {
                                Fluttertoast.showToast(
                                  msg:
                                      "Please read the 'Termd & Conditions' first ",
                                  backgroundColor: Color(0xff060E57),
                                  textColor: Colors.white,
                                );
                              });
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 30.h),
                            alignment: Alignment.center,
                            height: 34.h,
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
                              "Continue",
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
                ]),
          ),
        ),
      ),
    );
  }

  topnavigation() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildOption("Price / Ton", 0),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width*0.05,
            // ),
            buildOption("Price / Km", 1),
          ],
        ),
        SizedBox(
          height: 50.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildOption("Price / Trip", 2),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width*0.05,
            // ),
            buildOption("Free", 3),
          ],
        ),
      ],
    );
  }

  buildOption(String text, int index) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              selected = index;
              print(selected);
            });
          },
          child: Container(
            height: 40.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 5, offset: Offset(0, 0)),
              ],
              border: Border.all(
                color: (selected == index) ? Colors.red : Colors.grey,
                width: 1,
              ),
            ),
            child: Center(
              child: Text(
                "${text}",
                style: TextStyle(
                    fontFamily: "Franklin_Gothic",
                    color: Color(0xff060E57),
                    fontSize: 14.sp),
              ),
            ),
          ),
        )
      ],
    );
  }
}

Future<String> getAddress(latitude, longitude) async {
  List<Placemark> placemarks =
      await placemarkFromCoordinates(latitude, longitude);
  return '${placemarks[0].name},${placemarks[0].street},${placemarks[0].subLocality},${placemarks[0].locality},${placemarks[0].administrativeArea},${placemarks[0].postalCode},${placemarks[0].country}';
}
