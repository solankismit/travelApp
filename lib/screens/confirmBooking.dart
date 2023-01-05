import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/singleoffer1model.dart';
import 'package:lechalo/screens/shareRideStatus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmBooking extends StatefulWidget {
  String offerid;
  ConfirmBooking(this.offerid, {Key? key}) : super(key: key);
  @override
  _ConfirmBookingState createState() => _ConfirmBookingState();
}

class _ConfirmBookingState extends State<ConfirmBooking> {
  String? regid;
  String? regofferid;
double? price;
  String? id;
  String? offerid;

  Future<String?> getNamePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("id");

    return id;
  }

  Future<String?> getOfferPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    offerid = prefs.getString("offerid");
    return offerid;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNamePreference().then((id) {
      print(widget.offerid);
      setState(() {
        regid = id;
        print("bbb:$regid");
      });
    });
    getOfferPreference().then((offerid) {
      setState(() {
        regofferid = offerid;

        print("aaa:$offerid");
      });
    });
  }

  int passengers = 1;

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
          "Confirm Booking",
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
          margin: EdgeInsets.only(right: 7.w, left: 7.w),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40.r
          )),
          child: Padding(
            padding:  EdgeInsets.only(top: 25.h, bottom: 20.h),
            child:

            FutureBuilder<Singleoffer1Model>(
                future: singleOffer1().singleoffer1(regid, widget.offerid),
                builder: (context,snapshot) {
                   if (!snapshot.hasData){
                     print(snapshot.data);

                     return Center(
                       child: Text("No Data Available"),
                     );
                   }
                   if(snapshot.data!.status=="error"){
                     return Center(
                       child: Text("Offer already booked by you"),
                     );
                   }
                   else {
                     if(snapshot.data!.detail!.offerpriceType=="1"){
                       price=double.parse(snapshot.data!.detail!.leaveDestFare!) * int.parse(snapshot.data!.detail!.distance!);
                     }
                     else if(snapshot.data!.detail!.offerpriceType=="0"){
                       price =double.parse(snapshot.data!.detail!.leaveDestFare!) * passengers;
                     }
                     print("aaa");
                   return  ListView(
                         padding: EdgeInsets.only(right: 40.w, left: 40.w),
                         children: [
                           Form(
                             child: Column(
                               children: [
                                 Row(
                                   mainAxisAlignment:
                                   MainAxisAlignment.center,
                                   children: [
                                     Container(
                                       height: 90.h,
                                       width: 90.w,
                                       decoration: BoxDecoration(
                                         image: DecorationImage(
                                             image: AssetImage(
                                                 "assets/user.png")),
                                       ),
                                     ),
                                   ],
                                 ),
                                 SizedBox(height: 20.h,),
                                 Row(
                                   mainAxisAlignment:
                                   MainAxisAlignment.spaceBetween,
                                   children: [
                                     Column(
                                       crossAxisAlignment:
                                       CrossAxisAlignment.start,
                                       children: [
                                         Text(
                                           "Driver Name",
                                           style: TextStyle(
                                               color: Color(0xff020744),
                                               fontFamily: "Franklin_Gothic",
                                               fontSize: 18.sp),
                                         ),
                                         SizedBox(height: 13.h),
                                         Text(
                                           "Departure",
                                           style: TextStyle(
                                               color: Color(0xff020744),
                                               fontFamily: "Franklin_Gothic",
                                               fontSize: 18.sp),
                                         ),
                                         SizedBox(height: 13.h),
                                         Text(
                                           "Destination",
                                           style: TextStyle(
                                               color: Color(0xff020744),
                                               fontFamily: "Franklin_Gothic",
                                               fontSize: 18.sp),
                                         ),
                                         SizedBox(height: 13.h),
                                         Text(
                                           "Departure Time",
                                           style: TextStyle(
                                               color: Color(0xff020744),
                                               fontFamily: "Franklin_Gothic",
                                               fontSize: 18.sp),
                                         ),
                                         SizedBox(height: 13.h),
                                         Text(
                                           "Date",
                                           style: TextStyle(
                                               color: Color(0xff020744),
                                               fontFamily: "Franklin_Gothic",
                                               fontSize: 18.sp),
                                         ),
                                         SizedBox(height: 13.h),
                                         Text(
                                           "Vehicle Type",
                                           style: TextStyle(
                                               color: Color(0xff020744),
                                               fontFamily: "Franklin_Gothic",
                                               fontSize: 18.sp),
                                         ),
                                         SizedBox(height: 13.h),
                                         Text(
                                           "Vehicle Number",
                                           style: TextStyle(
                                               color: Color(0xff020744),
                                               fontFamily: "Franklin_Gothic",
                                               fontSize: 18.sp),
                                         ),
                                         SizedBox(height: 13.h),
                                         Text(
                                           "AC",
                                           style: TextStyle(
                                               color: Color(0xff020744),
                                               fontFamily: "Franklin_Gothic",
                                               fontSize: 18.sp),
                                         ),
                                         SizedBox(height: 13.h),
                                         Text(
                                           "Total Seats",
                                           style: TextStyle(
                                               color: Color(0xff020744),
                                               fontFamily: "Franklin_Gothic",
                                               fontSize: 18.sp),
                                         ),
                                         SizedBox(height: 13.h),
                                         Text(
                                           "Driver Rating",
                                           style: TextStyle(
                                               color: Color(0xff020744),
                                               fontFamily: "Franklin_Gothic",
                                               fontSize: 18.sp),
                                         ),
                                       ],
                                     ),
                                     Column(
                                       crossAxisAlignment:
                                           CrossAxisAlignment.start,
                                       children: [
                                         Text(
                                           "${snapshot.data!.detail!.drivername}",
                                           style: TextStyle(
                                               color: Color(0xff020744),
                                               fontFamily: "Franklin_Gothic",
                                               fontSize: 18.sp),
                                         ),
                                         SizedBox(height: 13.h),
                                         Text(
                                           "${snapshot.data!.detail!.leavecity}",
                                           style: TextStyle(
                                               color: Color(0xff020744),
                                               fontFamily: "Franklin_Gothic",
                                               fontSize: 18.sp),
                                         ),
                                         SizedBox(height: 13.h),
                                         Text(
                                           "${snapshot.data!.detail!.destaddress}",
                                           style: TextStyle(
                                               color: Color(0xff020744),
                                               fontFamily: "Franklin_Gothic",
                                               fontSize: 18.sp),
                                         ),
                                         SizedBox(height: 13.h),
                                         Text(
                                           "${snapshot.data!.detail!.goTime}",
                                           style: TextStyle(
                                               color: Color(0xff020744),
                                               fontFamily: "Franklin_Gothic",
                                               fontSize: 18.sp),
                                         ),
                                         SizedBox(height: 13.h),
                                         Text("${DateFormat("dd/MM/yyyy").format(DateTime.parse(snapshot.data!.detail!.goDate!))}",
                                           //"${snapshot.data!.detail!.goDate.day!}/${snapshot.data!.detail!.goDate!.month}/${snapshot.data!.detail!.goDate.year}",
                                           style: TextStyle(
                                               color: Color(0xff020744),
                                               fontFamily: "Franklin_Gothic",
                                               fontSize: 18.sp),
                                         ),
                                         SizedBox(height: 13.h),
                                         Text(
                                           "${snapshot.data!.detail!.offertype}",
                                           style: TextStyle(
                                               color: Color(0xff020744),
                                               fontFamily: "Franklin_Gothic",
                                               fontSize: 18.sp),
                                         ),
                                         SizedBox(height: 13.h),
                                         Text(
                                           "${snapshot.data!.detail!.vehicleno}",
                                           style: TextStyle(
                                               color: Color(0xff020744),
                                               fontFamily: "Franklin_Gothic",
                                               fontSize: 18.sp),
                                         ),
                                         SizedBox(height: 13.h),
                                         Text(
                                           (snapshot.data!.detail!.actype ==
                                                   "1")
                                               ? "Yes"
                                               : "No",
                                           style: TextStyle(
                                               color: Color(0xff020744),
                                               fontFamily: "Franklin_Gothic",
                                               fontSize: 18.sp),
                                         ),
                                         SizedBox(height: 13.h),
                                         Text(
                                           "${snapshot.data!.detail!.availSeat}",
                                           style: TextStyle(
                                               color: Color(0xff020744),
                                               fontFamily: "Franklin_Gothic",
                                               fontSize: 18.sp),
                                         ),
                                         SizedBox(height: 13.h),

                                         Row(
                                           children: [
                                             Row(
                                               children:
                                                 List.generate(5, (index){
                                                   return Icon(
                                                     index < double.parse(snapshot.data!.detail!.avgRating!).toInt() ? Icons.star : Icons.star_border,
                                                       color: Color(0xff1F08B1),
                                                   size: 18,);
                                                 }
                                                 )

                                                 // Icon(
                                                 //   Icons.star,
                                                 //   color: Color(0xff1F08B1),
                                                 // ),
                                                 // Icon(
                                                 //   Icons.star,
                                                 //   color: Color(0xff1F08B1),
                                                 // ),
                                                 // Icon(
                                                 //   Icons.star,
                                                 //   color: Color(0xff1F08B1),
                                                 // ),
                                                 // Icon(
                                                 //   Icons.star,
                                                 //   color: Color(0xff1F08B1),
                                                 // ),
                                                 // Icon(Icons.star_border)
                                               //],
                                             ),
                                             Text("(${snapshot.data!.detail!.avgRating!})")
                                           ],
                                         )
                                       ],
                                     )
                                   ],
                                 ),
                                 SizedBox(
                                     height:
                                     30.h),
                                 (snapshot.data!.detail!.offerpriceType! == "0")?
                                 Column(
                                   children: [
                                     Text(
                                       "Add Seats",
                                       style: TextStyle(
                                           color: Color(0xff020744),
                                           fontFamily: "Franklin_Gothic",
                                           fontSize: 18.sp),
                                     ),
                                     SizedBox(
                                         height:
                                         23.h),
                                     Row(
                                       mainAxisAlignment:
                                       MainAxisAlignment.center,
                                       children: [
                                         IconButton(
                                           onPressed: () {
                                             setState(() {
                                               if (passengers > 1) {
                                                 passengers--;
                                               }
                                             });
                                           },
                                           icon: Icon(
                                             Icons.remove_circle_outline,
                                             color: Color(0xffFE0505),
                                           ),
                                         ),
                                         Text(
                                           "${passengers}",
                                           style: TextStyle(
                                               fontSize: 18.sp,
                                               fontWeight: FontWeight.bold),
                                         ),
                                         IconButton(
                                           onPressed: () {
                                             setState(() {
                                               if (int.parse(snapshot
                                                   .data!.detail!.availSeat!) >
                                                   passengers) passengers++;
                                             });
                                           },
                                           icon: Icon(Icons.add_circle_outline),
                                           color: Color(0xff0E1DA7),
                                         ),
                                       ],
                                     ),

                                   ],
                                 ):Container(),
                                 SizedBox(height: 13.h),

                                 Padding(
                                   padding:  EdgeInsets.only(right: 50.w),
                                   child: Row(
                                     mainAxisAlignment:
                                     MainAxisAlignment.spaceBetween,
                                     children: [
                                       Text(
                                         "Total Fare",
                                         style: TextStyle(
                                             color: Color(0xff020744),
                                             fontFamily: "Franklin_Gothic",
                                             fontSize: 18.sp),
                                       ),

                                       Text(
                                         "${price}/-",
                                         style: TextStyle(
                                             color: Color(0xff020744),
                                             fontFamily: "Franklin_Gothic",
                                             fontSize: 18.sp),
                                       )
                                     ],
                                   ),
                                 ),
                                 InkWell(
                                   onTap: () {
                                     Navigator.of(context).push(
                                         MaterialPageRoute(
                                             builder: (context) =>
                                                 ShareRideStatus(
                                                     snapshot.data!.detail!
                                                         .distance!.toString(),
                                                     passengers.toString(),
                                                     price.toString(),
                                                 regid.toString(),
                                                   snapshot.data!.detail!
                                                       .offerid!.toString(),)));
                                   },
                                   child: Container(
                                     margin: EdgeInsets.only(top: 30.h),
                                     alignment: Alignment.center,
                                     height: 40.h,
                                     width: 87.w,
                                     decoration: BoxDecoration(
                                         borderRadius:
                                         BorderRadius.circular(25.r),
                                         gradient: LinearGradient(
                                             begin: Alignment.topCenter,
                                             end: Alignment.bottomCenter,
                                             colors: [
                                               Color(0xff060E57),
                                               Color(0xff010311)
                                             ])),
                                     child: Text(
                                       "Next",
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
                         ]);
                   }
                }),
          ),
        ),
      ),
    );
  }
}
