import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/addaccountmodel.dart';
import 'package:lechalo/models/getaccountmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankAccount extends StatefulWidget {


  @override
  _BankAccountState createState() => _BankAccountState();
}

class _BankAccountState extends State<BankAccount> {
  String? regid;
  String? id;

  Future<String?> getNamePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("id");
    return id;
  }
  TextEditingController _country = TextEditingController();
  TextEditingController _account = TextEditingController();
  TextEditingController _bankname = TextEditingController();
  TextEditingController _ifsc = TextEditingController();

  @override
  void initState() {
    Future.delayed(Duration.zero,() async {
      final Getaccountmodel user = await getAccount().getaccount(regid);
      _country.text=user.detail[user.detail.length-1].country;
      _ifsc.text=user.detail[user.detail.length-1].ifsc;
      _bankname.text=user.detail[user.detail.length-1].bankname;
      _account.text=user.detail[user.detail.length-1].account;




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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff060E57),
        leading: IconButton(padding: EdgeInsets.zero,onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),


        title: Text("Bank Account",style: TextStyle(
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
                      Text("Get your money directly to your bank account of your choice. You will see it in your account in 1-5 weekdays.",style: TextStyle(
                          fontFamily: "Franklin_Gothic",
                          fontSize: 15.sp,
                          color: Colors.grey
                      ),),
                      SizedBox(
                        height: 50.h,
                      ),
                      TextFormField(
                        controller: _country,
                        decoration: InputDecoration(
                          hintText: "country",
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      TextFormField(
                        controller: _account,
                        decoration: InputDecoration(
                          hintText: "Account Number",
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      TextFormField(
                        controller: _bankname,
                        decoration: InputDecoration(
                          hintText: "Bank Name",
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      TextFormField(
                        controller: _ifsc,
                        decoration: InputDecoration(
                          hintText: "IFSC Code",
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          final Addaccountmodel user = await addAccount().addaccount(regid,_country.text, _account.text, _bankname.text, _ifsc.text);
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
                          margin: EdgeInsets.only(top: 50.h
                          ),
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
                            "Save",
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