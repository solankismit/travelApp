import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/getaddressmodel.dart';
import 'package:lechalo/models/setaddressmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostalAddress extends StatefulWidget {


  @override
  _PostalAddressState createState() => _PostalAddressState();
}

class _PostalAddressState extends State<PostalAddress> {
  TextEditingController _address = TextEditingController();
  String? regid;

  String? id;

  Future<String?> getNamePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("id");
    return id;
  }

  @override
  void initState() {
    Future.delayed(Duration.zero,() async {
      final Getaddressmodel user = await getAddress().getaddress(regid);
      _address.text=user.detail.address;

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
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff060E57),
        leading: IconButton(padding: EdgeInsets.zero,onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),


        title: Text("Postal Address",style: TextStyle(
            fontFamily: "Franklin_Gothic"
        ),),
        centerTitle: true,
        elevation: 0,

      ),
      body: Container(
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
        child: Form(
          child: Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(right: 7.w,left: 7.w),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40.r)
            ),
            child: Padding(
              padding:  EdgeInsets.only(top: 110.h),
              child: ListView(
                  padding: EdgeInsets.only(right: 40.w,left: 40.w),
                  children:[ Column(

                    children: [
                      TextFormField(
                        controller: _address,
                        decoration: InputDecoration(
                          hintText: "Street Address",
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
            Text("We just need a posta address so the postie can find you.",style: TextStyle(
                color: Color(0xff020272),
                fontFamily: "Franklin_Gothic",


                fontSize: 17.sp
            ),),

                      InkWell(
                        onTap: () async {
                          final Setaddressmodel user = await setAddress().setaddress(regid, _address.text);

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
                          margin: EdgeInsets.only(top: 50.h),
                          alignment: Alignment.center,
                          height: 50.h,
                          width: 130.w,
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
                            "Done",
                            style: TextStyle(
                                fontFamily: "Franklin_Gothic",
                                color: Color(0xffFFFFFF),
                                fontSize: 20.sp),
                          ),
                        ),
                      ),



                    ],
                  ),
                  ]
              ),
            ),
          ),
        ),


      ),
    );
  }
}
