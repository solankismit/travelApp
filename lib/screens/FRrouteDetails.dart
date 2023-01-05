import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:lechalo/screens/creatRideRequest.dart';
import 'package:lechalo/screens/requestList.dart';
import 'dart:math';

class FRRouteDetails extends StatefulWidget {
  String fromloc;
  String toloc;
  String llat;
  String llang;
  String dlat;
  String dlng;
  String type;

  FRRouteDetails(this.fromloc, this.toloc, this.llat, this.llang, this.dlat,
      this.dlng, this.type,
      {Key? key})
      : super(key: key);

  @override
  _FRRouteDetailsState createState() => _FRRouteDetailsState();
}

class _FRRouteDetailsState extends State<FRRouteDetails> {
  var distance;

  // late double zoomlat;
  // late double zoomlng;
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? _googleMapController;

  // Set<Polyline> _polylines =Set<Polyline>();
  // List<LatLng> polylineCoordinates=[];

  //late PolylinePoints polylinePoints;
  Map<MarkerId, Marker> markers = {};

  // Map<PolylineId, Polyline> polylines = {};
  String googleAPiKey = "AIzaSyCes-KHEjUOZPVtQ1BJpHyhYrrhyIc47a4";
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  late BitmapDescriptor sourceIcon;
  late BitmapDescriptor destinationIcon;

  double CAMERA_ZOOM = 13;
  double CAMERA_TILT = 0;
  double CAMERA_BEARING = 30;

  initState() {
    super.initState();

    print(widget.type);
    setSourceAndDestinationIcons();

    // zoomlat=double.parse(widget.llat);
    // zoomlng=double.parse((widget.llang));
  }

