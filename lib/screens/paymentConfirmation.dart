import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/bookingmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentConfirmation extends StatefulWidget {
  String distance,seats,fare,userid,oferid;
  PaymentConfirmation (this.distance,this.seats,this.fare,this.userid,this.oferid,{Key? key}):super(key: key);


  @override
  _PaymentConfirmationState createState() => _PaymentConfirmationState();
}

class _PaymentConfirmationState extends State<PaymentConfirmation> {
  double? gst;
  double? total;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     gst = (double.parse(widget.fare)*18)/100;
     total = double.parse(widget.fare)+gst!;
  }
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
          "Payment Confirmation",
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
        child: ListView(
            children:[ Container(
              height: 800.h,
              margin: EdgeInsets.only(right: 7.w, left: 7.w),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40.r)),
              child: Padding(
                padding:  EdgeInsets.only(right: 40.h,left:40.h ),
                child: Column(


                  children: [
                    SizedBox(
                      height: 70.h,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text("Distance",style: TextStyle(
                              color: Color(0xff020744),
                              fontFamily: "Franklin_Gothic",


                              fontSize: 18.sp
                          ),),
                          SizedBox(
                            height: 30.h,
                          ),Text("Seats",style: TextStyle(
                              color: Color(0xff020744),
                              fontFamily: "Franklin_Gothic",


                              fontSize: 18.sp
                          ),),
                          SizedBox(
                            height: 30.h,
                          ),Text("Price Per Km",style: TextStyle(
                              color: Color(0xff020744),
                              fontFamily: "Franklin_Gothic",


                              fontSize: 18.sp
                          ),),
                          SizedBox(
                            height: 30.h,
                          ),Text("Non GST Fare",style: TextStyle(
                              color: Color(0xff020744),
                              fontFamily: "Franklin_Gothic",


                              fontSize: 18.sp
                          ),),
                          SizedBox(
                            height: 30.h,
                          ),Text("Added 18% GST",style: TextStyle(
                              color: Color(0xff020744),
                              fontFamily: "Franklin_Gothic",


                              fontSize: 18.sp
                          ),),
                          SizedBox(
                            height: 30.h,
                          ),
                          Text("Share Status",style: TextStyle(
                              color: Color(0xff020744),
                              fontFamily: "Franklin_Gothic",


                              fontSize: 18.sp
                          ),),

                        ],),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.distance,style: TextStyle(
                                color: Color(0xff020744),
                                fontFamily: "Franklin_Gothic",


                                fontSize: 18.sp
                            ),),
                            SizedBox(
                              height: 30.h,
                            ),Text(widget.seats,style: TextStyle(
                                color: Color(0xff020744),
                                fontFamily: "Franklin_Gothic",


                                fontSize: 18.sp
                            ),),
                            SizedBox(
                              height: 30.h,
                            ),Text("-",style: TextStyle(
                                color: Color(0xff020744),
                                fontFamily: "Franklin_Gothic",


                                fontSize: 18.sp
                            ),),
                            SizedBox(
                              height: 30.h,
                            ),Text(widget.fare,style: TextStyle(
                                color: Color(0xff020744),
                                fontFamily: "Franklin_Gothic",


                                fontSize: 18.sp
                            ),),
                            SizedBox(
                              height: 30.h,
                            ),Text(gst.toString(),style: TextStyle(
                                color: Color(0xff020744),
                                fontFamily: "Franklin_Gothic",


                                fontSize: 18.sp
                            ),),
                            SizedBox(
                              height: 30.h,
                            ),
                            Text("-",style: TextStyle(
                                color: Color(0xff020744),
                                fontFamily: "Franklin_Gothic",


                                fontSize: 18.sp
                            ),),

                          ],)
                      ],
                    ),
                    SizedBox(
                      height: 15.w,
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 1.5,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Amount",style: TextStyle(
                            color: Color(0xff020744),
                            fontFamily: "Franklin_Gothic",


                            fontSize: 18.sp
                        ),), Text(total.toString(),style: TextStyle(
                            color: Color(0xff020744),
                            fontFamily: "Franklin_Gothic",


                            fontSize: 18.sp
                        ),),
                      ],
                    ),
                    SizedBox(
                      height: 90.h,
                    ),
                    InkWell(
                      onTap: () async{
final Bookingmodel user = await Booking().booking(widget.userid, widget.oferid, widget.seats,total.toString(),"1","");
if(user.status=="success") {
  setState(() {
    Fluttertoast.showToast(
      msg: user.msg.toString(),
      backgroundColor: Color(0xff060E57),
      textColor: Colors.white,
    );
  });
  Navigator.of(context).pop(build(context));
  Navigator.of(context).pop(build(context));
  Navigator.of(context).pop(build(context));
  //Navigator.of(context).pop(build(context));
}
else{
  print(
    "error"
  );
}




                      },
                      child: Container(
                        // margin: EdgeInsets.only(top: 30),
                        alignment: Alignment.center,
                        height: 50.h,
                        width: 120.w,
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
                          "Confirm",
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
            ]
        ),
      ),
    );
  }
}








