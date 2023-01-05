import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lechalo/screens/allvehicle.dart';
import 'package:lechalo/screens/editPreference.dart';
import 'package:lechalo/screens/editProfile.dart';
import 'package:lechalo/screens/publicProfile.dart';
import 'package:lechalo/screens/vehicle/addVehicle.dart';
import 'package:lechalo/screens/vehicle/addedVehicle.dart';
import 'package:lechalo/screens/vehicle/idUpload/idProof.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Pdetails extends StatefulWidget {
  @override
  _PdetailsState createState() => _PdetailsState();
}

class _PdetailsState extends State<Pdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 550.h,
        width: 400.w,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(

          children: [
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("About You",style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Franklin_Gothic",
                        fontWeight: FontWeight.bold,

                        fontSize: 17.sp,
                      decoration: TextDecoration.underline,
                    ),),

                    TextButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditProfile()));
                      }, child:Text("Write my mini bio",style: TextStyle(
                        color: Color(0xff020272),
                        fontFamily: "Franklin_Gothic",


                        fontSize: 17.sp
                    ),), ),
                    TextButton(
                      onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditPreference()));
                      }, child:Text("Add my preferences",style: TextStyle(
                        color: Color(0xff020272),
                        fontFamily: "Franklin_Gothic",


                        fontSize: 17.sp
                    ),), ),
                    Text("Verification",style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Franklin_Gothic",
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,

                        fontSize: 17.sp

                    ),),

                    TextButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>IdProof()));
                      }, child:Text("Verify my ID",style: TextStyle(
                        color: Color(0xff020272),
                        fontFamily: "Franklin_Gothic",


                        fontSize: 17.sp
                    ),), ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Vehicle",style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Franklin_Gothic",
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,

                        fontSize: 17.sp
                    ),),

                    TextButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddVehicle()));
                      }, child:Text("Add vehicle",style: TextStyle(
                        color: Color(0xff020272),
                        fontFamily: "Franklin_Gothic",


                        fontSize: 17.sp
                    ),), ),
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AllAddedVehicles()));
                      }, child:Text("My vehicle",style: TextStyle(
                        color: Color(0xff020272),
                        fontFamily: "Franklin_Gothic",


                        fontSize: 17.sp
                    ),), ),
                    Text("Profile",style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Franklin_Gothic",
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,

                        fontSize: 17.sp
                    ),),

                    TextButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PublicProfile()));
                      }, child:Text("See my public profile",style: TextStyle(
                        color: Color(0xff020272),
                        fontFamily: "Franklin_Gothic",


                        fontSize: 17.sp
                    ),), ),
                  ],
                )
              ],
            )







          ],
        ),
      ),
    );
  }
}
