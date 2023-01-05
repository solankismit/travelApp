
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/requestoffermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CreatRideRequest extends StatefulWidget {
  String llat;
  String llang;
  String dlat;
  String dlng;
  String ladd;
  String dadd;
  String distance;
  String type;

  CreatRideRequest(this.llat,this.llang,this.dlat,this.dlng,this.ladd,this.dadd,this.distance,this.type,{Key? key}):super(key: key);



  @override
  _CreatRideRequestState createState() => _CreatRideRequestState();
}

class _CreatRideRequestState extends State<CreatRideRequest> {
  var datepicked;
  var singleDayPicker = DateTime.now();


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

  var selectedDate=DateTime.now();


  int passengers= 1;
  @override
  Widget build(BuildContext context) {
    var formatedDate= DateFormat.yMMMd().format(selectedDate);
    var formatSinglDate = DateFormat.yMMMd().format(singleDayPicker);
    return Scaffold(


      appBar: AppBar(
        backgroundColor: Color(0xff060E57),
        leading: IconButton(padding: EdgeInsets.zero,onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),


        title: Text("Create Ride Request",style: TextStyle(
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
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.only(right: 7,left: 7),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40)
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 50,bottom: 20),
            child: ListView(

                padding: EdgeInsets.only(right: 40,left: 40),
                children:[ Form(
                  child: Column(


                    children: [
                      Text("When are you going ?",style: TextStyle(
                          color: Color(0xff020744),
                          fontFamily: "Franklin_Gothic",
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.05,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText:"${formatSinglDate}",
                            hintStyle: TextStyle(
                                fontFamily: "Franklin_Gothic"
                            )
                        ),
                        onTap: (){
                          setState(() {
                            showCupertinoModalPopup(context: context, builder: (context)=>

                                Container(

                                  margin: EdgeInsets.only(right: 7, left: 7),
                                  height:MediaQuery.of(context).size.height*0.35,
                                  width:MediaQuery.of(context).size.width,
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
                                )



                            );
                          });
                        },
                        readOnly: true,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.05,
                      ),
                      Text("So how many Lechalo passengers can you ?",style: TextStyle(
                          color: Color(0xff020744),
                          fontFamily: "Franklin_Gothic",
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.05,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(onPressed: (){
                            setState(() {
                              if(passengers>1){
                                passengers--;
                              }

                            });
                          },
                            icon: Icon(Icons.remove_circle_outline,color: Color(0xffFE0505),),),
                          Text("${passengers}",style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),),
                          IconButton(onPressed: (){
                            setState(() {
                              passengers++;
                            });
                          },
                            icon: Icon(Icons.add_circle_outline),color: Color(0xff0E1DA7),),




                        ],
                      ),

                      InkWell(
                        onTap: ()async {
                          print("aaaaaaa");
                          final Requestoffermodel user= await requestOffer().requestoffer(regid.toString(), widget.llang.toString(),widget.llat.toString(),widget.dlng.toString(),widget.dlat.toString(), datepicked.toString(), passengers.toString(), double.parse(widget.distance).round().toInt().toString(), widget.ladd,widget.dadd,widget.dadd,widget.ladd,widget.type);

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
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              });
                            }
                          });
                        },


                        child: Container(
                          margin: EdgeInsets.only(top: 30),
                          alignment: Alignment.center,
                          height: 32,
                          width: 87,
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

                    ],
                  ),
                ),
                ]
            ),
          ),
        ),


      ),
    );
  }
}


