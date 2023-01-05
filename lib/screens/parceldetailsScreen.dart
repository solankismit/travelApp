import 'package:flutter/material.dart';
import 'package:lechalo/screens/editparcel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ParcelDetails extends StatefulWidget {
  String tFromLocation,
      tToLocation,
      vFromCity,
      vToCity,
      dFromLocationLat,
      dFromLocationLong,
      dToLocationLat,
      dToLocationLong,
      tItemName,
      dItemValue,
      dItemWeight,
      eItemSize,
      eWhoWillMeetDriverAtPickupLocation,
      vSenderName,
      vSenderMobile,
      eWhoWillMeetDriverAtDeliveryLocation,
      vReceiverName,
      vReceiverMobile,
      ePickupTime,
      ePickupDateTime,
      eRecieveTime,
      eReceiveDateTime,
      tItemDimention,
      dItemLength,
      dItemWidth,
      dItemHeight,
      tExtraDetails,
      iSenderID,
      iSendParcelID,
  image
  ;

  ParcelDetails(this.dItemHeight, this.dItemWidth, this.dItemLength,
      this.dItemWeight, this.tExtraDetails, this.vReceiverMobile,
      this.vReceiverName, this.vSenderName, this.vToCity, this.vFromCity,
      this.eItemSize, this.tItemName, this.ePickupDateTime, this.ePickupTime,
      this.vSenderMobile, this.tToLocation, this.tFromLocation,
      this.dFromLocationLat, this.dFromLocationLong, this.dItemValue,
      this.dToLocationLat, this.dToLocationLong, this.eReceiveDateTime,
      this.eRecieveTime, this.eWhoWillMeetDriverAtDeliveryLocation,
      this.eWhoWillMeetDriverAtPickupLocation, this.iSenderID,
      this.iSendParcelID, this.tItemDimention,this.image, {Key? key}) : super(key: key);

  @override
  _ParcelDetailsState createState() => _ParcelDetailsState();
}

class _ParcelDetailsState extends State<ParcelDetails> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff060E57),
          leading: IconButton(padding: EdgeInsets.zero, onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),


          title: Text("Parcel Details", style: TextStyle(
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
            height: 814.h,
            margin: EdgeInsets.only(right: 7.w, left: 7.w),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40.r)
            ),
            child: Padding(
                padding: EdgeInsets.only(top: 20.h),
                child:
                ListView(


                    children: [ Column(
                      children: [

                        Padding(
                          padding: EdgeInsets.only(left: 40.w, right: 40.w),
                          child: Column(


                            children: [

                              Container(


                                height: 180.h,
                                width: 200.w,

                                decoration: BoxDecoration(
                                  // image:DecorationImage(
                                  //     image:
                                  //     fit: BoxFit.cover
                                  //
                                  //
                                  //
                                  // ),
                                    border: Border.all(
                                        color: Colors.grey.shade400),
                                    borderRadius: BorderRadius.circular(10.r)
                                ),
                                child:Image.asset("assets/uploadParcel.png"),
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text("Name ", style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 16.sp
                                      ),),
                                      Text(widget.tItemName, style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 16.sp
                                      ),),
                                    ],
                                  ),

                                ],
                              ),
                              SizedBox(height: 13.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text("Parcel size ", style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 16.sp
                                      ),),
                                      Text(widget.eItemSize, style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 15.sp
                                      ),),
                                      SizedBox(height: 13.h),
                                      Text("Pickup Address", style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 16.sp
                                      ),),
                                      Text(
                                        widget.tFromLocation, style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 15.sp
                                      ),),
                                      SizedBox(height: 13.h),
                                      Text("Delivery Address", style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 16.sp
                                      ),),
                                      Text(widget.tToLocation, style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 15.sp
                                      )), SizedBox(height: 13.h),
                                      Text("Sender Details", style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 16.sp
                                      ),),
                                      Text(widget.vSenderName, style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 15.sp
                                      ),), SizedBox(height: 13.h),
                                      Text("Receiver Name ", style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 16.sp
                                      ),),
                                      Text(
                                        widget.vReceiverName, style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 15.sp
                                      ),), SizedBox(height: 13.h),
                                      Text("Receiver No", style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 16.sp
                                      ),),
                                      Text(widget.vReceiverMobile,
                                        style: TextStyle(
                                            color: Color(0xff020744),
                                            fontFamily: "Franklin_Gothic",

                                            fontSize: 15.sp
                                        ),), SizedBox(height: 13.h),
                                      Text("Pickup Time ?", style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 16.sp
                                      ),),
                                      Text(widget.ePickupTime, style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 15.sp
                                      ),), SizedBox(height: 13.h),
                                      Text("Extra Details", style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 16.sp
                                      ),),
                                      Text(
                                        widget.tExtraDetails, style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 15.sp
                                      ),), SizedBox(height: 13.h),
                                      Text("Gross Weight", style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 16.sp
                                      ),),
                                      Text(widget.dItemWeight, style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 15.sp
                                      ),),
                                      SizedBox(height: 13.h),
                                      Text("Dimension", style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 16.sp
                                      ),),
                                      Text(
                                        widget.tItemDimention, style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 15.sp
                                      ),),

                                    ],
                                  ),

                                ],
                              ),


                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) =>
                                    Editparcel(
                                        widget.dItemHeight,
                                        widget.dItemWidth,
                                        widget.dItemLength,
                                        widget.dItemWeight,
                                        widget.tExtraDetails,
                                        widget.vReceiverMobile,
                                        widget.vReceiverName,
                                        widget.vSenderName,
                                        widget.vToCity,
                                        widget.vFromCity,
                                        widget.eItemSize,
                                        widget.tItemName,
                                        widget.ePickupDateTime,
                                        widget.ePickupTime,
                                        widget.vSenderMobile,
                                        widget.tToLocation,
                                        widget.tFromLocation,
                                        widget.dFromLocationLat,
                                        widget.dFromLocationLong,
                                        widget.dItemValue,
                                        widget.dToLocationLat,
                                        widget.dToLocationLong,
                                        widget.eReceiveDateTime,
                                        widget.eRecieveTime,
                                        widget.eWhoWillMeetDriverAtDeliveryLocation,
                                        widget.eWhoWillMeetDriverAtPickupLocation,
                                        widget.iSenderID,
                                        widget.iSendParcelID,
                                        widget.tItemDimention)));
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 30.h, bottom: 10.h),
                            alignment: Alignment.center,
                            height: 37.h,
                            width: 155.w,
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
                              "Edit Details",
                              style: TextStyle(
                                  fontFamily: "Franklin_Gothic",
                                  color: Color(0xffFFFFFF),
                                  fontSize: 20.sp),
                            ),
                          ),
                        ),


                        SizedBox(
                          height: 20.h,
                        ),

                      ],
                    ),
                    ]
                )
            ),


          ),
        ),


      );
  }
}

