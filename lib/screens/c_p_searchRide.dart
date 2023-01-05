import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:lechalo/googleplace/geo_locetor.dart';
import 'package:lechalo/googleplace/placeModel.dart';
import 'package:lechalo/googleplace/place_search.dart';
import 'package:lechalo/googleplace/place_services.dart';
import 'package:lechalo/r_rideList.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CPSearchRide extends StatefulWidget {
  @override
  _CPSearchRideState createState() => _CPSearchRideState();
}

class _CPSearchRideState extends State<CPSearchRide> {
  List<dynamic> data = [];
  bool from = false;
  String location1 = "";
  final key = 'AIzaSyAVK-Gg1P-Z--LlvIiH5zS4i34eOql4ulk';

  Future<List<PlaceSearch>> getAutoComplate(String search) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=(cities)&key=$key';
    var response = await http.post(Uri.parse(url));
    Map<String, dynamic> json = convert.jsonDecode(response.body);

    data = json['predictions'];

    return data.map((place) => PlaceSearch.fromJson(place)).toList();
  }

  TextEditingController _city = TextEditingController();
  GeolocatorService geolocatorService = GeolocatorService();
  late Position currentPosition;
  String? currentAddress;
  late String llat;
  late String llng;
  late String dlat;
  late String dlmg;
  var valueChoose;
  List listitem = ["car", "rickshaw"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAutoComplate("ahm");
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
        height: 810.h,
        width: 414.w,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff060E57), Color(0xff010311)])),
        child: Container(
          height: 35.h,
          width: 20.w,
          margin: EdgeInsets.only(right: 7.w, left: 7.w),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40.r)),
          child: Padding(
            padding:  EdgeInsets.only(top: 50.h),
            child: ListView(
                padding: EdgeInsets.only(right: 40.w, left: 40.w),
                children: [
                  Form(
                    child: Column(
                      children: [
                        Container(
                          height: 70.h,
                          width: 70.w,
                          decoration: BoxDecoration(
                              //color: Colors.red,
                              image: DecorationImage(
                                  image: AssetImage("assets/search ride.png"))),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        // DropDownField(
                        //   value:_city.text,
                        //   controller: _city,
                        //   required: true,
                        //   strict: true,
                        //   hintText: "Enter City",
                        //   onValueChanged: (value){
                        //     setState(() {
                        //      _city.text=value;
                        //
                        //     });
                        //
                        //
                        //
                        //   },
                        //   items: data.map((item){
                        //     return DropdownMenuItem(child: Text(item['description']),
                        //       value: item['description'].toString(),);
                        //   }).toList(),
                        // ),

                        TextFormField(
                          controller: _city,
                          decoration: InputDecoration(
                            hintText: "Enter City",
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
                                  _city.text = currentAddress!;
                                  dlat = currentPosition.latitude.toString();
                                  dlmg = currentPosition.longitude.toString();
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
                          },
                          onChanged: (value) {
                            setState(() {
                              location1 = value;
                            });
                          },
                        ),
                        (_city.text.length > 0 && from == true)
                            ? Container(
                               // decoration: BoxDecoration(color: Colors.white),
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
                                                          print(server.placeId);
                                                          setState(() {
                                                            List<String> res =
                                                                server
                                                                    .description
                                                                    .split(',');
                                                            _city.text = res[0];
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
                          height: 30.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "Select Vehicle Type",
                              style: TextStyle(
                                  color: Colors.black,
                                  //fontWeight: FontWeight.bold,
                                  fontFamily: "Franklin_Gothic"),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 3.w),
                              height:
                                  30.h,
                              width: 180.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffFF4A4A)),
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 3,
                                        offset: Offset(0, 2)),
                                  ]),
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
                          height: 30.h,
                        ),
                        InkWell(
                          onTap: () {
                            (_city.text.isNotEmpty)
                                ? Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        RRideList(_city.text, valueChoose)))
                                : null;
                          },
                          child: Container(
                            //margin: EdgeInsets.only(top: 30),
                            alignment: Alignment.center,
                            height: 32.h,
                            width: 87.w,
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
                              "Search",
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

  Future<String> getAddress(latitude, longitude) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    return '${placemarks[0].name},${placemarks[0].street},${placemarks[0].subLocality},${placemarks[0].locality},${placemarks[0].administrativeArea},${placemarks[0].postalCode},${placemarks[0].country}';
  }
}
