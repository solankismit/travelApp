import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/bookinglist.dart';
import 'package:lechalo/models/cancelbookingmodel.dart';
import 'package:lechalo/models/cancelreasonlistmodel.dart';
import 'package:lechalo/models/givedriverratemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBooking extends StatefulWidget {


  @override
  _MyBookingState createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking> {
  String? bookingid;
  String? regid;
  late Future<Bookinglist?> data;
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

    print(bookingid);
    print("bookingid");

  }
  int _Rvalue1=1;
  _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaY: 40, sigmaX: 40),
            child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Container(
                  height: 320.h,
                  width: 300.w,
                  child: FutureBuilder<Cancelreasonlistmodel>(future: cancelReasonlist().cancelreasonlist(),builder: (context,snapshot) {
                    return (snapshot.hasData)?Padding(
                      padding: EdgeInsets.only(top: 30.0.h),
                      child: Column(
                        children: [
                          Text(
                            "Select a reason for rejecting ride",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Franklin_Gothic",
                                fontWeight: FontWeight.bold,
                                fontSize: 17.sp),
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: 20.0.w),
                            child: Row(
                              children: [
                                Radio(
                                  activeColor: Colors.black,

                                  value: int.parse(bookingid!),
                                  groupValue: _Rvalue1,

                                  onChanged: (value)async {

                                    final Cancelbookingmodel user = await cancelBooking()
                                        .cancelbooking(value.toString());

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
                                  }
          ),
                                Text(
                                 "${snapshot.data!.data[0].text}",
                                  style: TextStyle(
                                      fontFamily: "Franklin_Gothic",

                                      fontSize: 19.sp),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0.w),
                            child: Row(
                              children: [
                                Radio(

                                  activeColor: Colors.black,

                                  value: int.parse(bookingid!),
                                  groupValue: _Rvalue1,
                                    onChanged: (value)async {

                                      final Cancelbookingmodel user = await cancelBooking()
                                          .cancelbooking(value.toString());

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
                                    }
                                ),
                                Text(
                                  "${snapshot.data!.data[1].text}",
                                  style: TextStyle(
                                      fontFamily: "Franklin_Gothic",

                                      fontSize: 19.sp),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),


                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 40.h,
                              width: 90.w,
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
                                "Cancel",
                                style: TextStyle(
                                    fontFamily: "Franklin_Gothic",
                                    color: Color(0xffFFFFFF),
                                    fontSize: 20.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ):Center(child: CircularProgressIndicator());
                  }
                  ),
                )),
          );
        });
  }

  void _showRatingDialog(String offerid) {
    final _dialog = RatingDialog(
      // your app's name?
      title: Text('Rating Dialog'),
      // encourage your user to leave a high rating?
      message: Text('Tap a star to set your rating. Add more description here if you want.'),
      // your app's logo?
    //  image:Image.asset("assets/splash.jpg",height: 150.h,width: 150.w,),
      submitButtonText: 'Submit',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) async{
        print('rating: ${response.rating}, comment: ${response.comment}');

        final Givedriverratemodel user =await giveDriverrate().givedriverrate(regid,offerid, response.rating.toString(), regid, response.comment);
print(user.msg);
      },
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => _dialog,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff060E57),
        leading: IconButton(padding: EdgeInsets.zero,onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),


        title: Text("My Booking",style: TextStyle(
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
          height: 810.h,
          width: 414.w,
          margin: EdgeInsets.only(right: 7.w,left: 7.w),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40.r)
          ),
          child: Padding(
            padding:  EdgeInsets.all(15.h),
            child:  FutureBuilder<Bookinglist>(future: bookingList().bookinglist(regid),
                builder: (context,snapshot){
                  return (snapshot.hasData)?ListView.builder(
                      itemCount: snapshot.data!.detail.length,
                      itemBuilder: (context,index){
                        var server = snapshot.data!.detail[index];
                        return Column(

        children: [


          Container(
              height: 255.h,
              width: 414.w,
              decoration: (
                  BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.r),
                    border: Border.all(color: Colors.grey.shade400),

                    boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3,
                        offset: Offset(0, 1)

                    )
                    ],

                  )
              ),
              child: Padding(
                padding:  EdgeInsets.only(
                    right: 25.w, left: 25.w),
                child: Stack(
                  children: [
                    Positioned(top: 5.h,
                      right: 5.w,
                      left: 5.w,
                      bottom: 38.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Total Fare", style: TextStyle(
                                  color: Color(0xff020744),
                                  fontFamily: "Franklin_Gothic",

                                  fontSize: 18.sp
                              ),),
                              // SizedBox(
                              //   height: MediaQuery.of(context).size.height*0.03,
                              // ),


                              Text("From", style: TextStyle(
                                  color: Color(0xff020744),
                                  fontFamily: "Franklin_Gothic",

                                  fontSize: 18.sp
                              ),),
                              Text("To", style: TextStyle(
                                  color: Color(0xff020744),
                                  fontFamily: "Franklin_Gothic",

                                  fontSize: 18.sp
                              ),),


                              Text("${server.goDate.day}/${server.goDate.month}/${server.goDate.year}", style: TextStyle(
                                  color: Color(0xff020744),
                                  fontFamily: "Franklin_Gothic",

                                  fontSize: 18.sp
                              ),),


                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${server.totalfare}", style: TextStyle(
                                  color: Color(0xff020744),
                                  fontFamily: "Franklin_Gothic",

                                  fontSize: 18.sp
                              ),),


                              Text("${server.leavecity}", style: TextStyle(
                                  color: Color(0xff020744),
                                  fontFamily: "Franklin_Gothic",

                                  fontSize: 18.sp
                              ),),
                              Text("${server.destcity}", style: TextStyle(
                                  color: Color(0xff020744),
                                  fontFamily: "Franklin_Gothic",

                                  fontSize: 18.sp
                              ),),

                              Text("${server.goTime}", style: TextStyle(
                                  color: Color(0xff020744),
                                  fontFamily: "Franklin_Gothic",

                                  fontSize: 18.sp
                              ),),



                            ],
                          ),
                        ],
                      ),),
                        (server.goDate.isAtSameMomentAs(DateTime.now()) || server.goDate.isBefore(DateTime.now())) ?
                    Positioned(top: 200.h, right: (server.ratingStatus ==0)?50.w:90.w,child: Row(

                      children: [
                        InkWell(
                          onTap: (){

                          },
                          child: Container(

                            alignment: Alignment.center,
                            height: 45.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.r),
                                color: Colors.grey
                            ),
                            child: Text(
                              "Expired",
                              style: TextStyle(
                                  fontFamily: "Franklin_Gothic",
                                  color: Colors.black,
                                  fontSize: 20.sp),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 25.w,
                        ),
                        (server.ratingStatus == 0)? InkWell(
                          onTap: () {
                            final offeringid=server.offerid;

                           _showRatingDialog(offeringid);
                            // bookingid=server.bookingrequestid;
                            // _showDialog();
                          },
                          child: Container(

                            alignment: Alignment.center,
                            height: 45.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.sp),
                         gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                     Color(0xff060E57),
                                      Color(0xff010311)
                                    ])),
                            child: Text(
                              "Give Rate",
                              style: TextStyle(
                                  fontFamily: "Franklin_Gothic",
                                  color:  Color(0xffFFFFFF),
                                  fontSize: 20.sp),
                            ),
                          ),
                        ):Container(),
                      ],
                    )

                    ):
                        Positioned(
                          top: 200.h, right: 110.w,
                          child: InkWell(
                            onTap: () {
                              bookingid=server.bookingrequestid;
                              _showDialog();
                            },
                            child: Container(

                              alignment: Alignment.center,
                              height: 45.h,
                              width: 100.w,
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
                                "Cancel",
                                style: TextStyle(
                                    fontFamily: "Franklin_Gothic",
                                    color: Color(0xffFFFFFF),
                                    fontSize: 20.sp),
                              ),
                            ),
                          ),
                        ),
                  ],
                ),


              )
          ),
          SizedBox(height: 15.sp,),
        ],
      );
    }
    ):Center(child:Text("Data Not Found"),);
    }
          ),
        ),
      ),
      )
    );
  }
}