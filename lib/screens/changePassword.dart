import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/updatepasswordmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePassword extends StatefulWidget {


  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController _oldpass = TextEditingController();
  TextEditingController _newpass = TextEditingController();
  String? regid;

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

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff060E57),
        leading: IconButton(padding: EdgeInsets.zero,onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),


        title: Text("Change Password",style: TextStyle(
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
              padding:  EdgeInsets.only(top: 20.h),
              child: ListView(
                  padding: EdgeInsets.only(right: 40.w,left: 40.w),
                  children:[ Column(

                    children: [
                      TextFormField(
                        controller: _oldpass,
                        decoration: InputDecoration(
                          hintText: "Current Password",
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      TextFormField(
                        controller: _newpass,
                        decoration: InputDecoration(
                          hintText: "New Passwrod",
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Confirm Password is Required';
                          }else if(value !=_newpass.text){
                            return 'Passwords should be same';
                          }
                          return null;
                        },

                        decoration: InputDecoration(
                          hintText: "Confirm New Password",
                        ),
                      ),
                      InkWell(
                        onTap: () async{
                          // if (!_formkey.currentState!.validate()) {
                          //   return;
                          // }
                          // else {
                            print("aaaaaaa");
                            final Updatepasswordmodel user = await updatePassword()
                                .updatepassword(regid, _oldpass.text, _newpass.text);

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

                            Navigator.of(context).pop();
                       //   }
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 50.h),
                          alignment: Alignment.center,
                          height: 50.h,
                          width: 130,
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
