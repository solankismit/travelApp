
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/constant.dart';
import 'package:lechalo/models/addtruckvehiclemodel.dart';
import 'package:lechalo/models/addvehiclemodel.dart';
import 'package:lechalo/models/cartypemodel.dart';
import 'package:lechalo/models/updatevehiclemodel.dart';
import 'package:lechalo/screens/vehicle/idUpload/idProof.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditVehcleDetails extends StatefulWidget {
  String vehicleid;

  EditVehcleDetails(this.vehicleid,{Key? key}):super(key: key);


  @override
  _EditVehcleDetailsState createState() => _EditVehcleDetailsState();
}

class _EditVehcleDetailsState extends State<EditVehcleDetails> {

  List<DropdownMenuItem<String>>? datac;

  Future<Cartypemodel> cartype(type) async {
    var url = apiUrl + "/cartype";
    http.Response response = await http.post(Uri.parse(url),
        body: {
          "type":type,
        });
    var data = jsonDecode(response.body);
    setState(() {
      datac=data;
    });

    print("Response: " + response.body);
    return Cartypemodel.fromJson(data);
  }


  String? carlist;
  String? regid;
  late Future<Addvehiclemodel?> data;
  String? id;

  Future<String?> getNamePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("id");
    return id;
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController _Gj = TextEditingController();
  TextEditingController _01 = TextEditingController();
  TextEditingController _ABZ = TextEditingController();
  TextEditingController _2021 = TextEditingController();
  TextEditingController _pcity1 = TextEditingController();
  TextEditingController _pcity2 = TextEditingController();
  TextEditingController _pcity3 = TextEditingController();
  TextEditingController _vmodel = TextEditingController();

  String _Rvalue1 = "1";
  String _Rvalue2 = "2";
  String _Rvalue3 = "3";
  String _Rvalue4 = "4";


  String _selectedCountry="car";
  var vehicle={'car':'car','bike':'bike','rikshaw':'rikshaw','truck':'truck'};


  List _countries=[];
  CountryDependentDropDown(){
    vehicle.forEach((key, value) {
      _countries.add(key);
    });
  }

  String _selectedState="";
  var vehicleModel={'minicar':'car','suv':'car','bike':'bike','scooty':'bike','rikshaw':'rikshaw','atul':'rikshaw','tata407':'truck','mahindra':'truck'};


  List _states=[];
  StateDependentDropDown(countryShortName){
    vehicleModel.forEach((key, value) {
      if(countryShortName==value){
        _states.add(key);
      }

    });
    _selectedState= _states[0];
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CountryDependentDropDown();
    // getNamePreference().then((id) {
    //   setState(() {
    //     regid = id;
    //     print(regid);
    //     print(widget.vehicleid);
    //     // selected(context);
    //   });
    // });
  }

