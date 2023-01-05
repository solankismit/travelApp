import 'dart:ui';
import 'package:geolocator/geolocator.dart';
import 'package:lechalo/googleplace/geo_locetor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/homePage.dart';
import 'package:lechalo/models/errormodel.dart';
import 'package:lechalo/models/loginmodel.dart';
import 'package:lechalo/screens/forgotPassword/forgotpassword1.dart';
import 'package:lechalo/screens/signup/signupScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

Future<bool> savedNamePreference(String id,) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("id", id);
  print(id + "ssssssssssssssssssssssssss");
  return prefs.setString("id", id);
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _loginidFocus = FocusNode();
  TextEditingController loginid = TextEditingController();
  TextEditingController _password = TextEditingController();
  GeolocatorService geolocatorService = GeolocatorService();
  late Position currentPosition;

  bool changeButton = true;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 896),
      builder: (context, child) => Scaffold(
        body: Container(

          height: 900.h,

          child: Stack(children: [
            Positioned(
              top: -71.h,
              child: Container(
                height: 430.h,
                width: 414.w,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/loginpage background.png"))),
              ),
            ),
            ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 280.h),
                  height: 678.h,
                  width: 414.w,

                  //margin: EdgeInsets.only(top: 310),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.r),
                          topRight: Radius.circular(50.r))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50.r),
                        topLeft: Radius.circular(50.r)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaY: 80,
                        sigmaX: 25,
                      ),
                      child: Form(
                        key: _formkey,
                        child: Padding(
                          padding:
                              EdgeInsets.only(right: 52.w, left: 52.w, top: 116.h),
                          child: Column(
                            children: [
                              TextFormField(
                                maxLength: 10,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Mobile Number is Required';
                                  }
                                  // else
                                  //   if(value.length!=10);
                                  // {
                                  //   return 'Enter a valid Mobile Number';
                                  // }
                                },
                                focusNode: _loginidFocus,
                                controller: loginid,
                                onFieldSubmitted: (term) {
                                  _fieldFocusChange(
                                      context, _loginidFocus, _passwordFocus);
                                },
                                decoration: InputDecoration(
                                    hintText: "Mobile Number",
                                    hintStyle: TextStyle(
                                        fontFamily: "Franklin_Gothic",
                                        fontSize: 14.sp)),
                                keyboardType: TextInputType.number,
                              ),
                              SizedBox(
                                height: 53.h,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password is Required';
                                  }
                                },
                                focusNode: _passwordFocus,
                                controller: _password,
                                obscureText: changeButton ? true : false,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      fontFamily: "Franklin_Gothic",
                                      fontSize: 14.sp),
                                  suffixIcon: IconButton(
                                    icon: changeButton
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
                                        changeButton = !changeButton;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ForgotPassword1()));
                                      },
                                      child: Text(
                                        "Forgot Password ?",
                                        style: TextStyle(
                                            fontFamily: "Franklin_Gothic",
                                            color: Color(0xffA00F0F),
                                            fontSize: 14.sp),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 48.h,
                              ),
                              InkWell(
                                onTap: () async {
                                  // final String loginilid = loginid.text;
                                  // final String password = _password.text;
                                  // final String type = 'User';
                                  if (!_formkey.currentState!.validate()) {
                                    return;
                                  } else {
                                    currentPosition =
                                    await geolocatorService.getInitialLocation();
                                    final LoginModel user = await Login()
                                        .login(loginid.text, _password.text, "User");

                                    print(user.id);

                                     if (user.status != "success"){
                                      savedNamePreference (user.status.toString())
                                          .then((bool committed) {
                                        setState(() {
                                          Fluttertoast.showToast(
                                            msg: "Please Check Your Username Or Password",
                                            backgroundColor: Color(0xff060E57),
                                            textColor: Colors.white,
                                          );
                                        });
                                      });

                                    } else  {
                                       savedNamePreference(user.id.toString())
                                          .then((bool committed) {
                                        setState(() {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => HomePage(currentPosition.latitude,currentPosition.longitude),
                                            ),
                                          );
                                        });
                                      });

                                    }
                                  }
                                  // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 46.h,
                                  width: 96.h,
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
                                    "Log In",
                                    style: TextStyle(
                                        fontFamily: "Franklin_Gothic",
                                        color: Color(0xffFFFFFF),
                                        fontSize: 20.sp),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 45.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "If you don't have an account ?",
                                    style: TextStyle(
                                        fontFamily: "Franklin_Gothic",
                                        color: Color(0xff0A074D),
                                        fontSize: 16.sp),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignupScreen()));
                                      },
                                      child: Text(
                                        "Signup",
                                        style: TextStyle(
                                            fontFamily: "Franklin_Gothic",
                                            color: Color(0xffA00F0F),
                                            fontSize: 16.sp),
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
