import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/constant.dart';
import 'package:lechalo/models/getProfile.dart';
import 'package:lechalo/models/updateprofilemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfile extends StatefulWidget {


  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  void initState() {
    Future.delayed(Duration.zero, () async {
      final Getprofile user = await getProfile().getprofile(regid);
      _fullnameC.text = user.detail!.name.toString();
      _emailidC.text = user.detail!.email.toString();
      _mobileC.text = user.detail!.mobile.toString();
      _bioC.text = user.detail!.bio.toString();
      gender = user.detail!.gender;
      base64image=user.userImage!;
     __image=user.userImage!;

      (gender =="F")?(isSelected=[false
      ,true]):(isSelected=[true,false]);
      print(gender);
      print(base64image);
      _downloadFile(user.userImage!);
      });
    // TODO: implement initState
    super.initState();

    getNamePreference().then((id) {
      setState(() {
        regid = id;
        print(regid);
      });
    });
  }

  void _downloadFile(String url) {
    setState(() {
      fileStream = DefaultCacheManager().getFileStream(url, withProgress: true);
    });
  }
  Stream<FileResponse>? fileStream;
  TextEditingController _fullnameC = TextEditingController();
  TextEditingController _emailidC = TextEditingController();
  TextEditingController _mobileC = TextEditingController();
  TextEditingController _bioC = TextEditingController();


  late String base64image;
  final picker = ImagePicker();
  File? image;
  String? regid;
  String? id;
  String? gender;
  String? _fullnameforC;
   String? __image;

  // String? _emailidC;
  // String? _mobileC;
  // String? _bioC;

  // var gender ="Male";
