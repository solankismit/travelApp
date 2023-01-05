import 'package:flutter/material.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/findrequestofferbyusermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyRequestRide extends StatefulWidget {



  @override
  _MyRequestRideState createState() => _MyRequestRideState();
}

class _MyRequestRideState extends State<MyRequestRide> {
  String? regid;
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


        title: Text("My Request Ride",style: TextStyle(
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
            padding:  EdgeInsets.only(top: 15.h,bottom: 15.h),
            child:FutureBuilder<Findrequestofferbyusermodel>(
              future: findRequestofferbyuser().findrequestofferbyuser(regid),
              builder: (context,snapshot){
                return (snapshot.hasData)?ListView.builder(itemCount: snapshot.data!.detail.length,itemBuilder: (context,index){
                  var server=snapshot.data!.detail[index];
                  return Padding(
                    padding:  EdgeInsets.all(8.0.h),
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.4,
                      width: MediaQuery.of(context).size.width,
                      decoration: (
                          BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(0),
                            border:Border.all(color: Colors.grey.shade400),

                            boxShadow: [BoxShadow(
                                color: Colors.grey,
                                blurRadius: 3,
                                offset: Offset(0,1)

                            )
                            ],

                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 25,left: 25),
                        child: Positioned(top:MediaQuery.of(context).size.height*0.002,right:5,left:5,bottom:38,child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text("From",style: TextStyle(
                                    color: Color(0xff020744),
                                    fontFamily: "Franklin_Gothic",

                                    fontSize: 18
                                ),),
                                Text("To",style: TextStyle(
                                    color: Color(0xff020744),
                                    fontFamily: "Franklin_Gothic",

                                    fontSize: 18
                                ),),
                                Text("Total Fare",style: TextStyle(
                                    color: Color(0xff020744),
                                    fontFamily: "Franklin_Gothic",

                                    fontSize: 18
                                ),),
                                // SizedBox(
                                //   height: MediaQuery.of(context).size.height*0.03,
                                // ),
                                Text("Vehicle Type",style: TextStyle(
                                    color: Color(0xff020744),
                                    fontFamily: "Franklin_Gothic",

                                    fontSize: 18
                                ),),
                                Text("Distance",style: TextStyle(
                                    color: Color(0xff020744),
                                    fontFamily: "Franklin_Gothic",

                                    fontSize: 18
                                ),),


                                Text("Vehicle Number",style: TextStyle(
                                    color: Color(0xff020744),
                                    fontFamily: "Franklin_Gothic",

                                    fontSize: 18
                                ),),



                                Text("${server.goDate.day}-${server.goDate.month}-${server.goDate.year}",style: TextStyle(
                                    color: Color(0xff020744),
                                    fontFamily: "Franklin_Gothic",

                                    fontSize: 18
                                ),),


                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text("${server.leavecity}",style: TextStyle(
                                    color: Color(0xff020744),
                                    fontFamily: "Franklin_Gothic",

                                    fontSize: 18
                                ),),
                                Text("${server.destcity}",style: TextStyle(
                                    color: Color(0xff020744),
                                    fontFamily: "Franklin_Gothic",

                                    fontSize: 18
                                ),),
                                Text("${server.leaveDestFare}",style: TextStyle(
                                    color: Color(0xff020744),
                                    fontFamily: "Franklin_Gothic",

                                    fontSize: 18
                                ),),

                                Text("${server.offertype}",style: TextStyle(
                                    color: Color(0xff020744),
                                    fontFamily: "Franklin_Gothic",

                                    fontSize: 18
                                ),),
                                Text("${server.distance}",style: TextStyle(
                                    color: Color(0xff020744),
                                    fontFamily: "Franklin_Gothic",

                                    fontSize: 18
                                ),),


                                Text("${server.vehicleno}",style: TextStyle(
                                    color: Color(0xff020744),
                                    fontFamily: "Franklin_Gothic",

                                    fontSize: 18
                                ),),

                                Text("${server.goTime}",style: TextStyle(
                                    color: Color(0xff020744),
                                    fontFamily: "Franklin_Gothic",

                                    fontSize: 18
                                ),),


                              ],
                            ),
                          ],
                        ),),
                      ),

                    ),
                  );
                }):Center(
                  child:
                  Text("Data Not Found")
                );

              }
            )

          ),
        ),


      ),
    );
  }
}