  void setSourceAndDestinationIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), "assets/driving_pin.png");
    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        "assets/destination_map_marker.png");
  }

  /*void setMapPins() {
    setState(() {
      // source pin
      _markers.add(Marker(
          markerId: MarkerId('sourcePin'),
          position: LatLng(double.parse(widget.llat), double.parse(widget.llang)),
          icon: sourceIcon));
      // destination pin
      _markers.add(Marker(
          markerId: MarkerId('destPin'),
          position: LatLng(double.parse(widget.dlat), double.parse(widget.dlng)),
          icon: destinationIcon));
    });
  }

  setPolylines() async {

    List<PointLatLng> result = (await polylinePoints.getRouteBetweenCoordinates(
        googleAPiKey,
        PointLatLng(latitude, longitude),
        PointLatLng(latitude, longitude));
    if (result.isNotEmpty) {
      // loop through all PointLatLng points and convert them
      // to a list of LatLng, required by the Polyline
      result.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    setState(() {
      // create a Polyline instance
      // with an id, an RGB color and the list of LatLng pairs
      Polyline polyline = Polyline(
          polylineId: PolylineId("poly"),
          color: Color.fromARGB(255, 40, 122, 198),
          points: polylineCoordinates);

      // add the constructed polyline as a set of points
      // to the polyline set, which will eventually
      // end up showing up on the map
      _polylines.add(polyline);
    });
  }*/

  //PolylinePoints polylinePoints = PolylinePoints();

  _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
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
                                  distance,
                                  widget.type)));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
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
                                fontSize: 20),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RiderList(widget.fromloc,widget.toloc)));
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 30),
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xff060E57),
                                    Color(0xff010311)
                                  ])),
                          child: Text(
                            "All Request",
                            style: TextStyle(
                                fontFamily: "Franklin_Gothic",
                                color: Color(0xffFFFFFF),
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialLocation = CameraPosition(
        zoom: CAMERA_ZOOM,
        bearing: CAMERA_BEARING,
        tilt: CAMERA_TILT,
        target: LatLng(double.parse(widget.llat), double.parse(widget.llang)));
    return ScreenUtilInit(
      designSize: Size(414, 896),
      builder: (context, child) => Scaffold(
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
            "Route Details",
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
          child: Stack(children: [
            Container(
              height: 831.h,
              margin: EdgeInsets.only(right: 7.w, left: 7.w),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(40.r)),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40.r),
                    /*child: GoogleMap(
                        polylines: _polylines,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(double.parse(widget.llat),
                              double.parse(widget.llang)),
                          zoom: 10,
                        ),
                        onMapCreated: _onMapCreated
                        //     (GoogleMapController controller) async{
                        //   _controleer.complete(controller);
                        //   _googleMapController = await _controleer.future;
                        //
                        //
                        //   setPolyline().then((_) s);
                        // },
                        ),*/
                    child: GoogleMap(
                        myLocationEnabled: true,
                        compassEnabled: true,
                        tiltGesturesEnabled: false,
                        markers: _markers,
                        polylines: _polylines,
                        mapType: MapType.normal,
                        initialCameraPosition: initialLocation,
                        onMapCreated: _onMapCreated),
                  ),
                  Positioned(
                    top: 744.h,
                    right: 157.w,
                    left: 157.w,
                    child: InkWell(
                      onTap: () {
                        //_showDialog();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RiderList(
                                widget.fromloc,
                                widget.toloc,
                                widget.llat,
                                widget.llang,
                                widget.dlat,
                                widget.dlng,
                                distance.toString(),
                                widget.type)));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 34.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
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
                              fontSize: 18.sp),
                        ),
                      ),
                    ),
                  ),
                  // Positioned(child: InkWell(
                  //   onTap: () {
                  //     setState(() {
                  //       zoomlat=double.parse(widget.llat);
                  //       zoomlng=double.parse(widget.llang);
                  //     });
                  //
                  //
                  //
                  //
                  //   },
                  //   child: Container(
                  //
                  //     alignment: Alignment.center,
                  //     height: 34.h,
                  //     width: 100.w,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(20.r),
                  //         gradient: LinearGradient(
                  //             begin: Alignment.topCenter,
                  //             end: Alignment.bottomCenter,
                  //             colors: [
                  //               Color(0xff060E57),
                  //               Color(0xff010311)
                  //             ])),
                  //     child: Text(
                  //       "From",
                  //       style: TextStyle(
                  //           fontFamily: "Franklin_Gothic",
                  //           color: Color(0xffFFFFFF),
                  //           fontSize: 18.sp),
                  //     ),
                  //   ),
                  // ),),
                  // Positioned(child: InkWell(
                  //   onTap: () {
                  //     setState(() {
                  //       zoomlat=double.parse(widget.dlat);
                  //       zoomlng=double.parse(widget.dlng);
                  //     });
                  //
                  //
                  //
                  //
                  //   },
                  //   child: Container(
                  //
                  //     alignment: Alignment.center,
                  //     height: 34.h,
                  //     width: 100.w,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(20.r),
                  //         gradient: LinearGradient(
                  //             begin: Alignment.topCenter,
                  //             end: Alignment.bottomCenter,
                  //             colors: [
                  //               Color(0xff060E57),
                  //               Color(0xff010311)
                  //             ])),
                  //     child: Text(
                  //       "To",
                  //       style: TextStyle(
                  //           fontFamily: "Franklin_Gothic",
                  //           color: Color(0xffFFFFFF),
                  //           fontSize: 18.sp),
                  //     ),
                  //   ),
                  // ),)
                ],
              ),
            ),
          ]),
        ),
      ),
    );

    /* CameraPosition initialLocation = CameraPosition(
        zoom: CAMERA_ZOOM,
        bearing: CAMERA_BEARING,
        tilt: CAMERA_TILT,
        target: LatLng(double.parse(widget.llat), double.parse(widget.llang)));
     return GoogleMap(
        myLocationEnabled: true,
        compassEnabled: true,
        tiltGesturesEnabled: false,
        markers: _markers,
        polylines: _polylines,
        mapType: MapType.normal,
        initialCameraPosition: initialLocation,
        onMapCreated: _onMapCreated);*/
  }

  void _onMapCreated(GoogleMapController controller) {
    /*setState(() {
      _googleMapController = controller;
     // print(controller.toString() + "?????????????????????");
      print("222222222222"+_polylines.toString());
      setPolyline().then((_) => _setMapFitToTour(_polylines));
    });
*/
    _controller.complete(controller);
    setMapPins();
    setPolylines();
  }

  /*void setMapPins() {
    setState(() {
      // source pin
      markers.add(Marker(
          markerId: MarkerId(‘sourcePin’),
          position: SOURCE_LOCATION,
          icon: sourceIcon
      ));
      // destination pin
      _markers.add(Marker(
          markerId: MarkerId(‘destPin’),
          position: c,
          icon: destinationIcon
      ));
    });
  }*/

  void setMapPins() {
    setState(() {
      // source pin
      _markers.add(Marker(
          markerId: MarkerId('sourcePin'),
          position:
              LatLng(double.parse(widget.llat), double.parse(widget.llang)),
          icon: sourceIcon));
      // destination pin
      _markers.add(Marker(
          markerId: MarkerId('destPin'),
          position:
              LatLng(double.parse(widget.dlat), double.parse(widget.dlng)),
          icon: destinationIcon));
    });
  }

  setPolylines() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleAPiKey,
        PointLatLng(double.parse(widget.llat), double.parse(widget.llang)),
        PointLatLng(double.parse(widget.dlat), double.parse(widget.dlng)));

    /*List<PointLatLng> result  = await polylinePoints?.getRouteBetweenCoordinates(googleAPiKey,
        PointLatLng(double.parse(widget.llat),  double.parse(widget.llang)),PointLatLng(double.parse(widget.dlat), double.parse(widget.dlng)));*/

    if (result.status == "OK") {
      result.points.forEach((PointLatLng point) {
        print(point.toString() + "-----");
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });

      // loop through all PointLatLng points and convert them
      // to a list of LatLng, required by the Polyline

      /*result.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });*/
    } else {
      print(result.errorMessage.toString() + "  ---error");
    }

    setState(() {
      // create a Polyline instance
      // with an id, an RGB color and the list of LatLng pairs
      Polyline polyline = Polyline(
          polylineId: PolylineId("poly"),
          color: Color.fromARGB(255, 40, 122, 198),
          points: polylineCoordinates);

      // add the constructed polyline as a set of points
      // to the polyline set, which will eventually
      // end up showing up on the map
      _polylines.add(polyline);
    });
  }

  /*setPolyline() async{

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates("AIzaSyBdh9sFWxjJLcYEmssq73oQg-etg2cCyac", PointLatLng(double.parse(widget.llat),double.parse(widget.llang)), PointLatLng(double.parse(widget.dlat), double.parse(widget.dlng)));
    if(result.status=="OK"){
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        print("AAAA ${point.latitude} ${point.longitude}");
      });
      setState(() {
        _polylines.add(
            Polyline(width:3,

              polylineId: PolylineId('polyline'),
              color: Colors.black,
              points: polylineCoordinates,
            )
        );
      });
    }
    double totalDistance = 0;
    for(var i = 0; i < polylineCoordinates.length-1; i++){
      totalDistance += calculateDistance(
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
          polylineCoordinates[i+1].latitude,
          polylineCoordinates[i+1].longitude);
    }
    setState(() {
      distance=totalDistance;
    });
    print(distance);
  }*/
  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  _setMapFitToTour(Set<Polyline> p) {
    print("1111111111111111111" + p.toString());
    double minLat = p.first.points.first.latitude;
    double minLong = p.first.points.first.longitude;
    double maxLat = p.first.points.first.latitude;
    double maxLong = p.first.points.first.longitude;
    // double minLat = p.first.points.first.latitude;
    // double minLong = p.last.points.last.latitude;
    // double maxLat = p.first.points.first.longitude;
    // double maxLong = p.last.points.last.longitude;

    p.forEach((poly) {
      poly.points.forEach((point) {
        if (point.latitude < minLat) minLat = point.latitude;
        if (point.latitude > maxLat) maxLat = point.latitude;
        if (point.longitude < minLong) minLong = point.longitude;
        if (point.longitude > maxLong) maxLong = point.longitude;
      });
    });
    _googleMapController!.animateCamera(CameraUpdate.newLatLngBounds(
        LatLngBounds(
            southwest: LatLng(minLat, minLong),
            northeast: LatLng(maxLat, maxLong)),
        20));
  }
}
