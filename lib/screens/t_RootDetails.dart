import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lechalo/screens/setSchedule.dart';
import 'package:lechalo/screens/t_SetSchedule.dart';


class TRouteDetails extends StatefulWidget {
  String  iVehicleID, dLeaveLong, dLeaveLat, dDestLong, dDestLat, vLeaveAddress, vDestAddress, eOfferPriceType, dOfferRate;
TRouteDetails(this.iVehicleID,this.dLeaveLong,this.dLeaveLat,this.dDestLong,this.dDestLat,this.vLeaveAddress,this.vDestAddress ,this.eOfferPriceType, this.dOfferRate,{Key? key}):super(key: key);

  @override
  _TRouteDetailsState createState() => _TRouteDetailsState();
}

class _TRouteDetailsState extends State<TRouteDetails> {
  Completer<GoogleMapController>_controleer=Completer();
  Set<Polyline> _polylines =Set<Polyline>();
  GoogleMapController? _googleMapController;
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
    return ScreenUtilInit(
      designSize: Size(414,896),
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
          child: Stack(
              children: [Container(
                height:831.h,
                margin: EdgeInsets.only(right: 7.w,left: 7.w),
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(40.r)
                ),
                child: Stack(


                  children: [
                    
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40.r),
                      child:
                      GoogleMap(
                        polylines: _polylines,


                        initialCameraPosition: CameraPosition(

                          target:LatLng(double.parse(widget.dLeaveLat),double.parse(widget.dLeaveLong)),
                          zoom: 10,
                        ),

                        onMapCreated: _onMapCreated
                        //     (GoogleMapController controller){
                        //   _controleer.complete(controller);
                        //   setPolyline();
                        // },
                      ),
                    ),
                    Positioned(top: 744.h,right: 157.w,left: 157.w,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TSetSchedule(widget.iVehicleID, widget.dLeaveLong,widget.dLeaveLat, widget.dDestLong, widget.dDestLat, widget.vLeaveAddress, widget.vDestAddress, widget.eOfferPriceType, widget.dOfferRate)));



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

                  ],
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
    if(result.status=="OK"){
      result.points.forEach((PointLatLng point) {
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