  // var valueChoose;
  // String? valueChoose2;
  // List listitem = [
  //   "car", "truck", "bike", "rickshaw"
  // ];
  // String value = "";
  // List<DropdownMenuItem<String>> menuitems = [
  //
  // ];
  // bool disabledropdown=true;
  //
  // //List<DropdownMenuItem<String>> menuitems = [];
  //
  // final car = {
  //
  //   "1": "Minicar",
  //   "2": "SUV",
  //   "3": "Sedan",
  //   "4": "Hatchback",
  //   "5": "LUV",
  //   "6": "EECO",
  //   "7": "Tufan"
  // };
  // final truck = {
  //   "1": "Mahindra jeeto",
  //   "2": "TATA 407",
  //   "3": "TATA Ace",
  //   "4": "Bolero Pick up",
  //   "5": "Ashok Layland Dost",
  //   "6": "Force Trump",
  //   "7": "Mahendra Genio",
  //   "8": "Mahindra Truck",
  //   "9": "TATA Xenon",
  //   "10": "TATA Truck",
  //   "11": "Eicher",
  //   "12": "other Truck ",
  //   "13": "Utility Vehicle",
  // };
  // final bike = {
  //   "1": "Bike",
  //   "2": "Scooty",
  //   "3": "SPort Bike",
  //   "4": "Cruiser Bike",
  //   "5": "Electric Bike",
  // };
  // final rickshaw = {
  //   "1": "Rickshaw",
  //   "2": "5 Seater",
  //   "3": "Loding Rickshaw",
  //   "4": "atul",
  //   "5": "piaggio",
  //   "6": "E-Rickshaw",
  //   "7": "E-Loding Rickshaw"
  // };
  // void secondselected(_value){
  //   setState(() {
  //     value = _value;
  //   });
  // }
  // void populateCar() {
  //   for (String key in car.keys) {
  //     menuitems.add(DropdownMenuItem<String>(
  //       child: Center(
  //         child: Text(
  //             "${car[key]}"
  //         ),
  //       ),
  //       value: car[key],
  //     ));
  //   }
  // }
  //
  // void populateTruck() {
  //   for (String key in truck.keys) {
  //     menuitems.add(DropdownMenuItem<String>(
  //       child: Center(
  //         child: Text(
  //             "${truck[key]}"
  //         ),
  //       ),
  //       value: truck[key],
  //     ));
  //   }
  // }
  //
  // void populateBike() {
  //   for (String key in bike.keys) {
  //     menuitems.add(DropdownMenuItem<String>(
  //       child: Center(
  //         child: Text(
  //             "${bike[key]}"
  //         ),
  //       ),
  //       value: bike[key],
  //     ));
  //   }
  // }
  //
  // void populateRickshaw() {
  //   for (String key in rickshaw.keys) {
  //     menuitems.add(DropdownMenuItem<String>(
  //       child: Center(
  //         child: Text(
  //             "${rickshaw[key]}"
  //         ),
  //       ),
  //       value: rickshaw[key],
  //     ));
  //   }
  // }
  //
  // void selected(_value) {
  //   if (_value == "car") {
  //     menuitems = [];
  //     populateCar();
  //   } else if (_value == "truck") {
  //     menuitems = [];
  //     populateTruck();
  //   } else if (_value == "bike") {
  //     menuitems = [];
  //     populateBike();
  //   } else if (_value == "rickshaw") {
  //     menuitems = [];
  //     populateRickshaw();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xff060E57),
        leading: IconButton(padding: EdgeInsets.zero, onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),


