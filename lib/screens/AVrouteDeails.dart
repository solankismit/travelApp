import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lechalo/screens/setSchedule.dart';

class AVRouteDetails extends StatefulWidget {
  String  iVehicleID, dLeaveLong, dLeaveLat, dDestLong, dDestLat, vLeaveAddress, vDestAddress, eOfferPriceType, dOfferRate,seats,type;
  AVRouteDetails(this.iVehicleID,this.dLeaveLong,this.dLeaveLat,this.dDestLong,this.dDestLat,this.vLeaveAddress,this.vDestAddress ,this.eOfferPriceType, this.dOfferRate,this.seats,this.type,{Key? key}):super(key: key);


  @override
  _AVRouteDetailsState createState() => _AVRouteDetailsState();
}

class _AVRouteDetailsState extends State<AVRouteDetails> {
  var distance;
  Completer<GoogleMapController>_controleer=Completer();
  GoogleMapController? _googleMapController;
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates=[];
  late PolylinePoints polylinePoints;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    polylinePoints = PolylinePoints();
  }


  @override
  Widget build(BuildContext context) {
    print("PolyLine Coordinates "+polylineCoordinates.toString());
    return ScreenUtilInit(
      // designSize: Size(414,2000),
      designSize: Size(414,900),
      builder:(context, child) => Scaffold(



        appBar: AppBar(
          backgroundColor: Color(0xff060E57),
          leading: IconButton(padding: EdgeInsets.zero,onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),


          title: Text("Route Details",style: TextStyle(
              fontFamily: "Franklin_Gothic"
          ),),
          centerTitle: true,
          elevation: 0,

        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff060E57),
                    Color(0xff010311)
                  ]
              )
          ),
          child:
          Column(
            mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 50,
                  margin: EdgeInsets.only(right: 7.w,left: 7.w),
                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(40.r)
                  ),
                  child:
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40.r),
                        child:
                        GoogleMap(
                          polylines: _polylines,


                          initialCameraPosition: CameraPosition(

                            target:LatLng(double.parse(widget.dLeaveLat =="null" ? "0.0" : widget.dLeaveLat.toString()),double.parse(widget.dLeaveLong=="null" ? "0.0" : widget.dLeaveLong.toString())),
                            zoom: 10,
                          ),

                          onMapCreated: _onMapCreated
                            //   (GoogleMapController controller) async{
                            // _controleer.complete(controller);
                            // _googleMapController = await _controleer.future;
                            //
                            //
                            //   setPolyline().then((_) {_googleMapController!.animateCamera(CameraUpdate.newLatLngBounds(
                            //       LatLngBounds(
                            //           southwest: LatLng(double.parse(widget.dLeaveLat),double.parse(widget.dLeaveLong)),
                            //           northeast: LatLng(double.parse(widget.dDestLat),double.parse(widget.dDestLong))),
                            //       20));});
                            //   },
                        ),
                      ),
                      // Positioned(top: 500.h,right: 157.w,left: 157.w,
                      //   child:
                      // ),
              ),
                ),
                SizedBox(height: 60.h,),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SetSchedule(widget.iVehicleID, widget.dLeaveLong,widget.dLeaveLat, widget.dDestLong, widget.dDestLat, widget.vLeaveAddress, widget.vDestAddress, widget.eOfferPriceType, widget.dOfferRate,widget.seats,widget.type,this.distance.toString())));
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

              ]
          ),


        ),
      ),
    );
  }
  void _onMapCreated(GoogleMapController controller) async {
    setState(() {
      _googleMapController = controller;
      setPolyline().then((_) => _setMapFitToTour(_polylines));
    });
  }
  setPolyline() async{

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates("AIzaSyCes-KHEjUOZPVtQ1BJpHyhYrrhyIc47a4", PointLatLng(double.parse(widget.dLeaveLat),double.parse(widget.dLeaveLong)), PointLatLng(double.parse(widget.dDestLat), double.parse(widget.dDestLong)));
    // print("Result : "+result.points[0].latitude.toString());
    print("Result : "+result.errorMessage.toString());
    print("Result : "+result.status.toString());
    if(result.status=="OK"){
      result.points.forEach((PointLatLng point) {
        print("Latlng is "+LatLng(point.latitude, point.longitude).toString());
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
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
      this.distance=totalDistance;
      print(this.distance);
    });
    print(distance);
  }
  double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var a = 0.5 - cos((lat2 - lat1) * p)/2 +
        cos(lat1 * p) * cos(lat2 * p) *
            (1 - cos((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
  }
  _setMapFitToTour(Set<Polyline> p) {
    double minLat = p.first.points.first.latitude;
    double minLong = p.first.points.first.longitude;
    double maxLat = p.first.points.first.latitude;
    double maxLong = p.first.points.first.longitude;
    p.forEach((poly) {
      poly.points.forEach((point) {
        if(point.latitude < minLat) minLat = point.latitude;
        if(point.latitude > maxLat) maxLat = point.latitude;
        if(point.longitude < minLong) minLong = point.longitude;
        if(point.longitude > maxLong) maxLong = point.longitude;
      });
    });
    _googleMapController!.animateCamera(CameraUpdate.newLatLngBounds(LatLngBounds(
        southwest: LatLng(minLat, minLong),
        northeast: LatLng(maxLat,maxLong)
    ), 20));
  }
}

