import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/addvehicledocmodel.dart';
import 'package:lechalo/models/getdocmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class DrivingLicense extends StatefulWidget {
  

  @override
  _DrivingLicenseState createState() => _DrivingLicenseState();
}

class _DrivingLicenseState extends State<DrivingLicense> {
  // Future<void> pickImage2() async {
  //   final _image = await ImagePicker().pickImage(source: ImageSource.camera);
  //
  //   final imageTemporary = File(_image!.path);
  //   setState(() {
  //     this.image = imageTemporary;
  //     base64image = base64Encode(image!.readAsBytesSync());
  //     print(image!.path);
  //   });
  // }


  TextEditingController _licensenumber = TextEditingController();
  late String base64image;
  final picker = ImagePicker();
  File? image;
  String? regid;
  var uplodedimage;

  String? id;

  Future<String?> getNamePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("id");
    return id;
  }

  @override
  void initState() {
    Future.delayed(Duration.zero,()async{
      final Getdocmodel user= await getDoc().getdoc(regid, "","license" );

      _licensenumber.text=user.documentno;
      uplodedimage=user.path;
    }
    );
    // TODO: implement initState
    super.initState();
    getNamePreference().then((id) {
      setState(() {
        regid = id;
        print(regid);
      });
    });

  }
  _showDialog(){
    showDialog(context: context, builder: (BuildContext context){
      return BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX: 40,
            sigmaY: 40
        ),
        child:Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),

            ),
            child:Container(

              height: 270.h,
              width: 300.w,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Upload Driving License",style: TextStyle(fontFamily: "Franklin_Gothic",fontSize: 20.sp),),
                      SizedBox(width: 30.w,),
                      IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon: Icon(Icons.close,color: Colors.black,))


                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: (){
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
                                      image: AssetImage("assets/gallery.png")
                                  )
                              ),

                            ),
                            Text("Gallery",style: TextStyle(fontFamily:"Franklin_Gothic" ,fontSize: 18.sp),)
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: (){
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

                                      image: AssetImage("assets/camera.png")
                                  )
                              ),

                            ),
                            Text("Camera",style: TextStyle(fontFamily:"Franklin_Gothic" ,fontSize: 18.sp),)
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
              //
            )
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children:[ Container(
            height: 580.h,
            width: 414.w,

            decoration: BoxDecoration(
                color: Colors.white
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,


              children: [
                SizedBox(
                  height: 80.h,
                ),
                Text("Upload a good quality copy of your DrivingLicense",style: TextStyle(
                    color: Colors.grey
                ),),

                InkWell(
                  onTap: (){
                    print(uplodedimage);
                    print(uplodedimage.runtimeType);
                    _showDialog();
                  },
                  child: Column(
                    children: [

                      Container(
                        margin: EdgeInsets.zero,
                        height: 200.h,
                        width: 414.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: NetworkImage("$uplodedimage"),
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                TextFormField(
                  controller: _licensenumber,
                  decoration: InputDecoration(
                      hintText: "Enter DrivingLicense Number"
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 30.h,
                ),
                InkWell(
                  onTap: ()

                  async{
                    // if (!_formkey.currentState!.validate()) {
                    //   return;
                    // }
                    // else {
                    print(base64image);
                    final Addvehicledocmodel user = await addVehicledoc().addvehicledoc(regid,"1","",base64image,_licensenumber.text);

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
                    },
                  child: Container(
                    // margin: EdgeInsets.only(top: 30),
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
                      "Upload",
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
          ]
      ),
    );



  }

  Future<void> pickImage() async {
    final _image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      this.image = File(_image!.path);
      base64image = base64Encode(image!.readAsBytesSync());
      print(image!.path);
    });
  }
  Future<void> camImage() async {
    final _image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      this.image = File(_image!.path);
      base64image = base64Encode(image!.readAsBytesSync());

      print(image!.path);
    });

  }
}


