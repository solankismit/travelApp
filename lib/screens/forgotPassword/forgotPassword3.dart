import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/forfotpasswordModel.dart';
import 'package:lechalo/screens/loginScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPassword3 extends StatefulWidget {
  String mobile;
  ForgotPassword3 (this.mobile,{Key? key}):super(key: key);


  @override
  _ForgotPassword3State createState() => _ForgotPassword3State();
}

class _ForgotPassword3State extends State<ForgotPassword3> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController _password = TextEditingController();
  TextEditingController _cpassword = TextEditingController();
  bool changeButtonP=true;
  bool changeButtonCP =true;
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
          Positioned(top:  300.h,
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
                    key: _formkey,
                    child: Padding(
                      padding:  EdgeInsets.only(right: 50.w,left: 50.w,top:60.h ),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _password,
                            validator: (value){
                              if(value!.isEmpty){
                                return "Password is required";
                              }
                            },
                            obscureText: changeButtonP ? true : false,
                            decoration: InputDecoration(
                              hintText: "New Password",
                              hintStyle: TextStyle(
                                fontFamily: "Franklin_Gothic",
                              ),
                              suffixIcon: IconButton(
                                icon: changeButtonP
                                    ? Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Colors.grey,
                                )
                                    : Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.grey,

                                ),
                                onPressed: () {
                                  setState(() {
                                    changeButtonP = !changeButtonP;
                                  });
                                },
                              ),

                            ),

                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          TextFormField(
                            controller: _cpassword,
                            validator: (value){
                              if(value! != _password.text){
                                return "Password must be same";
                              }
                            },
                            obscureText: changeButtonCP ? true : false,
                            decoration: InputDecoration(
                              hintText: "Confirm New Password",
                              hintStyle: TextStyle(
                                fontFamily: "Franklin_Gothic",
                              ),
                              suffixIcon: IconButton(
                                icon: changeButtonCP
                                    ? Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Colors.grey,
                                )
                                    : Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    changeButtonCP = !changeButtonCP;
                                  });
                                },
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async{
                              if(!_formkey.currentState!.validate()){
                                return ;
                              }
                              else {
                                final Forfotpassword user = await resetPassword()
                                    .resetpassword(widget.mobile,"user",_password.text);
                                if(user.status=="success") {
                                  setState(() {
    Fluttertoast.showToast(
    msg: user.msg,
    backgroundColor: Color(0xff060E57),
    textColor: Colors.white,
    );
                                  });
                                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                                          builder: (context) => LoginScreen()), (route) => false);
                                  // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                                  //     builder: (context) => LoginScreen(),));
                                }
                                else{

                                  setState(() {
                                    Fluttertoast.showToast(
                                      msg: user.msg,
                                      backgroundColor: Color(0xff060E57),
                                      textColor: Colors.white,
                                    );
                                  });
                                }
                              }
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
                                "Change",
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
