import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/otpgenerationmodel.dart';
import 'package:lechalo/models/userregmodel.dart';
import 'package:lechalo/screens/signup/verification.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../homePage.dart';
import '../loginScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  Future<bool> savedMobilePreference(String mobileNumber,) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("mobile", mobileNumber);
    return prefs.setString("mobile", mobileNumber);
  }
  Future<bool> savedNamePreference(
      String id,
      ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("id", id);
    return prefs.setString("id", id);
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late Userregmodel _Userregmodel;
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _cpasswordFocus = FocusNode();
  final FocusNode _firstnameFocus = FocusNode();
  final FocusNode _mobileFocus = FocusNode();
  final FocusNode _emailidFocus = FocusNode();
  final FocusNode _lastnameFocus = FocusNode();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController emailid = TextEditingController();
  TextEditingController mobile1 = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController cpassword = TextEditingController();

  //late String base64Image;

  String base64gender = "Male";

  String base64type = "";
  String base64image = "";
  final picker = ImagePicker();
  File? image;

  bool checkvalue = false;
  var firstnameValue;
  var lastnameValue;
  var emailidValue;
  var mobileValue;
  var passwordValue;
  var cpasswordValue;
  var genderValue;

  //var Fullname="${firstnameValue}" +" "+ "${lastnameValue}";

  int totalPage = 2;
  final PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;
  List isSelected = [true, false];
  var selectedOption = 0;

  _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Container(
                  height: 200.h,
                  width: 200.w,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Upload Profile Picture",
                            style: TextStyle(
                                fontFamily: "Franklin_Gothic", fontSize: 20.sp),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.close,
                                color: Colors.black,
                              ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: ()  {
                              pickImage();
                              Navigator.of(context).pop();
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 100.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/gallery.png"))),
                                ),
                                Text(
                                  "Gallery",
                                  style: TextStyle(
                                      fontFamily: "Franklin_Gothic",
                                      fontSize: 18.sp),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              camImage();
                              Navigator.of(context).pop();
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 100.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                          AssetImage("assets/camera.png"))),
                                ),
                                Text(
                                  "Camera",
                                  style: TextStyle(
                                      fontFamily: "Franklin_Gothic",
                                      fontSize: 18),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  // title: Text("Upload Profile Picture",style: TextStyle(
                  //   fontFamily: "Franklin_Gothic"
                  // ),),
                  //   actions: [
                  //
                  //   ],
                  // )

                )
            ),
          );
        });
  }

  bool changeButtonP = true;
  bool changeButtonCP = true;

  // bool checkbox=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: 260.h,
          width: 420.w,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/signuppage background.png"))),
        ),
        ListView(children: [
          Container(
            margin: EdgeInsets.only(top: 195.h),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.r),
                    topRight: Radius.circular(40.r))),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.r), topLeft: Radius.circular(40.r)),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaY: 80,
                  sigmaX: 25,
                ),
                child: Form(
                  key: _formkey,
                  child: Padding(
                    padding:
                    EdgeInsets.only(right: 50.w, left: 50.w, top: 60.h),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            _showDialog();
                          },
                          child: (image != null)
                              ? Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                    color: Colors.black, width: 2.0)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.file(
                                image!,
                                height: 100.h,
                                width: 100.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                              : Image.asset(
                            "assets/user.png",
                            height: 100.h,
                            width: 100.w,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 150.w,
                              height: 50.h,
                              child: TextFormField(
                                focusNode: _firstnameFocus,
                                controller: firstname,
                                decoration: InputDecoration(
                                    hintText: "First Name",
                                    hintStyle: TextStyle(
                                        fontFamily: "Franklin_Gothic")),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'First Name is Required';
                                  }
                                  return null;
                                },
                                // onChanged: (value){
                                //   setState(() {
                                //     firstnameValue=value;
                                //   });
                                // },
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 150.w,
                              height: 50.h,
                              child: TextFormField(
                                focusNode: _lastnameFocus,
                                controller: lastname,
                                decoration: InputDecoration(
                                    hintText: "Last Name",
                                    hintStyle: TextStyle(
                                        fontFamily: "Franklin_Gothic")),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Last Name is Required';
                                  }
                                  return null;
                                },
                                // onChanged: (value){
                                //   setState(() {
                                //     lastnameValue=value;
                                //   });
                                // },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          height: 50.h,
                          width: 320.w,
                          child: TextFormField(
                            controller: emailid,
                            decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle:
                                TextStyle(fontFamily: "Franklin_Gothic")),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email ID Name is Required';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          height: 50.h,
                          width: 320.w,

                          child: TextFormField(
                            focusNode: _mobileFocus,
                            controller: mobile1,
                            decoration: InputDecoration(
                              hintText: "Mobile",
                              hintStyle: TextStyle(fontFamily: "Franklin_Gothic"),
                            ),
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
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 20.h,
                              width: 90.w,
                              child: Text(
                                "Select Gender :-",
                                style: TextStyle(
                                    fontFamily: "Franklin_Gothic",
                                    color: Colors.grey.shade700,
                                    fontSize: 15),
                              ),
                            ),
                            topnavigation(),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          height: 50.h,
                          width: 320.w,
                          child: TextFormField(
                            focusNode: _passwordFocus,
                            controller: password1,
                            obscureText: changeButtonP ? true : false,
                            decoration: InputDecoration(
                              hintText: "Password",
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Paswword is Required';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          height: 50.h,
                          width: 320.w,

                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                cpasswordValue = value;
                              });
                            },
                            focusNode: _cpasswordFocus,
                            controller: cpassword,
                            obscureText: changeButtonCP ? true : false,
                            decoration: InputDecoration(
                              hintText: "Confirm Password",
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Confirm Password is Required';
                              }else if(value !=password1.text){
                                return 'Passwords should be same';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          children: [
                            Container(
                              child: Checkbox(

                                value: checkvalue,
                                onChanged: (value) {
                                  setState(() {
                                    this.checkvalue = value!;
                                  });
                                },
                              ),
                            ),
                            Container(
                              width: 260.w,
                              height: 40.h,
                              child: Text(
                                "By proceeding I agree to Lechalo Terms of Use and acknowledge.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: "Franklin_Gothic",
                                    color: Colors.grey.shade700,
                                    fontSize: 15,
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () async{
                            // String email = emailid.text;
                            // String Fullname =firstname.text + " " + lastname.text;
                            // String password = password1.text;
                            // String mobile = mobile1.text;
                            // String gender = "";
                            // String userimage = "";
                            // String type = "";
                            // String birthyear = emailid.text;
                            // String imagepath = "";
                            //
                            //
                            // Userregmodel data = await creataccount(). createaccount(email, Fullname, birthyear, gender, userimage, type, password, mobile, imagepath);
                            //
                            // setState(() {
                            //   _Userregmodel = data;
                            //   print("lechlo");
                            //
                            //     if (!_formkey.currentState!.validate()) {
                            //      return;
                            //
                            //     }
                            //     else {
                            //       if(data.status != "success"){
                            //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>LoginScreen()));
                            //       }
                            //       else{
                            //         print("user already registerd");
                            //       }
                            //     }
                            // });

                            if (!_formkey.currentState!.validate()) {
                              return;
                            } else {
                              if(base64image == ""){
                                Fluttertoast.showToast(
                                    msg: "Please select image",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              }
                              else if (checkvalue == true && base64image != null) {
                                final Userregmodel user = await creataccount().createaccount(
                                    emailid.text,
                                    firstname.text + " " + lastname.text,
                                    "",
                                    base64gender,
                                    base64image.toString(),
                                    "User",
                                    password1.text,
                                    mobile1.text,
                                    image?.path
                                );
                                print("aaa");
                                print(user.id.toString());
                                if (user.status != "success") {
                                  setState(() {
                                    Fluttertoast.showToast(
                                      msg: user.msg,
                                      backgroundColor: Color(0xff060E57),
                                      textColor: Colors.white,
                                    );
                                  });
                                } else {
                                  savedMobilePreference(mobile1.text).then((
                                      bool commited) {
                                    setState(() {
                                      print("mobilenumber");
                                    });
                                  });
                                  savedNamePreference(user.id.toString())
                                      .then((bool commited) {
                                    setState(() {
                                      print("regid");
                                    });
                                  });

                                  setState(() {
                                    Fluttertoast.showToast(
                                      msg: user.msg,
                                      backgroundColor: Color(0xff060E57),
                                      textColor: Colors.white,
                                    );
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Verification(),
                                      ),
                                    );
                                  });
                                }
                              }
                              return null;
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 50.h),
                            alignment: Alignment.center,
                            height: 46.h,
                            width: 96.w,
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
                              "Sign Up",
                              style: TextStyle(
                                  fontFamily: "Franklin_Gothic",
                                  color: Color(0xffFFFFFF),
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: 5.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already registered ?",
                                style: TextStyle(
                                    fontFamily: "Franklin_Gothic",
                                    color: Color(0xff0A074D),
                                    fontSize: 16.sp),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "Log In",
                                    style: TextStyle(
                                        fontFamily: "Franklin_Gothic",
                                        color: Color(0xffA00F0F),
                                        fontSize: 16.sp),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ]),
    );
  }

  topnavigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildOption("assets/male.png", 0, "Male"),
        SizedBox(
          width: 20.w,
        ),
        buildOption("assets/female.png", 1, "Female"),
      ],
    );
  }

  buildOption(String image, int index, String value) {
    return Column(
      children: [
        isSelected[index]
            ? InkWell(
          onTap: () {
            setState(() {});
          },
          child: Container(
            height: 35.h,
            width: 35.w,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("${image}")),
                border: Border(
                    bottom: BorderSide(
                      color: isSelected[0] ? Colors.blue : Colors.pink,
                      width: 2.w,
                    ))),
          ),
        )
            : InkWell(
          onTap: () {
            setState(() {
              base64gender = value;
              selectedOption = index;
              print(base64gender);
              isOptionSelected(index);
            });
          },
          child: Container(
              height: 30.h,
              width: 30.w,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("$image")))),
        ),
      ],
    );
  }

  void isOptionSelected(int index) {
    var previousIndex = isSelected.indexOf(true);
    isSelected[index] = true;
    isSelected[previousIndex] = false;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<File>('_image', image));
  }

  Future<void> pickImage() async {
    final _image = await ImagePicker().pickImage(source: ImageSource.gallery);

    final imageTemporary = File(_image!.path);
    setState(() {
      this.image = imageTemporary;
      base64image = base64Encode(image!.readAsBytesSync());
      print(image!.path);
    });
  }
  Future<void> camImage() async {
    final _image = await ImagePicker().pickImage(source: ImageSource.camera);

    final imageTemporary = File(_image!.path);
    setState(() {
      this.image = imageTemporary;
      base64image = base64Encode(image!.readAsBytesSync());
      print(image!.path);
    });
  }
}