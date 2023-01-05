

import 'package:day_picker/day_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/pickparceldetailsmodel.dart';
import 'package:lechalo/screens/setSchedule.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TSetSchedule extends StatefulWidget {
  String  iVehicleID, dLeaveLong, dLeaveLat, dDestLong, dDestLat, vLeaveAddress, vDestAddress, eOfferPriceType, dOfferRate;
  TSetSchedule(this.iVehicleID,this.dLeaveLong,this.dLeaveLat,this.dDestLong,this.dDestLat,this.vLeaveAddress,this.vDestAddress ,this.eOfferPriceType, this.dOfferRate,{Key? key}):super(key: key);



  @override
  _TSetScheduleState createState() => _TSetScheduleState();
}

class _TSetScheduleState extends State<TSetSchedule> {
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
  String? schedule_ride_by;
  var monthlyPickerDay;
  var data;
  var monthlyPicker = [DateTime.now()];
  var singleDayPicker=DateTime.now();
  var _timePicker=DateTime.now();
  var datepicked;
  bool singleDay=false;
  bool monthly=false;
  bool customDay=false;
  int passengers= 1;
  TextEditingController _load =TextEditingController();
  TextEditingController _lbh=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var formatDate = DateFormat.Hm().format(_timePicker);
    var formatSinglDate = DateFormat.yMMMd().format(singleDayPicker);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff060E57),
        leading: IconButton(padding: EdgeInsets.zero, onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),


        title: Text("Set Schedule", style: TextStyle(
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
            child: ListView(
                padding: EdgeInsets.only(right: 40.w, left: 40.w),
                children: [ Column(

                  children: [
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          singleDay = !singleDay;
                          monthly = false;
                        });

                        // showDatePicker(context: context, initialDate: DateTime.now(), firstDate:DateTime.now(), lastDate: DateTime(2222));
                      },
                      padding: EdgeInsets.zero,
                      child: Container(
                        height: 45.h,
                        width: 200.w,
                        child: Center(
                          child: Text(
                            "Single Day Trip",
                            style: TextStyle(
                                fontFamily: "Franklin_Gothic",
                                color: Color(0xff060E57),
                                fontSize: 16.sp),
                          ),
                        ),
                      ),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r)),
                    ),
                    singleDay
                        ? Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "${formatSinglDate}"),
                        onTap: () {
                          setState(() {
                            schedule_ride_by = "";
                          });

                          print(schedule_ride_by);
                          showCupertinoModalPopup(
                              context: context,
                              builder: (context) => Container(
                                margin: EdgeInsets.only(
                                    right: 7.w, left: 7.w),
                                  height: 300.h,
                                  width: 414.w,
                                child: CupertinoDatePicker(
                                  minimumDate: DateTime.now(),
                                  backgroundColor: Colors.white,
                                  initialDateTime: DateTime.now(),
                                  onDateTimeChanged: (dateTime) {
                                    setState((){
                                      singleDayPicker = dateTime;
                                    });
                                    print(DateFormat('yyyy-MM-dd').format(dateTime).toString());
                                    datepicked =DateFormat('dd-MM-yyyy').format(singleDayPicker);
                                  },
                                  mode:
                                  CupertinoDatePickerMode.date,
                                ),
                              ));
                        },
                        readOnly: true,
                      ),
                    )
                        : Container(),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "or",
                      style: TextStyle(
                          fontFamily: "Franklin_Gothic",
                          color: Color(0xff060E57),
                          fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          monthly = !monthly;
                          singleDay = false;
                          formatSinglDate = "";
                        });
                      },
                      padding: EdgeInsets.zero,
                      child: Container(
                        height: 45.h,
                        width: 200.w,
                        child: Center(
                          child: Text(
                            "Monthly Trip",
                            style: TextStyle(
                                fontFamily: "Franklin_Gothic",
                                color: Color(0xff060E57),
                                fontSize: 16),
                          ),
                        ),
                      ),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r)),
                    ),
                    monthly
                        ? Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: (data),
                        ),
                        onTap: () {
                          schedule_ride_by = "date";
                          showCupertinoModalPopup(
                              context: context,
                              builder: (context) => Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white),
                                  margin: EdgeInsets.only(
                                      right: 7.w, left: 7.w),
                                  height: 300.h,
                                  width:
                                  414.w,
                                  child:
                                  // SfDateRangePicker(
                                  //   view: DateRangePickerView.month,
                                  //   monthFormat: ' ',
                                  //   minDate: DateTime(2022,1,1,0,0,0),
                                  //   maxDate: DateTime(2022,1,31,0,0,0),
                                  //   selectionMode:
                                  //   DateRangePickerSelectionMode
                                  //       .multiple,
                                  //   onSelectionChanged:
                                  //   _onSelectionChanged,
                                  // )
                                  SfDateRangePicker(
                                    view: DateRangePickerView.month,
                                    monthViewSettings:DateRangePickerMonthViewSettings(blackoutDates:[DateTime(2020, 03, 26)],
                                        weekendDays: [7,6],
                                        specialDates:[DateTime(2020, 03, 20),DateTime(2020, 03, 16),DateTime(2020,03,17)],
                                        showTrailingAndLeadingDates: true),
                                    monthCellStyle: DateRangePickerMonthCellStyle(
                                      blackoutDatesDecoration: BoxDecoration(
                                          color: Colors.red,
                                          border: Border.all(color: const Color(0xFFF44436), width: 1),
                                          shape: BoxShape.circle),
                                      // weekendDatesDecoration: BoxDecoration(
                                      //     color: const Color(0xFFDFDFDF),
                                      //     border: Border.all(color: const Color(0xFFB6B6B6), width: 1),
                                      //     shape: BoxShape.circle),
                                      specialDatesDecoration: BoxDecoration(
                                          color: Colors.green,
                                          border: Border.all(color: const Color(0xFF2B732F), width: 1),
                                          shape: BoxShape.circle),
                                      blackoutDateTextStyle: TextStyle(color: Colors.white, decoration: TextDecoration.lineThrough),
                                      specialDatesTextStyle: const TextStyle(color: Colors.white),
                                    ),
                                      selectionMode:
                                      DateRangePickerSelectionMode
                                          .multiple,
                                      onSelectionChanged:
                                      _onSelectionChanged,
                                  )
                              ));
                        },
                        readOnly: true,
                      ),
                    )
                        : Container(),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "or",
                      style: TextStyle(
                          fontFamily: "Franklin_Gothic",
                          color: Color(0xff060E57),
                          fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          singleDay = true;
                          monthly = false;
                        });
                        showCupertinoModalPopup(
                            context: context,
                            builder: (context) => Container(
                              decoration:
                              BoxDecoration(color: Colors.white),
                              margin: EdgeInsets.only(right: 7.w, left: 7.w),
                              height: 300.h,
                              width: 414.w,
                              child: SelectWeekDays(
                                border: true,
                                boxDecoration: BoxDecoration(),
                                daysFillColor: Color(0xff060E57),
                                daysBorderColor: Color(0xff060E57),
                                selectedDayTextColor: Colors.white,
                                unSelectedDayTextColor: Color(0xff060E57),
                                onSelect: (values) {

                                  print(values);
                                  // <== Callback to handle the selected days
                                  var data = values.join(",");
                                  print(data);
                                  this.datepicked = data;
                                  schedule_ride_by="day";
                                },
                              ),

//                               Center(
//                                 child:Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                   children: [
// GestureDetector(
//   onTap: (){
//     setState(() {
//       su=!su;
//     });
//
//   },
//   child: Container(
//     height: MediaQuery.of(context).size.height*0.1,
//     width: MediaQuery.of(context).size.width*0.1,
//     decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: su?Color(0xff060E57):Colors.white,
//         boxShadow: [
//           BoxShadow(
//               color: Colors.grey,
//               offset: Offset(0,1),
//               blurRadius: 1,
//               spreadRadius:1
//           )
//         ]
//     ),
//     child: Center(
//       child: Text("S", style: TextStyle(
//           fontFamily: "Franklin_Gothic",
//           color: Color(0xff060E57),
//           fontSize:20 ),),
//     ),
//   ),
// ),
// GestureDetector(
//   child: Container(
//     height: MediaQuery.of(context).size.height*0.1,
//     width: MediaQuery.of(context).size.width*0.1,
//     decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//               color: Colors.grey,
//               offset: Offset(0,1),
//               blurRadius: 1,
//               spreadRadius:1
//           )
//         ]
//     ),
//     child: Center(
//       child: Text("M", style: TextStyle(
//           fontFamily: "Franklin_Gothic",
//           color: Color(0xff060E57),
//           fontSize:20 ),),
//     ),
//   ),
// ),
//                                     GestureDetector(
//                                       child: Container(
//                                         height: MediaQuery.of(context).size.height*0.1,
//                                         width: MediaQuery.of(context).size.width*0.1,
//                                         decoration: BoxDecoration(
//                                             shape: BoxShape.circle,
//                                             color: Colors.white,
//                                             boxShadow: [
//                                               BoxShadow(
//                                                   color: Colors.grey,
//                                                   offset: Offset(0,1),
//                                                   blurRadius: 1,
//                                                   spreadRadius:1
//                                               )
//                                             ]
//                                         ),
//                                         child: Center(
//                                           child: Text("T", style: TextStyle(
//                                               fontFamily: "Franklin_Gothic",
//                                               color: Color(0xff060E57),
//                                               fontSize:20 ),),
//                                         ),
//                                       ),
//                                     ),
//                                     GestureDetector(
//                                       child: Container(
//                                         height: MediaQuery.of(context).size.height*0.1,
//                                         width: MediaQuery.of(context).size.width*0.1,
//                                         decoration: BoxDecoration(
//                                             shape: BoxShape.circle,
//                                             color: Colors.white,
//                                             boxShadow: [
//                                               BoxShadow(
//                                                   color: Colors.grey,
//                                                   offset: Offset(0,1),
//                                                   blurRadius: 1,
//                                                   spreadRadius:1
//                                               )
//                                             ]
//                                         ),
//                                         child: Center(
//                                           child: Text("W", style: TextStyle(
//                                               fontFamily: "Franklin_Gothic",
//                                               color: Color(0xff060E57),
//                                               fontSize:20 ),),
//                                         ),
//                                       ),
//                                     ),
//                                     GestureDetector(
//                                       child: Container(
//                                         height: MediaQuery.of(context).size.height*0.1,
//                                         width: MediaQuery.of(context).size.width*0.1,
//                                         decoration: BoxDecoration(
//                                             shape: BoxShape.circle,
//                                             color: Colors.white,
//                                             boxShadow: [
//                                               BoxShadow(
//                                                   color: Colors.grey,
//                                                   offset: Offset(0,1),
//                                                   blurRadius: 1,
//                                                   spreadRadius:1
//                                               )
//                                             ]
//                                         ),
//                                         child: Center(
//                                           child: Text("T", style: TextStyle(
//                                               fontFamily: "Franklin_Gothic",
//                                               color: Color(0xff060E57),
//                                               fontSize:20 ),),
//                                         ),
//                                       ),
//                                     ),
//                                     GestureDetector(
//                                       child: Container(
//                                         height: MediaQuery.of(context).size.height*0.1,
//                                         width: MediaQuery.of(context).size.width*0.1,
//                                         decoration: BoxDecoration(
//                                             shape: BoxShape.circle,
//                                             color: Colors.white,
//                                             boxShadow: [
//                                               BoxShadow(
//                                                   color: Colors.grey,
//                                                   offset: Offset(0,1),
//                                                   blurRadius: 1,
//                                                   spreadRadius:1
//                                               )
//                                             ]
//                                         ),
//                                         child: Center(
//                                           child: Text("F", style: TextStyle(
//                                               fontFamily: "Franklin_Gothic",
//                                               color: Color(0xff060E57),
//                                               fontSize:20 ),),
//                                         ),
//                                       ),
//                                     ),
//                                     GestureDetector(
//                                       child: Container(
//                                         height: MediaQuery.of(context).size.height*0.1,
//                                         width: MediaQuery.of(context).size.width*0.1,
//                                         decoration: BoxDecoration(
//                                             shape: BoxShape.circle,
//                                             color: Colors.white,
//                                             boxShadow: [
//                                               BoxShadow(
//                                                   color: Colors.grey,
//                                                   offset: Offset(0,1),
//                                                   blurRadius: 1,
//                                                   spreadRadius:1
//                                               )
//                                             ]
//                                         ),
//                                         child: Center(
//                                           child: Text("S", style: TextStyle(
//                                               fontFamily: "Franklin_Gothic",
//                                               color: Color(0xff060E57),
//                                               fontSize:20 ),),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//
//                               )
                            ));
                      },
                      padding: EdgeInsets.zero,
                      child: Container(
                        height: 45.h,
                        width: 200.w,
                        child: Center(
                          child: Text(
                            "Custom Days Trip",
                            style: TextStyle(
                                fontFamily: "Franklin_Gothic",
                                color: Color(0xff060E57),
                                fontSize: 16),
                          ),
                        ),
                      ),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r)),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "What time will you pick passanger ?",
                      style: TextStyle(
                          fontFamily: "Franklin_Gothic",
                          color: Color(0xff060E57),
                          fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                        height: 150.h,
                        width: 200.w ,


                        child:CupertinoDatePicker(
                          initialDateTime:DateTime.now(), onDateTimeChanged: (dateTime) {
                          setState(() {
                            _timePicker=dateTime;
                          });
                        } ,
                          mode: CupertinoDatePickerMode.time,
                        )

                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      height: 26.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.r),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff060E57),
                                Color(0xff010311)
                              ])
                      ),
                      child: Center(
                        child: Text(
                          "${formatDate}",
                          style: TextStyle(
                              fontFamily: "Franklin_Gothic",
                              color: Color(0xffFFFFFF),
                              fontSize: 18.sp),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),


                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _load,
                      decoration: InputDecoration(
                        hintText: "Capacity Of Load ?",
                        hintStyle: TextStyle(

                           // fontWeight: FontWeight.bold,
                            fontFamily: "Franklin_Gothic"
                        ),

                      ),
                      onChanged: (data){

                      },
                    ),
                    SizedBox(height: 10.h,),

                    TextFormField(
                      controller: _lbh,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Dimension Of Vehicle (LBH) ?",
                        hintStyle: TextStyle(

                           // fontWeight: FontWeight.bold,
                            fontFamily: "Franklin_Gothic"
                        ),

                      ),
                      onChanged: (data){

                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    InkWell(
                      onTap: () async {
                        print("aaaaaaa");
                        final Pickparceldetailsmodel user = await pickParceldetails().pickparceldetails(regid, widget.iVehicleID, widget.dLeaveLong, widget.dLeaveLat,widget.dDestLong, widget.dDestLat, widget.vLeaveAddress, widget.vDestAddress, widget.vLeaveAddress,widget.vDestAddress, widget.eOfferPriceType, widget.dOfferRate, _load.text,_lbh.text, "1",datepicked.toString(), _timePicker.toString(), schedule_ride_by,datepicked);
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
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            });
                          }
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 30.h,bottom: 10.h),
                        alignment: Alignment.center,
                        height:34.h,
                        width:100.w,
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
                ]
            ),
          ),
        ),


      ),
    );
  }

  void _onSelectionChanged(
      DateRangePickerSelectionChangedArgs dateRangePickerSelectionChangedArgs) {
    setState(() {
      monthlyPicker = dateRangePickerSelectionChangedArgs.value;
      // print(monthlyPicker);

      List<String> result = [];
      List<String> result2 = [];
      for (var date in monthlyPicker){
        monthlyPickerDay = DateFormat.d().format(date);
        var datepicked2=DateFormat('dd-MM-yyyy').format(date);
        result2.add(datepicked2);

        result.add(monthlyPickerDay);
      }
      datepicked=result2.join(",");
      print(datepicked);
      data = result.join(",");
      print(data);
    });
  }
}
