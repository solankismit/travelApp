import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/otpgenerationpassmodel.dart';
import 'package:lechalo/screens/forgotPassword/forgotPassword2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPassword1 extends StatefulWidget {


  @override
  _ForgotPassword1State createState() => _ForgotPassword1State();
}

class _ForgotPassword1State extends State<ForgotPassword1> {
  Future<bool> savedMobilePreference(String mobileNumber,) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("mobile", mobileNumber);
    return prefs.setString("mobile", mobileNumber);
  }
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController _mobile =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

extendBodyBehindAppBar: true,


      appBar: AppBar(
        elevation: 0,

        backgroundColor: Colors.transparent,
        leading: IconButton(padding: EdgeInsets.zero,onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),
      ),
body: Stack(children: [
Positioned(top: 0,
  child:   Container(
  height: 400.h,
        width: 420.w,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,

                image: AssetImage("assets/forgotpassword background.png"))),
      ),
),

  Positioned(top:  300.h,
    child: Container(
      height: 700.h ,
      width: 415.w ,


      //margin: EdgeInsets.only(top: 310),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.r),
              topRight: Radius.circular(40.r))),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.r),
            topLeft: Radius.circular(40.r)),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaY: 40,
            sigmaX: 25,
          ),
          child: Form(
            child: Padding(
              padding:  EdgeInsets.only(right: 50.w,left: 50.w,top:60.h ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 320.w,
                    height: 50.h,
                    child: TextFormField(
                      controller: _mobile,
                      decoration: InputDecoration(
                          hintText: "Mobile Number",
                          hintStyle: TextStyle(
                              fontFamily: "Franklin_Gothic")),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Mobile number is Required';
                        }
                        return null;
                      },
                      maxLength: 10,
                    ),
                  ),
                  InkWell(
                    onTap: () async{
                        savedMobilePreference(_mobile.text).then((
                            bool commited) {
                          setState(() {
                            print("mobilenumber");
                          });
                        });
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ForgotPassword2(_mobile.text)));
                      },

                    child: Container(
                      margin: EdgeInsets.only(top: 50.h),
                      alignment: Alignment.center,
                      height:32.h,
                      width: 87.w,
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
                        "Send",
                        style: TextStyle(
                            fontFamily: "Franklin_Gothic",
                            color: Color(0xffFFFFFF),
                            fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h
                  ),

                     Text("We Will Send You An OTP To Your Registered Mobile Number",style: TextStyle(
                      color: Color(0xff0A074D),
                      fontFamily: "Franklin_Gothic",
                       fontSize: 16.sp,

                    ),
                     textAlign: TextAlign.center,),


                ],
              ),
            ),
          ),
        ),
      ),
    ),
  ),
    ]
    )
    );
  }
}
