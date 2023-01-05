import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lechalo/screens/contactsEntry.dart';
import 'package:lechalo/screens/paymentConfirmation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShareRideStatus extends StatefulWidget {
String distance,seats,fare,userid,oferid;
ShareRideStatus (this.distance,this.seats,this.fare,this.userid,this.oferid,{Key? key}):super(key: key);


  @override
  _ShareRideStatusState createState() => _ShareRideStatusState();
}

class _ShareRideStatusState extends State<ShareRideStatus> {
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
          "Share Ride Status",
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
        child: ListView (
          children:[ Container(
            height: 800.h,
            margin: EdgeInsets.only(right: 7.w, left: 7.w),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(40.r)),
            child: Column(
              children: [
                SizedBox(
                  height: 70.h,
                ),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ContactsEntry(widget.distance,widget.seats,widget.fare,widget.userid,widget.oferid)));
                  },
                  child: Container(
                    height: 120.h,
                    width: 310.w,
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
                    child: Row(

                      children: [
                        Container(
                          height:80.h,
                          width:90.w ,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/secure ride.png")
                            )
                          ),
                        ),
                        SizedBox(
                          width: 40.w,
                        ),
                        Text("Secure Your Ride",style: TextStyle(
                            color: Color(0xff020744),
                            fontFamily: "Franklin_Gothic",
                            fontWeight: FontWeight.bold,

                            fontSize: 18.sp
                        ),),

                      ],
                    ),



                  ),
                ),


                SizedBox(
                  height: 30.h,
                ),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PaymentConfirmation(widget.distance,widget.seats,widget.fare,widget.userid,widget.oferid)));
                  },
                  child: Container(
                    height: 120.h,
                    width: 310.w,
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
                    child: Row(

                      children: [
                        Container(
                          height:80.h,
                          width:90.w ,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/continue.png")
                              )
                          ),
                        ),
                        SizedBox(
                          width: 40.w,
                        ),
                        Text("Continue",style: TextStyle(
                            color: Color(0xff020744),
                            fontFamily: "Franklin_Gothic",
                            fontWeight: FontWeight.bold,

                            fontSize: 18.sp
                        ),),

                      ],
                    ),



                  ),
                ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.15,
                // ),
                //  Container(
                //   height: MediaQuery.of(context).size.height*0.3,
                //   width: MediaQuery.of(context).size.width*0.85,
                //   decoration: (
                //       BoxDecoration(
                //         color: Colors.white,
                //
                //         border:Border.all(color: Colors.grey.shade300),
                //
                //
                //
                //
                //       )
                //   ),
                //   child:Padding(
                //     padding: const EdgeInsets.only(top: 20.0),
                //     child: Column(
                //       children: [
                //         SizedBox(
                //           height: MediaQuery.of(context).size.height * 0.03,
                //         ),
                //         Text("Note",style: TextStyle(
                //             color: Color(0xff020744),
                //             fontFamily: "Franklin_Gothic",
                //             fontWeight: FontWeight.bold,
                //
                //             fontSize: 18
                //         ),),
                //         Padding(
                //           padding: const EdgeInsets.only(
                //             right: 10,
                //             left: 10,
                //             top: 10
                //           ),
                //           child: Column(
                //             children: [
                //               Text("If you want to share your ride status, then it will cost 2 Rs. Extra in your total amount.",style: TextStyle(
                //                 color: Color(0xff931818),
                //                 fontWeight: FontWeight.bold
                //               ),),
                //               SizedBox(
                //                 height: MediaQuery.of(context).size.height * 0.03,
                //               ),
                //               Text("If you click on continue, then there will be no additional charges will be added in your total amount.",style: TextStyle(
                //                   color: Color(0xff931818),
                //                   fontWeight: FontWeight.bold
                //               ),)
                //             ],
                //           ),
                //         )
                //
                //       ],
                //     ),
                //   )
                //
                //
                //
                // ),

              ],
            ),
          ),
      ]
        ),
      ),
    );
  }
}



