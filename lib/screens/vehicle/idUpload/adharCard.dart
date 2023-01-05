import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/addvehicledocmodel.dart';
import 'package:lechalo/models/getdocmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AadharCard extends StatefulWidget {


  @override
  _AadharCardState createState() => _AadharCardState();
}

class _AadharCardState extends State<AadharCard> {
  TextEditingController _adharnumber = TextEditingController();
  late String base64image;
  final picker = ImagePicker();
  File? image;
  String? regid;

  String? id;

  Future<String?> getNamePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("id");
    return id;
  }

  @override
  void initState() {
    Future.delayed(Duration.zero,()async{
      final Getdocmodel user= await getDoc().getdoc(regid, "","aadharno" );

      _adharnumber.text=user.documentno;

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
  // _showDialog(){
  //   showDialog(context: context, builder: (BuildContext context){
  //     return BackdropFilter(
  //       filter: ImageFilter.blur(
  //           sigmaX: 40,
  //           sigmaY: 40
  //       ),
  //       child:Dialog(
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(20),
  //
  //           ),
  //           child:Container(
  //
  //             height: MediaQuery.of(context).size.height*0.25,
  //             width: MediaQuery.of(context).size.width*0.7,
  //             child: Column(
  //               children: [
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.end,
  //                   children: [
  //                     Text("Upload Profile Picture",style: TextStyle(fontFamily: "Franklin_Gothic",fontSize: 20),),
  //                     SizedBox(width: MediaQuery.of(context).size.width*0.040,),
  //                     IconButton(onPressed: (){
  //                       Navigator.pop(context);
  //                     }, icon: Icon(Icons.close,color: Colors.black,))
  //
  //
  //                   ],
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   children: [
  //                     InkWell(
  //                       onTap: (){
  //                         pickImage();
  //                         Navigator.of(context).pop();
  //                       },
  //                       child: Column(
  //                         children: [
  //                           Container(
  //                             height:MediaQuery.of(context).size.height*0.15,
  //                             width:MediaQuery.of(context).size.width*0.25,
  //                             decoration: BoxDecoration(
  //                                 image: DecorationImage(
  //                                     image: AssetImage("assets/gallery.png")
  //                                 )
  //                             ),
  //
  //                           ),
  //                           Text("Gallery",style: TextStyle(fontFamily:"Franklin_Gothic" ,fontSize: 18),)
  //                         ],
  //                       ),
  //                     ),
  //                     InkWell(
  //                       onTap: (){},
  //                       child: Column(
  //                         children: [
  //                           Container(
  //                             height:MediaQuery.of(context).size.height*0.15,
  //                             width:MediaQuery.of(context).size.width*0.25,
  //                             decoration: BoxDecoration(
  //                                 image: DecorationImage(
  //
  //                                     image: AssetImage("assets/camera.png")
  //                                 )
  //                             ),
  //
  //                           ),
  //                           Text("Camera",style: TextStyle(fontFamily:"Franklin_Gothic" ,fontSize: 18),)
  //                         ],
  //                       ),
  //                     ),
  //
  //
  //                   ],
  //                 )
  //               ],
  //             ),
  //             // title: Text("Upload Profile Picture",style: TextStyle(
  //             //   fontFamily: "Franklin_Gothic"
  //             // ),),
  //             //   actions: [
  //             //
  //             //   ],
  //             // )
  //             //
  //           )
  //       ),
  //     );
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:[ Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width*1,

          decoration: BoxDecoration(
              color: Colors.white
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,


            children: [
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.08,
              // ),
              // Text("Upload a good quality copy of your Aadhar",style: TextStyle(
              //     color: Colors.grey
              // ),),
              //
              // InkWell(
              //   onTap: (){
              //     _showDialog();
              //   },
              //   child: Column(
              //     children: [
              //
              //       Container(
              //         margin: EdgeInsets.zero,
              //         height: MediaQuery.of(context).size.height*0.15,
              //         width: MediaQuery.of(context).size.width*1,
              //         decoration: BoxDecoration(
              //             color: Colors.white,
              //             image: DecorationImage(
              //                 image: AssetImage("assets/idUpload.png")
              //             )
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 80.h,
              ),
              TextFormField(
                controller: _adharnumber,
                decoration: InputDecoration(
                    hintText: "Enter Aadhar Card Number"
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
                    final Addvehicledocmodel user = await addVehicledoc().addvehicledoc(regid,"1","",base64image,_adharnumber.text);

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


                    //   }
                  },








                child: Container(
                  // margin: EdgeInsets.only(top: 30),
                  alignment: Alignment.center,
                  height:50.h,
                  width: 130.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.sp),
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

  // Future<void> pickImage() async {
  //   final _image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //
  //   final imageTemporary = File(_image!.path);
  //   setState(() {
  //     this.image = imageTemporary;
  //     base64image = base64Encode(image!.readAsBytesSync());
  //     print(image!.path);
  //   });
  // }
}
