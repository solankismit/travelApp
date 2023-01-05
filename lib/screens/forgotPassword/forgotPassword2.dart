import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/checkotppassmodel.dart';
import 'package:lechalo/models/otpgenerationmodel.dart';
import 'package:lechalo/models/otpgenerationpassmodel.dart';
import 'package:lechalo/screens/forgotPassword/forgotPassword3.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ForgotPassword2 extends StatefulWidget {
String mobile;
ForgotPassword2(this.mobile,{Key? key}):super(key: key);

  @override
  _ForgotPassword2State createState() => _ForgotPassword2State();
}

class _ForgotPassword2State extends State<ForgotPassword2> {
  TextEditingController otpControler =TextEditingController();
  String? regMobile;
  String? mobile;


  Future<String?> getMobilePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();


    mobile= prefs.getString("mobile");
    return mobile;

  }


  @override
  void initState() {
    Future.delayed(Duration.zero,() async {
      //your async 'await' codes goes here
      final Otpgenerationpassmodel user = await otpgenerationPass().otpgenerationpass(regMobile, "User");
    });
    // TODO: implement initState
    super.initState();
    getMobilePreference().then((mobile){
      setState(() {
        regMobile=mobile;

        print("aaa:$mobile");
      });

    });
  }


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
            child: Container(
              height: 400.h,
              width: 420.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,

                      image: AssetImage("assets/forgotpassword background.png"))),
            ),
          ),
          Positioned(top: 300.h,
            child: Container(
              height: 700.h ,
              width: 415.w ,

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
                        children: [
                          Text("Please Enter 6 - digit OTP",style: TextStyle(
                            color: Color(0xff090000),
                            fontFamily: "Franklin_Gothic",
                            fontSize: 15
                          ),),
                          SizedBox(
                            height:40.h ,
                          ),
                          PinCodeTextField(appContext: context, length: 6, onChanged: (value){
                            print(value);
                          },
                            controller: otpControler,
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5.r),
                              fieldHeight:45.h,
                              fieldWidth:45.w,
                              inactiveColor: Color(0xff707070)
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(
                            height:20.h ,
                          ),



                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Resend OTP in :",style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontFamily: "Franklin_Gothic",
                                  fontSize: 15.sp
                              ),),
                              TweenAnimationBuilder(tween:
                              IntTween(begin: 60,end: 1),
                                duration:Duration(seconds: 60) ,
                                builder: (context,value,child)=>
                                    Text("   00:${value}",
                                      style: TextStyle(color: Color(0xffFF0E0EB3)),),)
                            ],
                          ),
                          InkWell(
                            onTap: () async {


                              print(otpControler.text);
                              print(regMobile);


                              final Checkotppassmodel user = await checkotpPass().checkotppass(regMobile,otpControler.text,"User");

                              print(user.status);

                              if (user.status != "success") {

                                  setState(() {

                                    Fluttertoast.showToast(
                                      msg: user.msg,
                                      backgroundColor: Color(0xff060E57),
                                      textColor: Colors.white,
                                    );
                                  });


                              } else  {
 setState(() async{
                                  Fluttertoast.showToast(
                                    msg: user.msg,
                                    backgroundColor: Color(0xff060E57),
                                    textColor: Colors.white,
                                  );
 Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (context) => ForgotPassword3(widget.mobile)),
                                          (route) => false);


                                });






                              }

                              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
                            },

                            child: Container(
                              margin: EdgeInsets.only(top: 30.h),
                              alignment: Alignment.center,
                              height:32.h,
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
                ),
              ),
            ),
          ),
        ]
        )
    );
  }
}
