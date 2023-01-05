import 'package:flutter/material.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/getdocmodel.dart';
import 'package:lechalo/screens/vehicle/idUpload/adharCard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'drivingLicense.dart';
class IdProof extends StatefulWidget {



  @override
  _IdProofState createState() => _IdProofState();
}

class _IdProofState extends State<IdProof> {
  String? regid;
  String? id;


  Future<String?> getNamePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("id");
    return id;
  }

  int totalPage = 2;
  final PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;
  List isSelected=[true,false];
  var selectedOption=0;
  List options =[DrivingLicense(),AadharCard()];


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

  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff060E57),
        leading: IconButton(padding: EdgeInsets.zero,onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),


        title: Text("Your ID Proof",style: TextStyle(
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
          margin: EdgeInsets.only(right: 7.w,left: 7.w),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40.r)
          ),
          child: Padding(
            padding:  EdgeInsets.all(0.h),
            child: Padding(
              padding:  EdgeInsets.only(right: 15.w,left: 15.w),
              child: ListView(
                children: [
                  Column(

                    children: [

                      SizedBox(
                        height: 50.h,
                      ),
                      Container(
                        height: 100.h,
                        width: 414.w,
                        decoration: (
                            BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/fingerprint.png")
                              )
                            )
                        ),
                      ),

                      SizedBox(
                        height: 70.h,
                      ),
                      topnavigation(),
                      Container(
                          height: 600.h,
                          width: 360.w,

                          child: options[selectedOption]
                      ),


                    ],
                  ),
                ],
              ),
            ),
          ),
        ),


      ),
    );
  }

  topnavigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildOption("Driving License",0),
       Text("|",style: TextStyle(color: Colors.grey,fontSize: 18.sp)),
        buildOption("Aadhar Card",1),

      ],
    );
  }

  buildOption(String title,int index) {
    return Column(
      children: [
        isSelected[index] ? InkWell(
          onTap: (){
            setState(() {

            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.redAccent,
                width: 2.w,)
              )
            ),
            child: Text("${title}",style: TextStyle(
                fontFamily: "Franklin_Gothic",
              fontSize: 18.sp
            ),)
          ),
        ):InkWell(
          onTap: (){
            setState(() {
              selectedOption=index;
             isOptionSelected(index);
            });
          },
          child: Container(
              child: Text("${title}",style: TextStyle(
                  fontFamily: "Franklin_Gothic",
                fontSize: 18.sp
              ),)


          ),
        ),





      ],
    );


  }

  void isOptionSelected(int index) {
    var previousIndex=isSelected.indexOf(true);
    isSelected[index]=true;
    isSelected[previousIndex]=false;
  }
}