        title: Text("Edit Vehicle Detail", style: TextStyle(
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
        child: SingleChildScrollView(
          child: Container(
            height: 810.h,
            width: 414.w,
            margin: EdgeInsets.only(right: 7.w, left: 7.w),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40.r)
            ),
            child: Padding(
              padding:  EdgeInsets.only(top: 20.h),
              child: Form(
                child: ListView(
                    padding: EdgeInsets.only(right: 30.w, left: 30.w, bottom: 20.h),
                    children: [ Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Container(
                          margin:EdgeInsets.all(15),

                          child: Column(

                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 23,),

                              Container(
                                width: 400,
                                child: DropdownButton(
                                  hint: Text("select vehicle            "),
                                  value: _selectedCountry,
                                  onChanged: (newValue){
                                    setState(() {
                                      _states=[];
                                      StateDependentDropDown(vehicle[newValue]);
                                      _selectedCountry="$newValue";
                                    });

                                  },
                                  items:_countries.map((country){
                                    return DropdownMenuItem(
                                      child: new Text(country),
                                      value:country,
                                    );
                                  }).toList(),
                                ),
                              ),
                              SizedBox(height: 23,),


                              Container(
                                width: 400,
                                child: DropdownButton(
                                  hint: Text("select vehicle model"),
                                  value: _selectedState,
                                  onChanged: (newValue){
                                    print(newValue);
                                    setState(() {
                                      print(newValue);
                                      _selectedState="$newValue";
                                    });

                                  },
                                  items:_states.map((state){
                                    return DropdownMenuItem(
                                      child: new Text(state),
                                      value:state,
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),










                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Radio(
                                  activeColor: Colors.green,

                                  value: "Yes",
                                  groupValue: _Rvalue1,
                                  onChanged: (value) {
                                    setState(() {
                                      _Rvalue1 = value.toString();
                                      print(_Rvalue1);
                                    });
                                  },
                                ),
                                Text("AC", style: TextStyle(
                                    color: Color(0xff020744),
                                    fontFamily: "Franklin_Gothic",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp
                                ),),
                              ],
                            ),
                            Text("or", style: TextStyle(
                                color: Color(0xff020744),
                                fontFamily: "Franklin_Gothic",
                                fontWeight: FontWeight.w400,
                                fontSize: 18.sp
                            ),),
                            Row(
                              children: [
                                Radio(
                                  activeColor: Colors.red,

                                  value: "No",
                                  groupValue: _Rvalue1,
                                  onChanged: (value) {
                                    setState(() {

                                      _Rvalue1 = value.toString();
                                      print(_Rvalue1);
                                    });
                                  },
                                ),
                                Text("Non AC", style: TextStyle(
                                    color: Color(0xff020744),
                                    fontFamily: "Franklin_Gothic",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp
                                ),),
                              ],
                            ),

                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text("Is your vehicle available for parcel?",
                          style: TextStyle(
                              color: Color(0xff020744),
                              fontFamily: "Franklin_Gothic",
                              // fontWeight: FontWeight.bold,
                              fontSize: 18.sp
                          ),),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 28.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    activeColor: Colors.green,

                                    value: "Yes",
                                    groupValue: _Rvalue2,
                                    onChanged: (value) {
                                      setState(() {
                                        _Rvalue2 = value.toString();
                                      });
                                    },
                                  ),
                                  Text("Yes", style: TextStyle(
                                      color: Color(0xff020744),
                                      fontFamily: "Franklin_Gothic",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp
                                  ),),
                                ],
                              ),

                              Text("or", style: TextStyle(
                                  color: Color(0xff020744),
                                  fontFamily: "Franklin_Gothic",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp
                              ),),
                              Row(
                                children: [
                                  Radio(
                                    activeColor: Colors.red,

                                    value: "No",
                                    groupValue: _Rvalue2,
                                    onChanged: (value) {
                                      setState(() {
                                        _Rvalue2 = value.toString();
                                      });
                                    },
                                  ),
                                  Text("No", style: TextStyle(
                                      color: Color(0xff020744),
                                      fontFamily: "Franklin_Gothic",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp
                                  ),),
                                ],
                              ),

                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          "Is your vehicle for commercial use?", style: TextStyle(
                            color: Color(0xff020744),
                            fontFamily: "Franklin_Gothic",
                            //fontWeight: FontWeight.bold,
                            fontSize: 18.sp
                        ),),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 29.0.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    activeColor: Colors.green,

                                    value: "Yes",
                                    groupValue: _Rvalue3,
                                    onChanged: (value) {
                                      setState(() {
                                        _Rvalue3 = value.toString();
                                      });
                                    },
                                  ),
                                  Text("Yes", style: TextStyle(
                                      color: Color(0xff020744),
                                      fontFamily: "Franklin_Gothic",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp
                                  ),),
                                ],
                              ),

                              Text("or", style: TextStyle(
                                  color: Color(0xff020744),
                                  fontFamily: "Franklin_Gothic",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp
                              ),),
                              Row(
                                children: [
                                  Radio(
                                    activeColor: Colors.red,
                                    value: "No",
                                    groupValue: _Rvalue3,
                                    onChanged: (value) {
                                      setState(() {
                                        _Rvalue3 = value.toString();
                                      });
                                    },
                                  ),
                                  Text("No", style: TextStyle(
                                      color: Color(0xff020744),
                                      fontFamily: "Franklin_Gothic",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp
                                  ),),
                                ],
                              ),

                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Your vehicle model year is Required';
                            }
                          },
                          controller:_vmodel ,
                          decoration: InputDecoration(
                              hintText: "Your vehicle model year?",
                              hintStyle: TextStyle(
                                  fontFamily: "Franklin_Gothic"
                              )
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Container(

                                height: 45.h,
                                width: 40.w,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Enter";
                                    }
                                  },
                                  controller: _Gj,
                                  textCapitalization: TextCapitalization.characters,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(

                                      hintText: "GJ",
                                      hintStyle: TextStyle(

                                          fontFamily: "Franklin_Gothic")),
                                ),
                                decoration: (
                                    BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5.r),
                                      border: Border.all(
                                          color: Colors.grey.shade400),


                                    )
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            Container(
                              height: 45.h,
                              width: 40.w,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter";
                                  }
                                },
                                controller: _01,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    hintText: "01",
                                    hintStyle: TextStyle(
                                        fontFamily: "Franklin_Gothic")),
                                keyboardType: TextInputType.number,
                              ),
                              decoration: (
                                  BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: Colors.grey.shade400),


                                  )
                              ),
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            Container(
                              height: 45.h,
                              width: 90.w,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter";
                                  }
                                },
                                controller: _ABZ,
                                textCapitalization: TextCapitalization.characters,

                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    hintText: "ABZ",
                                    hintStyle: TextStyle(
                                        fontFamily: "Franklin_Gothic")),
                              ),
                              decoration: (
                                  BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.r),
                                    border: Border.all(
                                        color: Colors.grey.shade400),


                                  )
                              ),
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            Container(
                              height: 45.h,
                              width: 95.w,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter";
                                  }
                                },
                                controller: _2021,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(

                                    hintText: "2021",
                                    hintStyle: TextStyle(
                                        fontFamily: "Franklin_Gothic")),
                                keyboardType: TextInputType.number,

                              ),
                              decoration: (
                                  BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.r),
                                    border: Border.all(
                                        color: Colors.grey.shade400),


                                  )
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text("Service provided in?", style: TextStyle(
                            color: Color(0xff020744),
                            fontFamily: "Franklin_Gothic",
                            //fontWeight: FontWeight.bold,
                            fontSize: 18.sp
                        ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Radio(
                                  activeColor: Colors.green,

                                  value:"City" ,
                                  groupValue: _Rvalue4,
                                  onChanged: (value) {
                                    setState(() {
                                      _Rvalue4 = value.toString();
                                    });
                                  },
                                ),
                                Text("City", style: TextStyle(
                                    color: Color(0xff020744),
                                    fontFamily: "Franklin_Gothic",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp
                                ),),
                              ],
                            ),
                            Text("or", style: TextStyle(
                                color: Color(0xff020744),
                                fontFamily: "Franklin_Gothic",
                                fontWeight: FontWeight.w400,
                                fontSize: 18.sp
                            ),),
                            Padding(
                              padding: EdgeInsets.only(right: 30.0.w),
                              child: Row(
                                children: [
                                  Radio(
                                    activeColor: Colors.green,

                                    value: "Town",
                                    groupValue: _Rvalue4,
                                    onChanged: (value) {
                                      setState(() {
                                        _Rvalue4 = value.toString();
                                      });
                                    },
                                  ),
                                  Text("Town", style: TextStyle(
                                      color: Color(0xff020744),
                                      fontFamily: "Franklin_Gothic",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp
                                  ),),
                                ],
                              ),
                            ),

                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text("Enter service to be provided in which City/Town?",
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "Franklin_Gothic",
                            fontWeight: FontWeight.bold,

                          ),),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter";
                            }
                          },
                          controller: _pcity1,
                          decoration: InputDecoration(
                              hintText: "Preferred City 1",
                              hintStyle: TextStyle(
                                  fontFamily: "Franklin_Gothic"
                              )
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter";
                            }
                          },
                          controller:_pcity2,
                          decoration: InputDecoration(
                              hintText: "Preferred City 2",
                              hintStyle: TextStyle(
                                  fontFamily: "Franklin_Gothic"
                              )
                          ),
                        ),
                        SizedBox(
                          height:20.h,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter";
                            }
                          },
                          controller: _pcity3,
                          decoration: InputDecoration(
                              hintText: "Preferred City 3",
                              hintStyle: TextStyle(
                                  fontFamily: "Franklin_Gothic"
                              )
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        InkWell(
                          onTap: () async{


                            print("aaaaaaa");
                            if(_selectedCountry.toString().trim()=="Truck") {
                               Addtruckvehiclemodel user= await addTruckvehicle().addtruckvehicle(widget.vehicleid,_selectedCountry.toString().trim(), _selectedState.toString().trim(), _Gj.text + _01.text + _ABZ.text + _2021.text, );
                              setState(() async {
                                print("ttt");
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
                            else {
                              final Updatevehiclemodel user = await updateVehicle()
                                  .updatevehicle(
                                  regid,
                                  "1",
                                  _selectedCountry.toString().trim(),
                                  _Gj.text + _01.text + _ABZ.text + _2021.text,
                                  _Rvalue1,
                                  _Rvalue3,
                                  _Rvalue4,
                                  _pcity1.text,
                                  _pcity2.text,
                                  _pcity3.text,
                                  _Rvalue2);


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
                            // }

                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => IdProof()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 50.h),
                            alignment: Alignment.center,
                            height: 40.h,
                            width: 87.w,
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
                              "Update",
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
        ),


      ),
    );
  }
}
