import 'package:flutter/material.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/screens/r_creatRideRequest.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

import 'models/allhirevehicles.dart';
import 'models/hirevehiclesearchridemodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RRideList extends StatefulWidget {
  String type;
  String city;
  RRideList(this.city,this.type,{Key? key}):super(key: key);

  @override
  _RRideListState createState() => _RRideListState();
}

class _RRideListState extends State<RRideList> {
  var _number;
  var _url="https://api.whatsapp.com//send?phone=+91";

  String? regid;
  late Future<Allhirevehicles?> data;
  String? id;

  Future<String?> getNamePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("id");
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

        final Future<Allhirevehicles> user = allHirevehicles().allhirevehicles(regid) ;

      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xff060E57),
        leading: IconButton(padding: EdgeInsets.zero,onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),


        title: Text("Ride List",style: TextStyle(
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
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.only(right: 7.w,left: 7.w),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40.r)
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 20.0.h,bottom: 15.h),
            child: Stack(

              children: [

                // SizedBox(
                //   height: MediaQuery.of(context).size.height*0.03,
                // ),
                Container(
                  margin: EdgeInsets.only(top: 50.h),
                  child: FutureBuilder<Hirevehiclesearchridemodel>(future:hireVehiclesearchride().hirevehiclesearchride(widget.type, widget.city),builder: (context,snapshot) {

                    return (snapshot.hasData)?ListView.builder(
                      itemCount: snapshot.data!.rideList.length,
                      itemBuilder: (context,index) {
                        var server = snapshot.data!.rideList[index];
                        return Container(
                          margin: EdgeInsets.all(10.h),
                          padding: EdgeInsets.only(right: 8.0.w,
                              left: 8.0.w,
                              top: 0.0.h),
                          height: 200.h,
                          width: 414.w,
                          decoration: (BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24.r),
                            border: Border.all(color: Colors.grey.shade400),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3,
                                  offset: Offset(0, 1))
                            ],
                          )),
                          child: Column(

                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,

                                children: [
                                  Container(

                                    height:
                                    80.h,
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                            AssetImage(
                                                "assets/profile.png"))),
                                  ),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,

                                    children: [
                                      Text(
                                        "${server.drivername}",
                                        style: TextStyle(
                                            color: Color(0xff020744),
                                            fontFamily: "Franklin_Gothic",
                                            fontSize: 14.sp),
                                      ),
                                      SizedBox(
                                        height:23.h,
                                      ),
                                      Text(
                                        "Vehicle Type : ${server.typename}",
                                        style: TextStyle(
                                            color: Color(0xff020744),
                                            fontFamily: "Franklin_Gothic",
                                            fontSize: 14.sp),
                                      ),
                                      SizedBox(
                                        height: 23.h,
                                      ),
                                      Text(
                                        "City : ${server.vCity1}",
                                        style: TextStyle(
                                            color: Color(0xff020744),
                                            fontFamily: "Franklin_Gothic",
                                            fontSize: 14.sp),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),

                                  Text("|", style: TextStyle(
                                      color: Color(0xff020744),
                                      fontSize: 30.sp
                                  ),),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,

                                    children: [
                                      Text(
                                        "${server.maxseats} Seater",
                                        style: TextStyle(
                                            color: Color(0xff020744),
                                            fontFamily: "Franklin_Gothic",
                                            fontSize: 14.sp),
                                      ),
                                      SizedBox(
                                        height: 3.w,
                                      ),


                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 18.h,
                              ),


                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap:(){
                                      launch("tel:${server.mobile}");
                                    } ,

                                    child: Container(
                                      height: 70.h,
                                      width: 70.w,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/call.png")
                                          )
                                      ),
                                    ),
                                  ),
                                  InkWell(onTap: (){

                                      _number=server.mobile;
                                      print(_number);
                                      print(server.mobile);
                                      _launchURL(_number);
                                  },
                                    child: Container(
                                      height: 70.h,
                                      width: 70.w,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/whatsapp.png")
                                          )
                                      ),
                                    ),
                                  ),
                                ],
                              )

                              // SizedBox(
                              //   height: MediaQuery.of(context).size.height*0.03,
                              // ),
                            ],
                          ),
                        );
                      }
                    ):Center(child: Text("Data Not Found"),);

                  }
                    ),
                ),
                InkWell(
                  onTap: () {



                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RCreateRideRequest(widget.city,widget.type)));


                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        //margin: EdgeInsets.only(top: 30),
                        alignment: Alignment.center,
                        height: 50.h,
                        width: 150.w,
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
                    ],
                  ),
                ),


              ],
            ),
          ),



        ),
      ),
    );

  }


  void _launchURL(_number) async => await canLaunch(_url+_number) ? await launch(_url+_number) : throw 'Could not launch ${_url+_number}';
}