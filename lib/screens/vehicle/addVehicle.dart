import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/constant.dart';
import 'package:lechalo/models/addtruckvehiclemodel.dart';
import 'package:lechalo/models/addvehiclemodel.dart';
import 'package:lechalo/models/cartypemodel.dart';
import 'package:lechalo/screens/vehicle/idUpload/idProof.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddVehicle extends StatefulWidget {



  @override
  _AddVehicleState createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
   List<dynamic> datac=[];

  Future<Cartypemodel> cartype(type) async {
  var url = apiUrl + "/cartype";
  http.Response response = await http.post(Uri.parse(url),
  body: {
  "type":type,
  });
  Map<String,dynamic> data = jsonDecode(response.body);
  setState(() {
    datac=data['detail'];
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
    print(id);
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

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController _Gj = TextEditingController();
  TextEditingController _01 = TextEditingController();
  TextEditingController _ABZ = TextEditingController();
  TextEditingController _2021 = TextEditingController();
  TextEditingController _pcity1 = TextEditingController();
  TextEditingController _pcity2 = TextEditingController();
  TextEditingController _pcity3 = TextEditingController();
  TextEditingController _vmodel = TextEditingController();

  String _Rvalue1 = "No";
  String _Rvalue2 = "2";
  String _Rvalue3 = "3";
  String _Rvalue4 = "4";

  var valueChoose;
  String? valueChoose2;
  List listitem = [
    "car", "truck", "bike", "rickshaw"
  ];
  String value = "null";
  List<DropdownMenuItem<String>> menuitems = [];
   bool disabledropdown=false;

  //List<DropdownMenuItem<String>> menuitems = [];


  void secondselected(_value){
    setState(() {
      value = _value;
    });
  }
  @override
    Widget build(BuildContext context) {
      return Scaffold(


        appBar: AppBar(
          backgroundColor: Color(0xff060E57),
          leading: IconButton(padding: EdgeInsets.zero, onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),


          title: Text("Vehicle Detail", style: TextStyle(
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
            height: 820.h,
            width: 400.w,
            margin: EdgeInsets.only(right: 7.w, left: 7.w),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40.r)
            ),
            child: Padding(
              padding:  EdgeInsets.only(top: 20.h),
              child: Form(
                key: _formkey,
                child: ListView(
                    padding: EdgeInsets.only(right: 30.w, left: 30.w, bottom: 20.h),
                    children: [ Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 350.w,
                          child:
                          DropdownButton<String>(
                            isExpanded: true,
                            items: [
                              DropdownMenuItem<String>(
                                value: "car",
                                child: Center(
                                  child: Text("car"),
                                ),
                              ),
                              DropdownMenuItem<String>(
                                value: "truck",
                                child: Center(
                                  child: Text("truck"),
                                ),
                              ),
                              DropdownMenuItem<String>(
                                value: "bike",
                                child: Center(
                                  child: Text("bike"),
                                ),
                              ),
                              DropdownMenuItem<String>(
                                value: "rickshaw",
                                child: Center(
                                  child: Text("rickshaw"),
                                ),
                              ),
                            ],
                            onChanged: (_value) {
                              setState(() {
                               // disabledropdown=false;
                                valueChoose =_value;
                                //selected(valueChoose);
                                cartype(_value);
                              });},
                            hint: Text(
                                (valueChoose==null) ?"Your vehicle type?":"${valueChoose}"
                            ),

                          ),
                        ),
                        Container(
                            width: 350.w,
                            child:
                                DropdownButton<String>(
                                isExpanded: true,
                                value: valueChoose2,
                                items:datac.map((item){
                                  return DropdownMenuItem(child: Text(item['typename']),
                                  value: item['id'].toString(),);
                                }).toList(),
                                // [DropdownMenuItem(child:ListView.builder(itemCount: snapshot.data!.detail.length,itemBuilder: (context,index){
                                //   return Text(snapshot.data!.detail[index].typename);
                                // }),value:"${snapshot.data['id']}",)],

                               // menuitems,
                                onChanged: (_value) {
                                  setState(() {
                                    valueChoose2= _value;
                                    print(valueChoose);
                                    print(valueChoose2);
                                    secondselected(valueChoose2);
                                  });
                                },
                                hint: Text(
                                    (secondselected==null)? "Your vehicle model?":"$value"
                                ),
                                disabledHint: Text(
                                    "Your vehicle model?"
                                ),

                              )
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        (valueChoose!="bike")?Row(
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
                        ):Container(),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text("Is your vehicle available for parcel?",
                          style: TextStyle(
                              color: Color(0xff020744),
                              fontFamily: "Franklin_Gothic",
                              // fontWeight: FontWeight.bold,
                              fontSize: 18.sp
                          ),),
                        SizedBox(
                          height: 15.h,
                        ),
                        Padding(
                          padding:  EdgeInsets.only(right: 28.w),
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
                          height: 20.h,
                        ),
                        Text(
                          "Is your vehicle for commercial use?", style: TextStyle(
                            color: Color(0xff020744),
                            fontFamily: "Franklin_Gothic",
                            //fontWeight: FontWeight.bold,
                            fontSize: 18.sp
                        ),),
                        SizedBox(
                          height: 15.h,
                        ),
                        Padding(
                          padding:  EdgeInsets.only(right: 29.0.w),
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
                            else if(value.hashCode < DateTime.now().year){
                              return 'Your vehicle model year is Required';
                            }
                          },
                          maxLength: 4,

                          keyboardType: TextInputType.number,
                          controller:_vmodel ,
                          decoration: InputDecoration(
                            counterText: "",
                              hintText: "Your vehicle model year?",
                              hintStyle: TextStyle(
                                  fontFamily: "Franklin_Gothic"
                              )
                          ),
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Container(

                                height: 50.h,
                                width: 50.w,
                                child: TextFormField(

                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Enter";
                                    }
                                  },
                                  controller: _Gj,
                                  textCapitalization: TextCapitalization.characters,
                                  textAlign: TextAlign.center,
                                  maxLength: 2,
                                  decoration: InputDecoration(
                                    counterText: "",
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
                              height: 50.h,
                              width: 50.w,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter";
                                  }
                                },
                                controller: _01,
                                textAlign: TextAlign.center,

                                maxLength: 2,
                                decoration: InputDecoration(
                                    counterText: "",
                                    hintText: "01",
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
                            SizedBox(
                              width: 7.w,
                            ),
                            Container(
                              height: 50.h,
                              width: 70.w,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter";
                                  }
                                },
                                controller: _ABZ,
                                textCapitalization: TextCapitalization.characters,
                                textAlign: TextAlign.center,
                                maxLength: 3,
                                decoration: InputDecoration(
                                    counterText: "",
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
                              height: 50.h,
                              width: 90.w,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter";
                                  }
                                },
                                controller: _2021,
                                textAlign: TextAlign.center,
                                maxLength: 4,
                                decoration: InputDecoration(
                                    counterText: "",
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
                        (_Rvalue3=="Yes")?
                        Container(
                          child: Column(
                            children: [
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
                                    padding:  EdgeInsets.only(right: 30.0.w),
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
                                height: 20.h,
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
                                height: 20.h,
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
                                height: 15.h,
                              ),
                            ],
                          ),
                        ):Container(),

                        InkWell(
                          onTap: () async{
if(!_formkey.currentState!.validate()){
  return;
}
else {
  print("aaaaaaa");
  if (valueChoose == "Truck") {
    final Addtruckvehiclemodel user = await addTruckvehicle().addtruckvehicle(
        regid, valueChoose2, valueChoose,
        _Gj.text + _01.text + _ABZ.text + _2021.text);
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
    final Addvehiclemodel user = await addVehicle()
        .addvehicle(
        regid,
        valueChoose2,
        valueChoose,

        valueChoose2,
        _Gj.text + _01.text + _ABZ.text + _2021.text,
        _Rvalue1,
        _Rvalue3,
        _Rvalue4,
        _pcity1.text,
        _pcity2.text,
        _pcity3.text,
        _Rvalue2);


    setState(()  {
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
          Navigator.of(context).pop(context);
          Navigator.of(context).pop(context);
        });
      }
    });
  }
}
                           // }

                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => IdProof()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 50.h),
                            alignment: Alignment.center,
                            height: 32.h,
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
                              "Add",
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
      );
    }
  }

