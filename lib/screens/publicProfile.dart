import 'package:flutter/material.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/getProfile.dart';
import 'package:lechalo/models/publicprofilemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lechalo/models/getProfile.dart';

class PublicProfile extends StatefulWidget {


  @override
  _PublicProfileState createState() => _PublicProfileState();
}

class _PublicProfileState extends State<PublicProfile> {
  String? regid;
  late Future<Getprofile> data;
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
    final Future<Getprofile> user = getProfile()
        .getprofile(regid) ;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff060E57),
        leading: IconButton(padding: EdgeInsets.zero, onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),


        title: Text("Public Profile", style: TextStyle(
            fontFamily: "Franklin_Gothic"
        ),),
        centerTitle: true,
        elevation: 0,

      ),
      body: FutureBuilder<PubLicprofilemodel>(
        future: Publicprofile().publicprofile(regid),
        builder: (context,snapshot) {
          return snapshot.hasData?Container(
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
              height: 810.h,
              margin: EdgeInsets.only(right: 7.w, left: 7.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40.r)
              ),
              child: Padding(
                padding:  EdgeInsets.only(top: 20.h),
                child: ListView(
                    padding: EdgeInsets.only(right: 40.w, left: 40.w),
                    children: [ Column(

                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: 13.0.h),
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  height: 100.h,
                                  width: 100.h,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage("assets/user.png")
                                         // image: NetworkImage(snapshot.data!.userImage!)
                                  )
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                            height: 30.h
                        ),
                        Text(snapshot.data!.detail.name, style: TextStyle(
                            fontFamily: "Franklin_Gothic",
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500
                        ),),
                        SizedBox(
                          height: 40.h,
                        ),

                        Row(
                          children: [
                            Text("Verification", style: TextStyle(
                                fontFamily: "Franklin_Gothic",
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500
                            ),),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_circle, color: Colors.green.shade300,
                              size: 17,),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text("Mobile Number Verified", style: TextStyle(
                                fontFamily: "Franklin_Gothic",
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500
                            ),),
                          ],
                        ),
                        SizedBox(
                          height: 25.h,
                        ),

                        Row(
                          children: [
                            Text("Activity", style: TextStyle(
                                fontFamily: "Franklin_Gothic",
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500
                            ),),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: 25.w),
                          child: Row(
                            children: [
                              Text("Ride offered : ${snapshot.data!.detail.offers}", style: TextStyle(
                                  color: Color(0xff020744),
                                  fontFamily: "Franklin_Gothic",
                                  fontSize: 16.sp
                              ),),
                            ],
                          ),
                        ),

                        Padding(
                          padding:  EdgeInsets.only(left: 25.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Member Since : ${snapshot.data!.detail.createdAt.hour}:${snapshot.data!.detail.createdAt.minute}", style: TextStyle(
                                  color: Color(0xff020744),
                                  fontFamily: "Franklin_Gothic",


                                  fontSize: 16.sp
                              ),),
                              Text( "${snapshot.data!.detail.createdAt.day}/${snapshot.data!.detail.createdAt.month}/${snapshot.data!.detail.createdAt.year}", style: TextStyle(
                                  color: Color(0xff020744),
                                  fontFamily: "Franklin_Gothic",


                                  fontSize: 16.sp
                              ),),
                            ],
                          ),
                        ),


                      ],
                    ),
                    ]
                ),
              ),
            ),


          ):Center(child: CircularProgressIndicator(color: Colors.white,));
        }
      ),
    );
  }
}