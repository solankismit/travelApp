import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/getvehicleoffermodel.dart';
import 'package:lechalo/models/getvehicles.dart';
import 'package:lechalo/models/removeuservehiclemodel.dart';
import 'package:lechalo/screens/allParcelRequestList.dart';
import 'package:lechalo/screens/t_OfferRide.dart';
import 'package:lechalo/screens/updateVehicle.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TRideList extends StatefulWidget {
  @override
  _TRideListState createState() => _TRideListState();
}

class _TRideListState extends State<TRideList> {
  String? regid;
  late Future<Getvehicles?> data;
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
    return  Scaffold(

      appBar: AppBar(

        backgroundColor: Color(0xff060E57),
        leading: IconButton(padding: EdgeInsets.zero,onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),


        title: Text("Added Vehicles List",style: TextStyle(
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

          margin: EdgeInsets.only(right: 7.w,left: 7.w),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40.r)
          ),
          child: Padding(
              padding:  EdgeInsets.only(top: 20.h,bottom: 10.h),
              child: Stack(
                children: [

                  Padding(
                    padding:  EdgeInsets.only(top: 40.h),
                    child: FutureBuilder<Getvehicleoffermodel>(future: getvehicleOffer().getvehicleoffer(regid,"Parcel"),
                        builder: (context,snapshot){
                          return (snapshot.hasData)?ListView.builder(
                            itemCount: snapshot.data!.detail.length,
                            itemBuilder: (context,index){
                              var server = snapshot.data!.detail[index];
                              return Padding(
                                padding: EdgeInsets.only(right: 15.w,left: 15.w),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 30.h,
                                    ),

                                    Stack(
                                        children:[
                                          Container(
                                            height: 130.h,
                                            width: 414.w,
                                            decoration: (
                                                BoxDecoration(
                                                  color: Color(0xff020744),
                                                  borderRadius: BorderRadius.circular(30.r),



                                                )
                                            ),
                                          ),
                                          Slidable(child:  InkWell(
                                            onTap: (){
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TOfferRide(server.uservehicleid)));
                                            },
                                            child: Container(
                                              height: 130.h,
                                              width: 414.w,
                                              decoration: (
                                                  BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(24.r),
                                                    border:Border.all(color: Colors.grey.shade400),

                                                    boxShadow: [BoxShadow(
                                                        color: Colors.grey,
                                                        blurRadius: 3,
                                                        offset: Offset(0,1)

                                                    )
                                                    ],

                                                  )
                                              ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Text("Vehicle Type",style: TextStyle(
                                                              color: Color(0xff020744),
                                                              fontFamily: "Franklin_Gothic",

                                                              fontSize: 18.sp
                                                          ),),
                                                          SizedBox(height: 30.h,),
                                                          Text("Vehicle Number",style: TextStyle(
                                                              color: Color(0xff020744),
                                                              fontFamily: "Franklin_Gothic",

                                                              fontSize: 18.sp
                                                          ),),
                                                        ],
                                                      ),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Text(":",style: TextStyle(
                                                              color: Color(0xff020744),
                                                              fontFamily: "Franklin_Gothic",

                                                              fontSize: 18.sp
                                                          ),),
                                                          SizedBox(height: 30.h,),
                                                          Text(":",style: TextStyle(
                                                              color: Color(0xff020744),
                                                              fontFamily: "Franklin_Gothic",

                                                              fontSize: 18.sp
                                                          ),),
                                                        ],
                                                      ),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("${server.typename}",style: TextStyle(
                                                              color: Color(0xff020744),
                                                              fontFamily: "Franklin_Gothic",

                                                              fontSize: 18.sp
                                                          ),),
                                                          SizedBox(height: 30.h,),
                                                          Text("${server.vehicleno}",style: TextStyle(

                                                              color: Color(0xff020744),
                                                              fontFamily: "Franklin_Gothic",

                                                              fontSize: 18.sp
                                                          ),),

                                                        ],
                                                      )
                                                    ],
                                                  )



                                                ],
                                              ),

                                            ),
                                          ),actionPane: SlidableBehindActionPane(),
                                            actionExtentRatio: 0.20,
                                            secondaryActions: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(24.r),

                                                  color: Color(0xff020744),

                                                ),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [

                                                    IconButton(onPressed:() async {
                                                      print("aaaaaaa");
                                                      final Removeuservehiclemodel user = await removeUservehicle().removeuservehicle(server.uservehicleid);

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
                                                        icon:Icon( CupertinoIcons.delete_solid,color: Colors.white,)),

                                                    IconButton(onPressed: (){
                                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditVehcleDetails(server.uservehicleid)));

                                                    }, icon:Icon( CupertinoIcons.doc_text_fill,color: Colors.white,)),   ],
                                                ),
                                              )

                                            ],),
                                        ]
                                    ),

                                  ],
                                ),
                              );
                            },



                          ):Center(child: Text("Data Not Found"));

                        }),
                  ),
                  Container(
                    margin: EdgeInsets.only(right:10.w,left: 10.w),

                    decoration: BoxDecoration(
                        color: Colors.white
                    ),
                    child: Padding(
                      padding:  EdgeInsets.only(right:20.w,left: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                                                      onTap: () {
                                                        Navigator.of(context).push(MaterialPageRoute(
                                                            builder: (context) =>
                                                                AllParcelRequestList()));
                                                      },
                                                      child: Container(
                                                       // margin: EdgeInsets.only(top: 30),
                                                        alignment: Alignment.center,
                                                        height:
                                                            50.h,
                                                        width:
                                                            180.w,
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
                                                          "All Parcel Request",
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
                ],
              )


          ),
        ),


      ),
    );
    //   Scaffold(
    //     appBar: AppBar(
    //       backgroundColor: Color(0xff060E57),
    //       leading: IconButton(
    //           padding: EdgeInsets.zero,
    //           onPressed: () {
    //             Navigator.pop(context);
    //           },
    //           icon: Icon(
    //             Icons.arrow_back_ios,
    //             color: Colors.white,
    //           )),
    //       title: Text(
    //         "Added Vehicles List",
    //         style: TextStyle(fontFamily: "Franklin_Gothic"),
    //       ),
    //       centerTitle: true,
    //       elevation: 0,
    //     ),
    // body: Container(
    //
    // margin: EdgeInsets.only(right: 7,left: 7),
    // decoration: BoxDecoration(
    // color: Colors.white,
    // borderRadius: BorderRadius.circular(40)
    // ),
    // child: Padding(
    // padding:  EdgeInsets.only(top: 20),
    // child: Stack(
    // children: [
    //
    // FutureBuilder<Getvehicles>(future: getVehicles().getvehicles(regid),
    // builder: (context,snapshot){
    // return (snapshot.hasData)?ListView.builder(
    // itemCount: snapshot.data!.detail.length,
    // itemBuilder: (context,index){
    // var server = snapshot.data!.detail[index];
    // return Padding(
    // padding: EdgeInsets.only(right: 15,left: 15),
    // child: Column(
    // children: [
    // SizedBox(
    // height: MediaQuery.of(context).size.height*0.05,
    // ),
    //
    // Stack(
    // children:[
    // Container(
    // height: MediaQuery.of(context).size.height*0.13,
    // width: MediaQuery.of(context).size.width,
    // decoration: (
    // BoxDecoration(
    // color: Color(0xff020744),
    // borderRadius: BorderRadius.circular(24),
    //
    //
    //
    // )
    // ),
    // ),
    // Slidable(child:  InkWell(
    // onTap: (){
    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TOfferRide()));
    // },
    // child: Container(
    // height: MediaQuery.of(context).size.height*0.13,
    // width: MediaQuery.of(context).size.width,
    // decoration: (
    // BoxDecoration(
    // color: Colors.white,
    // borderRadius: BorderRadius.circular(24),
    // border:Border.all(color: Colors.grey.shade400),
    //
    // boxShadow: [BoxShadow(
    // color: Colors.grey,
    // blurRadius: 3,
    // offset: Offset(0,1)
    //
    // )
    // ],
    //
    // )
    // ),
    // child: Column(
    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    // children: [
    // Row(
    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    // children: [
    // Column(
    // crossAxisAlignment: CrossAxisAlignment.start,
    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    // children: [
    // Text("Vehicle Type",style: TextStyle(
    // color: Color(0xff020744),
    // fontFamily: "Franklin_Gothic",
    //
    // fontSize: 18
    // ),),
    // SizedBox(height: MediaQuery.of(context).size.height*0.035,),
    // Text("Vehicle Number",style: TextStyle(
    // color: Color(0xff020744),
    // fontFamily: "Franklin_Gothic",
    //
    // fontSize: 18
    // ),),
    // ],
    // ),
    // Column(
    // crossAxisAlignment: CrossAxisAlignment.start,
    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    // children: [
    // Text(":",style: TextStyle(
    // color: Color(0xff020744),
    // fontFamily: "Franklin_Gothic",
    //
    // fontSize: 18
    // ),),
    // SizedBox(height: MediaQuery.of(context).size.height*0.035,),
    // Text(":",style: TextStyle(
    // color: Color(0xff020744),
    // fontFamily: "Franklin_Gothic",
    //
    // fontSize: 18
    // ),),
    // ],
    // ),
    // Column(
    // crossAxisAlignment: CrossAxisAlignment.start,
    // children: [
    // Text("${server.typename}",style: TextStyle(
    // color: Color(0xff020744),
    // fontFamily: "Franklin_Gothic",
    //
    // fontSize: 18
    // ),),
    // SizedBox(height: MediaQuery.of(context).size.height*0.015,),
    // Text("${server.vehicleno}",style: TextStyle(
    //
    // color: Color(0xff020744),
    // fontFamily: "Franklin_Gothic",
    //
    // fontSize: 18
    // ),),
    //
    // ],
    // )
    // ],
    // )
    //
    //
    //
    // ],
    // ),
    //
    // ),
    // ),actionPane: SlidableBehindActionPane(),
    // actionExtentRatio: 0.20,
    // secondaryActions: [
    // Container(
    //
    //
    //
    // decoration: BoxDecoration(
    // borderRadius: BorderRadius.circular(24),
    //
    // color: Color(0xff020744),
    //
    // ),
    // child: Column(
    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    // children: [
    //
    // IconButton(onPressed: (){
    //
    // }, icon:Icon( CupertinoIcons.delete_solid,color: Colors.white,)),
    // IconButton(onPressed: (){}, icon:Icon( CupertinoIcons.doc_text_fill,color: Colors.white,)),
    // ],
    // ),
    // )
    //
    // ],),
    // ]
    // ),
    //
    // ],
    // ),
    // );
    // },
    //
    //
    //
    // ):Center(child: CircularProgressIndicator());
    //
    // }),
    // Container(
    // margin: EdgeInsets.only(right:10,left: 10),
    //
    // decoration: BoxDecoration(
    // color: Colors.white
    // ),
    // child: Padding(
    // padding: const EdgeInsets.only(right:20,left: 20),
    // child:InkWell(
    //                           onTap: () {
    //                             Navigator.of(context).push(MaterialPageRoute(
    //                                 builder: (context) =>
    //                                     AllParcelRequestList()));
    //                           },
    //                           child: Container(
    //                             margin: EdgeInsets.only(top: 30),
    //                             alignment: Alignment.center,
    //                             height:
    //                                 MediaQuery.of(context).size.height * 0.06,
    //                             width:
    //                                 MediaQuery.of(context).size.width * 0.4,
    //                             decoration: BoxDecoration(
    //                                 borderRadius: BorderRadius.circular(25),
    //                                 gradient: LinearGradient(
    //                                     begin: Alignment.topCenter,
    //                                     end: Alignment.bottomCenter,
    //                                     colors: [
    //                                       Color(0xff060E57),
    //                                       Color(0xff010311)
    //                                     ])),
    //                             child: Text(
    //                               "All Parcel Request",
    //                               style: TextStyle(
    //                                   fontFamily: "Franklin_Gothic",
    //                                   color: Color(0xffFFFFFF),
    //                                   fontSize: 20),
    //                             ),
    //                           ),
    //                         ),
    // ),
    // ),
    // ],
    // )
    //
    //
    // ),
    // ),
    // );
        // body: Container(
        //   decoration: BoxDecoration(
        //       gradient: LinearGradient(
        //           begin: Alignment.topCenter,
        //           end: Alignment.bottomCenter,
        //           colors: [Color(0xff060E57), Color(0xff010311)])),
        //   child: Container(
        //     height: MediaQuery.of(context).size.height,
        //     margin: EdgeInsets.only(right: 7, left: 7),
        //     decoration: BoxDecoration(
        //         color: Colors.white, borderRadius: BorderRadius.circular(40)),
        //     child: FutureBuilder<Getvehicles?>(
        //         future: getVehicles().getvehicles(regid),
        //         builder: (context, snapshot) {
        //           return ListView.builder(
        //               itemCount: snapshot.data!.detail.length,
        //               itemBuilder: (context, index) {
        //                 var server = snapshot.data!.detail[index];
        //
        //                 return Padding(
        //                   padding: const EdgeInsets.only(right: 15, left: 15),
        //                   child: Column(
        //                     children: [
        //
        //                       SizedBox(
        //                         height:
        //                             MediaQuery.of(context).size.height * 0.03,
        //                       ),
        //                       Stack(children: [
        //                         Container(
        //                           height:
        //                               MediaQuery.of(context).size.height * 0.13,
        //                           width: MediaQuery.of(context).size.width,
        //                           decoration: (BoxDecoration(
        //                             color: Color(0xff020744),
        //                             borderRadius: BorderRadius.circular(24),
        //                           )),
        //                         ),
        //                         Slidable(
        //                           child: InkWell(
        //                             onTap: () {
        //                               Navigator.of(context).push(
        //                                   MaterialPageRoute(
        //                                       builder: (context) =>
        //                                           TOfferRide()));
        //                             },
        //                             child: Container(
        //                               height:
        //                                   MediaQuery.of(context).size.height *
        //                                       0.13,
        //                               width: MediaQuery.of(context).size.width,
        //                               decoration: (BoxDecoration(
        //                                 color: Colors.white,
        //                                 borderRadius: BorderRadius.circular(24),
        //                                 border: Border.all(
        //                                     color: Colors.grey.shade400),
        //                                 boxShadow: [
        //                                   BoxShadow(
        //                                       color: Colors.grey,
        //                                       blurRadius: 3,
        //                                       offset: Offset(0, 1))
        //                                 ],
        //                               )),
        //                               child: Column(
        //                                 mainAxisAlignment:
        //                                     MainAxisAlignment.spaceEvenly,
        //                                 children: [
        //                                   Row(
        //                                     mainAxisAlignment:
        //                                         MainAxisAlignment.spaceEvenly,
        //                                     children: [
        //                                       Column(
        //                                         crossAxisAlignment:
        //                                             CrossAxisAlignment.start,
        //                                         mainAxisAlignment:
        //                                             MainAxisAlignment
        //                                                 .spaceEvenly,
        //                                         children: [
        //                                           Text(
        //                                             "Vehicle Type",
        //                                             style: TextStyle(
        //                                                 color:
        //                                                     Color(0xff020744),
        //                                                 fontFamily:
        //                                                     "Franklin_Gothic",
        //                                                 fontSize: 18),
        //                                           ),
        //                                           SizedBox(
        //                                             height:
        //                                                 MediaQuery.of(context)
        //                                                         .size
        //                                                         .height *
        //                                                     0.035,
        //                                           ),
        //                                           Text(
        //                                             "Vehicle Number",
        //                                             style: TextStyle(
        //                                                 color:
        //                                                     Color(0xff020744),
        //                                                 fontFamily:
        //                                                     "Franklin_Gothic",
        //                                                 fontSize: 18),
        //                                           ),
        //                                         ],
        //                                       ),
        //                                       Column(
        //                                         crossAxisAlignment:
        //                                             CrossAxisAlignment.start,
        //                                         mainAxisAlignment:
        //                                             MainAxisAlignment
        //                                                 .spaceEvenly,
        //                                         children: [
        //                                           Text(
        //                                             ":",
        //                                             style: TextStyle(
        //                                                 color:
        //                                                     Color(0xff020744),
        //                                                 fontFamily:
        //                                                     "Franklin_Gothic",
        //                                                 fontSize: 18),
        //                                           ),
        //                                           SizedBox(
        //                                             height:
        //                                                 MediaQuery.of(context)
        //                                                         .size
        //                                                         .height *
        //                                                     0.035,
        //                                           ),
        //                                           Text(
        //                                             ":",
        //                                             style: TextStyle(
        //                                                 color:
        //                                                     Color(0xff020744),
        //                                                 fontFamily:
        //                                                     "Franklin_Gothic",
        //                                                 fontSize: 18),
        //                                           ),
        //                                         ],
        //                                       ),
        //                                       Column(
        //                                         crossAxisAlignment:
        //                                             CrossAxisAlignment.start,
        //                                         children: [
        //                                           Text(
        //                                             "${server.typename}",
        //                                             style: TextStyle(
        //                                                 color:
        //                                                     Color(0xff020744),
        //                                                 fontFamily:
        //                                                     "Franklin_Gothic",
        //                                                 fontSize: 18),
        //                                           ),
        //                                           SizedBox(
        //                                             height:
        //                                                 MediaQuery.of(context)
        //                                                         .size
        //                                                         .height *
        //                                                     0.035,
        //                                           ),
        //                                           Text(
        //                                             "${server.vehicleno}",
        //                                             style: TextStyle(
        //                                                 color:
        //                                                     Color(0xff020744),
        //                                                 fontFamily:
        //                                                     "Franklin_Gothic",
        //                                                 fontSize: 18),
        //                                           ),
        //                                         ],
        //                                       )
        //                                     ],
        //                                   )
        //
        //                                   // SizedBox(
        //                                   //   height: MediaQuery.of(context).size.height*0.03,
        //                                   // ),
        //                                 ],
        //                               ),
        //                             ),
        //                           ),
        //                           actionPane: SlidableBehindActionPane(),
        //                           actionExtentRatio: 0.20,
        //                           secondaryActions: [
        //                             Padding(
        //                               padding: const EdgeInsets.symmetric(
        //                                   horizontal: 4.0),
        //                               child: Container(
        //                                 decoration: BoxDecoration(
        //                                   borderRadius:
        //                                       BorderRadius.circular(24),
        //                                   color: Color(0xff020744),
        //                                 ),
        //                                 child: Column(
        //                                   mainAxisAlignment:
        //                                       MainAxisAlignment.spaceEvenly,
        //                                   children: [
        //                                     IconButton(
        //                                         onPressed: () {},
        //                                         icon: Icon(
        //                                           CupertinoIcons.delete_solid,
        //                                           color: Colors.white,
        //                                         )),
        //                                     IconButton(
        //                                         onPressed: () {},
        //                                         icon: Icon(
        //                                           CupertinoIcons.doc_text_fill,
        //                                           color: Colors.white,
        //                                         )),
        //                                   ],
        //                                 ),
        //                               ),
        //                             )
        //                           ],
        //                         ),
        //                       ]),
        //                     ],
        //                   ),
        //                 );
        //               });
        //         }),
        //   ),
        // ));
  }
}
