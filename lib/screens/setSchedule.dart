import 'package:day_picker/day_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/newoffermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:flutter/cupertino.dart';

//import 'package:weekday_selector/weekday_selector.dart';
//import 'package:weekday_selector/weekday_selector.dart';

class SetSchedule extends StatefulWidget {
  String iVehicleID,
      dLeaveLong,
      dLeaveLat,
      dDestLong,
      dDestLat,
      vLeaveAddress,
      vDestAddress,
      eOfferPriceType,
      dOfferRate,
      seats,
      type,
      distance;

  SetSchedule(
      this.iVehicleID,
      this.dLeaveLong,
      this.dLeaveLat,
      this.dDestLong,
      this.dDestLat,
      this.vLeaveAddress,
      this.vDestAddress,
      this.eOfferPriceType,
      this.dOfferRate,
      this.seats,
      this.type,
      this.distance,
      {Key? key})
      : super(key: key);

  @override
  _SetScheduleState createState() => _SetScheduleState();
}

class _SetScheduleState extends State<SetSchedule> {
  late List weekDays;

  var monthlyPickerDay;

//  late List<String> result = [];
  var daysPicker = DateTime.now().day;
  var monthlyPicker = [DateTime.now()];
  var singleDayPicker = DateTime.now();
  var _timePicker = DateTime.now();
  bool singleDay = false;
  bool monthly = false;
  bool customDay = false;
  bool su = false;
  bool m = false;
  bool t = false;
  bool w = false;
  bool th = false;
  bool f = false;
  bool sa = false;
  var data;
  var datepicked;

  int passengers = 1;
  String? id;
  String? regid;
  String? schedule_ride_by;

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
    print(widget.distance);
  }

  @override
  Widget build(BuildContext context) {
    var formatDate = DateFormat.Hm().format(_timePicker);
    var formatSinglDate = DateFormat.yMMMd().format(singleDayPicker);

    //var formatMonthlylDate=DateFormat.d().format(monthlyPicker[DateTime.now().day]);

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
          "Set Schedule",
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
          margin: EdgeInsets.only(right: 7, left: 7),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40)),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListView(
                padding: EdgeInsets.only(right: 40, left: 40),
                children: [
                  Column(
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
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: Center(
                            child: Text(
                              "Single Day Trip",
                              style: TextStyle(
                                  fontFamily: "Franklin_Gothic",
                                  color: Color(0xff060E57),
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
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
                                      right: 7, left: 7),
                                  height: MediaQuery.of(context)
                                      .size
                                      .height *
                                      0.4,
                                  width: MediaQuery.of(context)
                                      .size
                                      .width,
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
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "or",
                        style: TextStyle(
                            fontFamily: "Franklin_Gothic",
                            color: Color(0xff060E57),
                            fontSize: 14),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
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
                          width: MediaQuery.of(context).size.width * 0.43,
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
                            borderRadius: BorderRadius.circular(20)),
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
                                        right: 7, left: 7),
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.4,
                                    width:
                                    MediaQuery.of(context).size.width,
                                    child: SfDateRangePicker(
                                      view: DateRangePickerView.month,
                                      monthFormat: ' ',
                                      minDate: DateTime(2022,1,1,0,0,0),
                                      maxDate: DateTime(2022,1,31,0,0,0),
                                      selectionMode:
                                      DateRangePickerSelectionMode
                                          .multiple,
                                      onSelectionChanged:
                                      _onSelectionChanged,
                                    )));
                          },
                          readOnly: true,
                        ),
                      )
                          : Container(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "or",
                        style: TextStyle(
                            fontFamily: "Franklin_Gothic",
                            color: Color(0xff060E57),
                            fontSize: 14),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            singleDay = false;
                            monthly = false;
                          });
                          showCupertinoModalPopup(
                              context: context,
                              builder: (context) => Container(
                                decoration:
                                BoxDecoration(color: Colors.white),
                                margin: EdgeInsets.only(right: 7, left: 7),
                                height: MediaQuery.of(context).size.height *
                                    0.4,
                                width: MediaQuery.of(context).size.width,
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
                          width: MediaQuery.of(context).size.width * 0.43,
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
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "What time will you pick passanger ?",
                        style: TextStyle(
                            fontFamily: "Franklin_Gothic",
                            color: Color(0xff060E57),
                            fontSize: 14),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: CupertinoDatePicker(
                            initialDateTime: DateTime.now(),
                            onDateTimeChanged: (dateTime) {
                              setState(() {
                                _timePicker = dateTime;
                              });
                            },
                            mode: CupertinoDatePickerMode.time,
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
                        height: 26,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff060E57),
                                  Color(0xff010311)
                                ])),
                        child: Center(
                          child: Text(
                            "${formatDate}",
                            style: TextStyle(
                                fontFamily: "Franklin_Gothic",
                                color: Color(0xffFFFFFF),
                                fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "So how many Lechalo passengers can you take ?",
                        style: TextStyle(
                            fontFamily: "Franklin_Gothic",
                            color: Color(0xff060E57),
                            fontSize: 14),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (passengers < int.parse(widget.seats)) {
                                  passengers++;
                                }
                              });
                            },
                            icon: Icon(Icons.add_circle_outline),
                            color: Color(0xff0E1DA7),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      InkWell(
                        onTap: () async {
                          //  double total = 0;
                          // total += distance.as(
                          //   LengthUnit.Kilometer,
                          //   LatLng(double.parse(widget.dLeaveLat),
                          //       double.parse(widget.dLeaveLong)),
                          //   LatLng(double.parse(widget.dDestLat),
                          //       double.parse(widget.dDestLong)),
                          // );
                          print(widget.distance.toString());
                          print(widget.iVehicleID);
                          print(regid);
                          print(widget.dLeaveLong);
                          print(widget.dLeaveLat);
                          print(widget.dDestLong);
                          print(widget.dDestLat);
                          print(datepicked.toString());
                          print(_timePicker.toString());
                          print(widget.seats);
                          print(widget.type);
                          print(widget.vLeaveAddress);
                          print(widget.vDestAddress);
                          print(widget.dOfferRate);
                          print(widget.eOfferPriceType);
                          print(schedule_ride_by);
                          print(datepicked);
                          final Newoffermodel user = await Newoffer().newoffer(
                              widget.iVehicleID,
                              regid,
                              widget.dLeaveLong,
                              widget.dLeaveLat,
                              widget.dDestLong,
                              widget.dDestLat,
                              "0.0",
                              "0.0",
                              datepicked.toString(),
                              _timePicker.toString(),
                              passengers.toString(),
                              widget.distance,
                              widget.distance,
                              widget.distance,
                              widget.type,
                              widget.vLeaveAddress,
                              widget.vDestAddress,
                              "",
                              widget.vDestAddress,
                              widget.vLeaveAddress,
                              "",
                              widget.dOfferRate,
                              widget.eOfferPriceType,
                              schedule_ride_by,
                              datepicked.toString()
                          );
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
                          //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AVRouteDetails()));
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 30),
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
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
                                fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  //void _onSelectionChanged(DateRangePickerSelectionChangedArgs dateRangePickerSelectionChangedArgs)

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

      //datepicked=result2.join(",");
      // print(datepicked);
      data = result.join(",");
      datepicked=data;
      // print(data);
    });
  }
}

Widget RaisedButton({onPressed,padding,child,color,shape}){
  return InkWell(
    onTap: onPressed,
    child: Container(
      padding: padding,
      decoration: BoxDecoration(
        shape: shape,
        color: color
      ),
    ),
  );
}