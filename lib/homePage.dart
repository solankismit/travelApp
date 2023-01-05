import 'dart:ui';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lechalo/screens/CreateRequestDitails.dart';
import 'package:lechalo/screens/NewDrawerScreen.dart';
import 'package:lechalo/screens/c_p_searchRide.dart';
import 'package:lechalo/screens/loginScreen.dart';
import 'package:lechalo/screens/searchRide.dart';
import 'package:lechalo/screens/sendParcel.dart';
import 'package:lechalo/screens/signup/signupScreen.dart';
import 'package:lechalo/screens/t_RideList.dart';
import 'package:lechalo/screens/vehicle/addedVehicle.dart';
import 'package:lechalo/screens/vehicle/c_addedVehicle.dart';
import 'package:lechalo/screens/drawer.dart';

import 'googleplace/geo_locetor.dart';


class HomePage extends StatefulWidget {
  double lat,lng;
  HomePage(this.lat,this.lng,{Key? key}):super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String type = "";
  var scaffoldKey = GlobalKey<ScaffoldState>();
  GeolocatorService geolocatorService = GeolocatorService();
  late Position currentPosition;


  _showDialog2() {
    showDialog(context: context, builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(
            sigmaY: 40,
            sigmaX: 40
        ),
        child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),

            ),
            child: Container(

              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.28,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.8,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        SizedBox(width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.040,),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black
                          ),
                          child: IconButton(padding: EdgeInsets.zero,onPressed: () {
                            Navigator.pop(context);
                          }, icon: Icon(Icons.close, color: Colors.white,)),
                        )


                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddedVehicles(type.toString()??"")));
                        },
                        child: Column(
                          children: [
                            Container(
                              height:MediaQuery.of(context).size.height*0.15,
                              width:MediaQuery.of(context).size.width*0.25,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/offer a ride.png")
                                  )
                              ),

                            ),
                            Text("Offer A Ride", style: TextStyle(
                                fontFamily: "Franklin_Gothic", fontSize: 18),)
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchRide(type.toString()??"")));
                        },
                        child: Column(
                          children: [
                            Container(
                              height:MediaQuery.of(context).size.height*0.15,
                              width:MediaQuery.of(context).size.width*0.25,
                              decoration: BoxDecoration(
                                  image: DecorationImage(

                                      image: AssetImage("assets/find ride.png")
                                  )
                              ),

                            ),
                            Text("Find A Ride", style: TextStyle(
                                fontFamily: "Franklin_Gothic", fontSize: 18),)
                          ],
                        ),
                      ),


                    ],
                  )
                ],
              ),

            )
        ),
      );
    });
  }
  _showDialog() {
    showDialog(context: context, builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(
            sigmaY: 40,
            sigmaX: 40
        ),
        child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),

            ),
            child: Container(

              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.28,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.8,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        SizedBox(width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.040,),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black
                          ),
                          child: IconButton(padding: EdgeInsets.zero,onPressed: () {
                            Navigator.pop(context);
                          }, icon: Icon(Icons.close, color: Colors.white,)),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CAddedVehicle()));
                        },
                        child: Column(
                          children: [
                            Container(
                              height:MediaQuery.of(context).size.height*0.15,
                              width:MediaQuery.of(context).size.width*0.25,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/driver.png")
                                  )
                              ),

                            ),
                            Text("Driver", style: TextStyle(
                                fontFamily: "Franklin_Gothic", fontSize: 18),)
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CPSearchRide()));
                        },
                        child: Column(
                          children: [
                            Container(
                              height:MediaQuery.of(context).size.height*0.15,
                              width:MediaQuery.of(context).size.width*0.25,
                              decoration: BoxDecoration(
                                  image: DecorationImage(

                                      image: AssetImage("assets/passenger.png")
                                  )
                              ),

                            ),
                            Text("Passenger", style: TextStyle(
                                fontFamily: "Franklin_Gothic", fontSize: 18),)
                          ],
                        ),
                      ),


                    ],
                  )
                ],
              ),

            )
        ),
      );
    });
  }
  _showDialog3() {
    showDialog(context: context, builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(
            sigmaY: 40,
            sigmaX: 40
        ),
        child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),

            ),
            child: Container(

              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.28,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.8,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        SizedBox(width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.040,),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black
                          ),
                          child: IconButton(padding: EdgeInsets.zero,onPressed: () {
                            Navigator.pop(context);
                          }, icon: Icon(Icons.close, color: Colors.white,)),
                        )


                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TRideList()));
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CreateRequestDitails()));
                        },
                        child: Column(
                          children: [
                            Container(
                              height:MediaQuery.of(context).size.height*0.15,
                              width:MediaQuery.of(context).size.width*0.25,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/pick parcel.png")
                                  )
                              ),

                            ),
                            Text("Pick Parcel/Goods", style: TextStyle(
                                fontFamily: "Franklin_Gothic", fontSize: 18),)
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SendParcel()));
                        },
                        child: Column(
                          children: [
                            Container(
                              height:MediaQuery.of(context).size.height*0.15,
                              width:MediaQuery.of(context).size.width*0.25,
                              decoration: BoxDecoration(
                                  image: DecorationImage(

                                      image: AssetImage("assets/send parcel.png")
                                  )
                              ),

                            ),
                            Text("Send Parcel/Goods", style: TextStyle(
                                fontFamily: "Franklin_Gothic", fontSize: 18),)
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),

            )
        ),
      );
    });
  }
  @override
  void initState() {
    Future.delayed(Duration.zero,()async{
      currentPosition =
      await geolocatorService.getInitialLocation();
      print(currentPosition.longitude.runtimeType);
    });
    // TODO: implement initState
    super.initState();
    print(widget.lat);
    print(widget.lng);
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414,896),
      builder: (context, child) => Scaffold(
        key: scaffoldKey,
        endDrawer:
        BackdropFilter(
            filter: ImageFilter.blur(
              sigmaY: 30,
              sigmaX: 30,
            ),
            child:
            //SignupScreen()
            DrawerView()
          //  NewDrawerView()
           // LoginScreen()
        ),



        extendBodyBehindAppBar: true,
        appBar: AppBar(elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(onPressed: (){scaffoldKey.currentState?.openEndDrawer();}, icon: Image.asset("assets/menu.png",)),
          ],

        ),
        body: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height*0.5,

            child: GoogleMap(
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                    widget.lat,widget.lng),
                zoom: 15,
              ),
            ),
          ),
          Stack(
            children: [
              Positioned(bottom: 0,
                child: Container(
                  height: 487.h,
                  width:  414.w,

                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff060E57),
                            Color(0xff010311)
                          ]
                      ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.r),
                          topRight: Radius.circular(50.r))),
                  child: Padding(
                    padding: EdgeInsets.only(top:13.h,right: 68.w,left: 68.w),
                    child: Column(

                      children: [
                        Text("Choose Your Ride !",style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontFamily: "Franklin_Gothic",
                          //letterSpacing: 3
                        ),),
                        SizedBox(
                          height: 60.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: (){
                                setState(() {
                                  this.type="car";
                                });
                                _showDialog2();
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height:98.h,
                                    width:98.w,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage("assets/Car Ride.png")
                                        )
                                    ),

                                  ),
                                  SizedBox(
                                    height: 7.h,
                                  ),
                                  Text("Car Ride",style: TextStyle(fontFamily:"Franklin_Gothic" ,fontSize: 18.sp,
                                      color: Colors.white),)
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 61.w,
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  this.type="bike";
                                });
                                _showDialog2();
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height:98.h,
                                    width:98.w,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(

                                            image: AssetImage("assets/bike.png")
                                        )
                                    ),

                                  ),
                                  SizedBox(
                                    height: 7.h,
                                  ),
                                  Text("Bike Ride",style: TextStyle(fontFamily:"Franklin_Gothic" ,fontSize: 18.sp,color: Colors.white),)
                                ],
                              ),
                            ),


                          ],
                        ),
                        SizedBox(
                          height: 90.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: (){
                                _showDialog();
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height:98.h,
                                    width:98.w,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(

                                            image: AssetImage("assets/Cab.png")
                                        )
                                    ),

                                  ),
                                  SizedBox(
                                    height: 7.h,
                                  ),
                                  Text("Hire Auto / Cab",style: TextStyle(fontFamily:"Franklin_Gothic" ,fontSize: 18.sp,color: Colors.white),)
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 61.w,
                            ),
                            InkWell(
                              onTap: (){
                                _showDialog3();
                              },
                              child: Column(
                                children: [
                                  Container(

                                    height:98.h,
                                    width:98.w,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage("assets/Goods.png")
                                        )
                                    ),

                                  ),
                                  SizedBox(
                                    height: 7.h,
                                  ),
                                  Text("Parcel/Goods",style: TextStyle(fontFamily:"Franklin_Gothic" ,fontSize: 18.sp,color: Colors.white),)
                                ],
                              ),
                            ),




                          ],
                        )
                      ],
                    ),
                  ),


                ),
              ),


            ],

          )
        ],
        ),
      ),
    );

  }
}

