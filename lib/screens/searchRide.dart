import 'dart:math' show cos, sqrt, asin;
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:lechalo/googleplace/place_search.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:lechalo/googleplace/geo_locetor.dart';
import 'package:lechalo/googleplace/placeModel.dart';

import 'package:lechalo/googleplace/place_search.dart';
import 'package:lechalo/googleplace/place_services.dart';
import 'package:lechalo/screens/FRrouteDetails.dart';

class SearchRide extends StatefulWidget {
  String type;

  SearchRide(this.type, {Key? key}) : super(key: key);

  @override
  _SearchRideState createState() => _SearchRideState();
}

class _SearchRideState extends State<SearchRide> {
  String? currentAddress;
  GeolocatorService geolocatorService = GeolocatorService();
  late Position currentPosition;
  String location1="";
  String location2="";
  late String llat;
  late String llng;
  late String dlat;
  late String dlmg;
  String tampLocation = "";
  bool from = false;
  bool to = false;
  TextEditingController _from = TextEditingController();
  TextEditingController _to = TextEditingController();
  var searchtext;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.type);
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
          "Search",
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
          margin: EdgeInsets.only(right: 7, left: 7),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40)),
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: ListView(
                padding: EdgeInsets.only(right: 40, left: 40),
                children: [
                  Form(
                    child: StreamBuilder<Object>(
                        stream: null,
                        builder: (context, snapshot) {
                          return Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height,
                                    width: double.infinity,
                                  ),
                                  Positioned(
                                    left: MediaQuery.of(context).size.width *
                                        0.23,
                                    child: Container(
                                      height:
                                      MediaQuery.of(context).size.height *
                                          0.14,
                                      width: MediaQuery.of(context).size.width *
                                          0.27,
                                      decoration: BoxDecoration(
                                        //color: Colors.red,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/search ride.png"))),
                                    ),
                                  ),
                                  Positioned(
                                    top: 150,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          .8,
                                      child: TextFormField(
                                          controller: _from,
                                          decoration: InputDecoration(
                                              hintText: "From",
                                              hintStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily:
                                                  "Franklin_Gothic"),
                                              suffixIcon: IconButton(
                                                  onPressed: () async {
                                                    currentPosition =
                                                    await geolocatorService
                                                        .getInitialLocation();
                                                    print(currentPosition
                                                        .latitude);
                                                    print(currentPosition
                                                        .longitude);

                                                    currentAddress =
                                                    await getAddress(
                                                        currentPosition
                                                            .latitude,
                                                        currentPosition
                                                            .longitude);
                                                    print(currentAddress);
                                                    _from.text =
                                                    currentAddress!;
                                                    llat = currentPosition
                                                        .latitude
                                                        .toString();
                                                    llng = currentPosition
                                                        .longitude
                                                        .toString();
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
                                    ),
                                  ),
                                  Positioned(
                                    top: 240,
                                    left:
                                    MediaQuery.of(context).size.width * 0.3,
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {});
                                        },
                                        icon: Icon(
                                          Icons.swap_vert_circle_outlined,
                                          color: Colors.black,
                                          size: 30,
                                        )),
                                  ),
                                  Positioned(
                                    top: 300,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          .8,
                                      child: TextFormField(
                                          controller: _to,
                                          decoration: InputDecoration(
                                              hintText: "To",
                                              hintStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily:
                                                  "Franklin_Gothic"),
                                              suffixIcon: IconButton(
                                                  onPressed: () async {
                                                    currentPosition =
                                                    await geolocatorService
                                                        .getInitialLocation();
                                                    print(currentPosition
                                                        .latitude);
                                                    print(currentPosition
                                                        .longitude);

                                                    currentAddress =
                                                    await getAddress(
                                                        currentPosition
                                                            .latitude,
                                                        currentPosition
                                                            .longitude);
                                                    print(currentAddress);
                                                    _to.text = currentAddress!;
                                                    dlat = currentPosition
                                                        .latitude
                                                        .toString();
                                                    dlmg = currentPosition
                                                        .longitude
                                                        .toString();
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
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 300,
                                    left: MediaQuery.of(context).size.width *
                                        0.256,
                                    child: InkWell(
                                      onTap: () {
                                        // double total = 0;
                                        // total=Geolocator.distanceBetween(21.5222, -70.4579, 21.1072, -70.2810);
                                        //total +=calculateDistance(21.5222,-70.4579,21.1072,-70.2810);
                                        // total += distance.as(
                                        //
                                        //   LengthUnit.Kilometer,
                                        //   LatLng(double.parse("21.5222"),
                                        //       double.parse("-70.4579")),
                                        //   LatLng(double.parse("21.1072"),
                                        //       double.parse("-70.2810")),
                                        // LatLng(double.parse(llat),
                                        //     double.parse(llng)),
                                        // LatLng(double.parse(dlat),
                                        //     double.parse(dlmg)),
                                        //);
                                        // print(total);
                                        print(_from.text + "?????????????????????????????");
                                        print(_to.text + "?????????????????????????????");
                                        print(llat + ">>>>>>>>>>>>>>>>>>>>>");
                                        print(llng + ">>>>>>>>>>>>>>>>>>>>>");
                                        print(dlat + ">>>>>>>>>>>>>>>>>>>>>");
                                        print(dlmg + ">>>>>>>>>>>>>>>>>>>>>");
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FRRouteDetails(
                                                      // "junagadh",
                                                      // "bhanduri",
                                                      // "21.5222",
                                                      // "70.4579",
                                                      // "21.1072",
                                                      // "70.2810",
                                                      // "363"
                                                      _from.text,

                                                      _to.text,
                                                      llat,
                                                      llng,
                                                      dlat,
                                                      dlmg,
                                                      // total.toInt().toString(),
                                                      widget.type,
                                                    )));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(top: 30),
                                        alignment: Alignment.center,
                                        height: 32,
                                        width: 87,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(25),
                                            gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(0xff060E57),
                                                  Color(0xff010311)
                                                ])),
                                        child: Text(
                                          "Search",
                                          style: TextStyle(
                                              fontFamily: "Franklin_Gothic",
                                              color: Color(0xffFFFFFF),
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ),
                                  (_from.text.length > 0 && from == true)
                                      ? Positioned(
                                    top: 200,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white),
                                      height: 300,
                                      width: MediaQuery.of(context)
                                          .size
                                          .width,
                                      child:
                                      FutureBuilder<
                                          List<PlaceSearch>>(
                                          future: PlacesService()
                                              .getAutoComplate(
                                              location1),
                                          builder:
                                              (context, snapshots) {
                                            return (snapshots.hasData)
                                                ? ListView.builder(
                                                itemCount:
                                                snapshots
                                                    .data!
                                                    .length,
                                                itemBuilder:
                                                    (context,
                                                    index) {
                                                  var server =
                                                  snapshots
                                                      .data![
                                                  index];

                                                  return (snapshots
                                                      .hasData)
                                                      ? ListTile(
                                                    onTap:
                                                        () async {
                                                      final Place
                                                      user2 =
                                                      await PlacesService().getlatlong(server.placeId);
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

                                                      setState(
                                                              () {
                                                            List<String>
                                                            result =
                                                            server.description.split(',');
                                                            _from.text =
                                                            result[0];
                                                            print(server.description);
                                                          });
                                                      from =
                                                      false;
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
                                    ),
                                  )
                                      : Container(),
                                  (_to.text.length > 0 && to == true)
                                      ? Positioned(
                                    top: 350,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white),
                                      height: 300,
                                      width: MediaQuery.of(context)
                                          .size
                                          .width,
                                      child:
                                      FutureBuilder<
                                          List<PlaceSearch>>(
                                          future: PlacesService()
                                              .getAutoComplate(
                                              location2),
                                          builder:
                                              (context, snapshots) {
                                            return (snapshots.hasData)
                                                ? ListView.builder(
                                                itemCount:
                                                snapshots
                                                    .data!
                                                    .length,
                                                itemBuilder:
                                                    (context,
                                                    index) {
                                                  var server =
                                                  snapshots
                                                      .data![
                                                  index];

                                                  return (snapshots
                                                      .hasData)
                                                      ? ListTile(
                                                    onTap:
                                                        () async {
                                                      print(
                                                          server.placeId);

                                                      final Place
                                                      user1 =
                                                      await PlacesService().getlatlong(server.placeId);
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

                                                      setState(
                                                              () {
                                                            List<String>
                                                            res =
                                                            server.description.split(',');
                                                            _to.text =
                                                            res[0];
                                                          });
                                                      to =
                                                      false;
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
                                    ),
                                  )
                                      : Container(),
                                ],
                              ),
                              SizedBox(
                                height:
                                MediaQuery.of(context).size.height * 0.06,
                              ),
                            ],
                          );
                        }),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }
}

Future<String> getAddress(latitude, longitude) async {
  List<Placemark> placemarks =
  await placemarkFromCoordinates(latitude, longitude);
  return '${placemarks[0].name},${placemarks[0].street},${placemarks[0].subLocality},${placemarks[0].locality},${placemarks[0].administrativeArea},${placemarks[0].postalCode},${placemarks[0].country}';
}