//  var gender ="Male";
  // var gender ="Male";


  Future<String?> getNamePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("id");
    return id;
  }

  @override
  _showDialog() {
    showDialog(context: context, builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX: 40,
            sigmaY: 40
        ),
        child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),

            ),
            child: Container(

              height: 250.h,
              width: 300.w,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Upload Profile Picture", style: TextStyle(
                          fontFamily: "Franklin_Gothic", fontSize: 20.sp),),
                      SizedBox(width: 40.w,),
                      IconButton(onPressed: () {
                        Navigator.pop(context);
                      }, icon: Icon(Icons.close, color: Colors.black,))


                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          //getImage(ImgSource.Gallery);
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
                            Text("Gallery", style: TextStyle(
                                fontFamily: "Franklin_Gothic", fontSize: 18.sp),)
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

                                      image: AssetImage("assets/camera.png")
                                  )
                              ),

                            ),
                            Text("Camera", style: TextStyle(
                                fontFamily: "Franklin_Gothic", fontSize: 18.sp),)
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
  int totalPage = 2;
  final PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;
  List isSelected = [true, false];
  var selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xff060E57),
        leading: IconButton(padding: EdgeInsets.zero, onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),


        title: Text("Edit Profile", style: TextStyle(
            fontFamily: "Franklin_Gothic"
        ),),
        centerTitle: true,
        elevation: 0,

      ),
      body: Container(
        height: 810.h,
        width: 414.w,
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
        child: SingleChildScrollView(
          child: Container(
            height: 900.h,
            width: 414.w,
            margin: EdgeInsets.only(right: 7.w, left: 7.w),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40.r)
            ),
            child: Padding(
              padding:  EdgeInsets.only(right: 20.w, left: 20.w),
              child: FutureBuilder<Getprofile>(
                  future: getProfile().getprofile(regid),
                  builder: (context, snapshot) {
                    return (snapshot.hasData) ?
                    SingleChildScrollView(
                      child: Container(

                        height: 900.h,

                        child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  _showDialog();
                                },
                                child: Padding(
                                    padding:
                                    EdgeInsets.only(top: 13.0.h,),
                                    child: Container(

                                      height: 100.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                         shape: BoxShape.circle,
                                          //borderRadius: BorderRadius.circular(50),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image:NetworkImage(snapshot.data!.userImage!),
                                          ),
                                          border: Border.all(
                                              color: Colors.black, width: 2.0.w)),
                                      child: (image != null) ?Image.file(
                                        image!,
                                        height: 100.h,
                                        width: 100.w,
                                        fit: BoxFit.cover,
                                      )
                                          : null
                                      ),
                                    )


                                ),


                              SizedBox(
                                  height: 30.h
                              ),
                              Text("${snapshot.data!.detail!.name}",
                                style: TextStyle(
                                    fontFamily: "Franklin_Gothic",
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500
                                ),),

                              SizedBox(
                                height: 60.h,
                              ),
                              Row(
                                children: [
                                  Text("Gender :", style: TextStyle(
                                      fontFamily: "Franklin_Gothic",
                                      fontSize: 15.sp,
                                      color: Colors.grey
                                  ),),

                                ],
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              Row(
                                children: [
                                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  buildOption("assets/male.png", 0, "M"),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  buildOption("assets/female.png", 1, "F"),
                                ],
                              )                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                children: [
                                  Text("Full Name:", style: TextStyle(
                                      fontFamily: "Franklin_Gothic",
                                      fontSize: 15,
                                      color: Colors.grey
                                  ),),


                                ],
                              ),

                              TextFormField(
                                // onChanged: (value){
                                //   _fullnameforC=value;
                                // },
                                controller: _fullnameC,
                                //initialValue: "${snapshot.data!.detail!.name}",
                                decoration: InputDecoration(
                                    hintText: "Full Name",
                                    hintStyle: TextStyle(
                                        fontFamily: "Franklin_Gothic")),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Padding(
                                padding:  EdgeInsets.fromLTRB(0,0,275.w,0),
                                child: Text("Email Address:",
                                  style: TextStyle(
                                    fontFamily: "Franklin_Gothic",
                                    fontSize: 15.sp,
                                    color: Colors.grey
                                ),),
                              ),
                              TextFormField(
                                // onChanged: (value){
                                //   _emailidC=value;
                                // },

                                controller: _emailidC,
                                //initialValue: "${snapshot.data!.detail!.email}",
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    hintStyle:
                                    TextStyle(fontFamily: "Franklin_Gothic")),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Padding(
                                padding:  EdgeInsets.fromLTRB(0,0,290.w,0),
                                child: Text("Mobile No. :",
                                  style: TextStyle(
                                      fontFamily: "Franklin_Gothic",
                                      fontSize: 15.sp,
                                      color: Colors.grey
                                  ),),
                              ),
                              TextFormField(


                                //initialValue: "${snapshot.data!.detail!.mobile}",
                                controller: _mobileC,
                                decoration: InputDecoration(
                                  hintText: "Mobile",
                                  hintStyle:
                                  TextStyle(fontFamily: "Franklin_Gothic"),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Row(
                                children: [
                                  Text("Your Bio:", style: TextStyle(
                                      fontFamily: "Franklin_Gothic",
                                      fontSize: 15.sp,
                                      color: Colors.grey
                                  ),),
                                ],
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              TextFormField(
                                // onChanged: (value){
                                //   _bioC=value;
                                // },
                                controller: _bioC,
                                //initialValue: "${snapshot.data!.detail!.bio}",
                                minLines: 3,
                                maxLines: 10,
                                decoration: InputDecoration(

                                  border: OutlineInputBorder(),
                                  hintText: "Your Bio",
                                  hintStyle: TextStyle(
                                      fontFamily: "Franklin_Gothic"),
                                ),

                              ),
                              InkWell(
                                onTap: () async {
                                  print("aaaaaaa");


                                  final Updateprofilemodel user = await updateProfile()
                                      .updateprofile(
                                      regid,
                                      _emailidC.text,
                                      _fullnameC.text,
                                      
                                      "",
                                      gender,
                                      base64image,
                                      _bioC.text,
                                      (image?.path != null)?
                                image!.path:fileStream);
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
                                    }
                                    else {
                                      setState(() {
                                        Fluttertoast.showToast(
                                          msg: user.msg,
                                          backgroundColor: Color(0xff060E57),
                                          textColor: Colors.white,
                                        );
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pop();
                                      });
                                    }
                                  }); // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Verification()))
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 50.h),
                                  alignment: Alignment.center,
                                  height: 40.h,
                                  width: 100.w,
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
                                    "Update",
                                    style: TextStyle(
                                        fontFamily: "Franklin_Gothic",
                                        color: Color(0xffFFFFFF),
                                        fontSize: 20.sp),
                                  ),
                                ),
                              ),
                            ]
                        ),
                      ),
                    ) : Center(child: Text("Data Not Found"),);
                  }
              ),
            ),
          ),
        ),
      ),


    );
  }

  // topnavigation() {
  //   return
  // }
  buildOption(String image, int index, value) {
    return Column(
      children: [
        isSelected[index] ? InkWell(
          onTap: () {
            setState(() {

            });
          },
          child: Container(
            height: 35.h,
            width: 35.w,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("${image}")
                ),
                border: Border(
                    bottom: BorderSide(
                      color: isSelected[0] ? Colors.blue : Colors.pink,
                      width: 2.w,)
                )
            ),

          ),
        ) : InkWell(
          onTap: () {
            setState(() {
              gender = value;
              selectedOption = index;
              isOptionSelected(index);
              print(gender);
            });
          },
          child: Container(
              height: 30.h,
              width: 30.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("$image")
                  )
              )
          ),
        ),
      ],
    );
  }
  void isOptionSelected(int index) {
    var previousIndex = isSelected.indexOf(true);
    isSelected[index] = true;
    isSelected[previousIndex] = false;
  }
  // Future getImage(ImgSource source) async {
  //   var image = await ImagePickerGC.pickImage(
  //       enableCloseButton: true,
  //       closeIcon: Icon(
  //         Icons.close,
  //         color: Colors.red,
  //         size: 12,
  //       ),
  //       context: context,
  //       source: source,
  //       barrierDismissible: true,
  //       cameraIcon: Icon(
  //         Icons.camera_alt,
  //         color: Colors.red,
  //       ), //cameraIcon and galleryIcon can change. If no icon provided default icon will be present
  //       cameraText: Text(
  //         "From Camera",
  //         style: TextStyle(color: Colors.red),
  //       ),
  //       galleryText: Text(
  //         "From Gallery",
  //         style: TextStyle(color: Colors.blue),
  //       ));
  //   setState(() {
  //     _image = image;
  //   });
  // }
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





