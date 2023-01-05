import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/getvehicleoffermodel.dart';
import 'package:lechalo/models/getvehicles.dart';
import 'package:lechalo/models/removeuservehiclemodel.dart';
import 'package:lechalo/screens/vehicle/addVehicle.dart';
import 'package:lechalo/screens/vehicle/bidList.dart';
import 'package:lechalo/screens/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../updateVehicle.dart';

class CAddedVehicle extends StatefulWidget {


  @override
  _CAddedVehicleState createState() => _CAddedVehicleState();
}

class _CAddedVehicleState extends State<CAddedVehicle> {
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
    super.initState();
    getNamePreference().then((id) {
      setState(() {
        regid = id;
        print("??????????????????????????");
        print(regid);
      });
    });
     Future<Getvehicles> user = getVehicles().getvehicles(regid) ;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      endDrawer: DrawerView(),
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
        height: 900.h,
        width: 414.w,
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
          height: 814.h,
          width: 414.w,
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
                    padding:  EdgeInsets.only(top:40.h),
                    child: FutureBuilder<Getvehicleoffermodel>(future: getvehicleOffer().getvehicleoffer(regid,"hireVehicle"),
                        builder: (context,snapshot){
                          return (snapshot.hasData)?
                          ListView.builder(
                            itemCount: snapshot.data!.detail.length,
                            itemBuilder: (context,index){
                              var server = snapshot.data!.detail[index];
                              return Padding(
                                padding: EdgeInsets.only(right: 15.w,left: 15.w),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 15.h,
                                    ),

                                    Stack(
                                        children:[
                                          Container(
                                            height: 140.h,
                                            width: 414.w,
                                            decoration: (
                                                BoxDecoration(
                                                  color: Color(0xff020744),
                                                  borderRadius: BorderRadius.circular(24.r),
                                                )
                                            ),
                                          ),
                                          Slidable(
                                            child:  Container(
                                            height: 140.h,
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
                                                        SizedBox(height: 35.h,),
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
                                                        SizedBox(height: 35.h,),
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
                                                        Text(server.typename.toString(),style: TextStyle(
                                                            color: Color(0xff020744),
                                                            fontFamily: "Franklin_Gothic",

                                                            fontSize: 18.sp
                                                        ),),

                                                        SizedBox(height: 35.h,),
                                                        Text(server.vehicleno.toString(),style: TextStyle(

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

                                                    }, icon:Icon( CupertinoIcons.doc_text_fill,color: Colors.white,)),  ],
                                                ),
                                              )

                                            ],),
                                        ]
                                    ),

                                  ],
                                ),
                              );
                            },



                          ):Center(child: Text("Data Not Foundx"));

                        }),
                  ),
                  Container(
                    margin: EdgeInsets.only(right:7.w,left: 7.w),

                    decoration: BoxDecoration(
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(right:20.w,left: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){

                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddVehicle()));
                            },
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffD60000),
                                    boxShadow: [BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 3,
                                        offset: Offset(0,1)

                                    )
                                    ],
                                  ),
                                  child: Icon(Icons.add,color: Colors.white,),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0.h),
                                  child: Text("Add New Vehicle",style: TextStyle(
                                      color: Color(0xff020744),
                                      fontFamily: "Franklin_Gothic",
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 18.sp

                                  ),),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BidList()));
                            },
                            child: Row(
                              children: [
                                Container(decoration: BoxDecoration(

                                  boxShadow: [BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 27,
                                      offset: Offset(0,3)

                                  )
                                  ],
                                ),child: Icon(Icons.remove_red_eye,color: Color(0xff21B1DC),)),
                                Padding(
                                  padding: EdgeInsets.all(8.0.h),
                                  child: Text("My Bid List",style: TextStyle(
                                      color: Color(0xff020744),
                                      fontFamily: "Franklin_Gothic",
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 18.sp
                                  ),),
                                )


                              ],
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
    // return  Scaffold(
    //   endDrawer: DrawerView(),
    //   appBar: AppBar(
    //     backgroundColor: Color(0xff060E57),
    //     leading: IconButton(padding: EdgeInsets.zero,onPressed: () {
    //       Navigator.pop(context);
    //     }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),
    //
    //
    //     title: Text("Added Vehicles List",style: TextStyle(
    //         fontFamily: "Franklin_Gothic"
    //     ),),
    //     centerTitle: true,
    //     elevation: 0,
    //
    //   ),
    //   body: Container(
    //     decoration: BoxDecoration(
    //         gradient: LinearGradient(
    //             begin: Alignment.topCenter,
    //             end: Alignment.bottomCenter,
    //             colors: [
    //               Color(0xff060E57),
    //               Color(0xff010311)
    //             ]
    //         )
    //     ),
    //     child: Container(
    //       height: MediaQuery.of(context).size.height,
    //       margin: EdgeInsets.only(right: 7,left: 7),
    //       decoration: BoxDecoration(
    //           color: Colors.white,
    //           borderRadius: BorderRadius.circular(40)
    //       ),
    //       child: Padding(
    //         padding: const EdgeInsets.only(top: 20),
    //         child: ListView(
    //             padding: EdgeInsets.only(right: 15,left: 15),
    //             children:[ Column(
    //
    //               children: [
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     InkWell(
    //                       onTap: (){
    //                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddVehicle()));
    //                       },
    //                       child: Row(
    //                         children: [
    //                           Container(
    //                             decoration: BoxDecoration(
    //                                 shape: BoxShape.circle,
    //                                 color: Color(0xffD60000)
    //                             ),
    //                             child: Icon(Icons.add,color: Colors.white,),
    //                           ),
    //                           Padding(
    //                             padding: const EdgeInsets.all(8.0),
    //                             child: Text("Add New Vehicle",style: TextStyle(
    //                                 color: Color(0xff020744),
    //                                 fontFamily: "Franklin_Gothic",
    //                                 fontWeight: FontWeight.bold,
    //                                 fontSize: 18
    //
    //                             ),),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                     InkWell(
    //                       onTap: (){
    //                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BidList()));
    //                       },
    //                       child: Row(
    //                         children: [
    //                           Icon(Icons.remove_red_eye,color: Color(0xff21B1DC),),
    //                           Padding(
    //                             padding: const EdgeInsets.all(8.0),
    //                             child: Text("My Bid List",style: TextStyle(
    //                                 color: Color(0xff020744),
    //                                 fontFamily: "Franklin_Gothic",
    //                                 fontWeight: FontWeight.bold,
    //                                 fontSize: 18
    //                             ),),
    //                           )
    //
    //
    //                         ],
    //                       ),
    //                     ),
    //
    //
    //                   ],
    //                 ),
    //                 SizedBox(
    //                   height: MediaQuery.of(context).size.height*0.05,
    //                 ),
    //                 Container(
    //                   height: MediaQuery.of(context).size.height*0.15,
    //                   width: MediaQuery.of(context).size.width,
    //                   decoration: (
    //                       BoxDecoration(
    //                         color: Colors.white,
    //                         borderRadius: BorderRadius.circular(24),
    //                         border:Border.all(color: Colors.grey.shade400),
    //
    //                         boxShadow: [BoxShadow(
    //                             color: Colors.grey,
    //                             blurRadius: 3,
    //                             offset: Offset(0,1)
    //
    //                         )
    //                         ],
    //
    //                       )
    //                   ),
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                     children: [
    //                       Text("Vehicle Type :      Sedan Car",style: TextStyle(
    //                           color: Color(0xff020744),
    //                           fontFamily: "Franklin_Gothic",
    //
    //                           fontSize: 18
    //                       ),),
    //                       // SizedBox(
    //                       //   height: MediaQuery.of(context).size.height*0.03,
    //                       // ),
    //                       Text("Vehicle Number :    GJ 01 AK 007",style: TextStyle(
    //                           color: Color(0xff020744),
    //                           fontFamily: "Franklin_Gothic",
    //
    //                           fontSize: 18
    //                       ),),
    //                     ],
    //                   ),
    //
    //                 ),
    //                 SizedBox(
    //                   height: MediaQuery.of(context).size.height*0.03,
    //                 ),
    //                 Container(
    //                   height: MediaQuery.of(context).size.height*0.15,
    //                   width: MediaQuery.of(context).size.width,
    //                   decoration: (
    //                       BoxDecoration(
    //                         color: Colors.white,
    //                         borderRadius: BorderRadius.circular(24),
    //                         border:Border.all(color: Colors.grey.shade400),
    //
    //                         boxShadow: [BoxShadow(
    //                             color: Colors.grey,
    //                             blurRadius: 3,
    //                             offset: Offset(0,1)
    //
    //                         )
    //                         ],
    //
    //                       )
    //                   ),
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                     children: [
    //                       Text("Vehicle Type :      Sedan Car",style: TextStyle(
    //                           color: Color(0xff020744),
    //                           fontFamily: "Franklin_Gothic",
    //
    //                           fontSize: 18
    //                       ),),
    //                       // SizedBox(
    //                       //   height: MediaQuery.of(context).size.height*0.03,
    //                       // ),
    //                       Text("Vehicle Number :    GJ 01 AK 007",style: TextStyle(
    //                           color: Color(0xff020744),
    //                           fontFamily: "Franklin_Gothic",
    //
    //                           fontSize: 18
    //                       ),),
    //                     ],
    //                   ),
    //
    //                 ),
    //                 SizedBox(
    //                   height: MediaQuery.of(context).size.height*0.03,
    //                 ),
    //                 Container(
    //                   height: MediaQuery.of(context).size.height*0.15,
    //                   width: MediaQuery.of(context).size.width,
    //                   decoration: (
    //                       BoxDecoration(
    //                         color: Colors.white,
    //                         borderRadius: BorderRadius.circular(24),
    //                         border:Border.all(color: Colors.grey.shade400),
    //
    //                         boxShadow: [BoxShadow(
    //                             color: Colors.grey,
    //                             blurRadius: 3,
    //                             offset: Offset(0,1)
    //
    //                         )
    //                         ],
    //
    //                       )
    //                   ),
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                     children: [
    //                       Text("Vehicle Type :      Sedan Car",style: TextStyle(
    //                           color: Color(0xff020744),
    //                           fontFamily: "Franklin_Gothic",
    //
    //                           fontSize: 18
    //                       ),),
    //                       // SizedBox(
    //                       //   height: MediaQuery.of(context).size.height*0.03,
    //                       // ),
    //                       Text("Vehicle Number :    GJ 01 AK 007",style: TextStyle(
    //                           color: Color(0xff020744),
    //                           fontFamily: "Franklin_Gothic",
    //
    //                           fontSize: 18
    //                       ),),
    //                     ],
    //                   ),
    //
    //                 )
    //               ],
    //             ),
    //             ]
    //         ),
    //       ),
    //     ),
    //
    //
    //   ),
    // );

  }
}
