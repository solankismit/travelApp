import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/getwalletmodel.dart';
import 'package:lechalo/models/walletreqModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AvailableFunds extends StatefulWidget {


  @override
  _AvailableFundsState createState() => _AvailableFundsState();
}

class _AvailableFundsState extends State<AvailableFunds> {
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
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(

                          "Your request has been processed. Fund Transfer done after admin approval",
                          style: TextStyle(

                              fontFamily: "Franklin_Gothic", fontSize: 19),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();

                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xff060E57),
                                    Color(0xff010311)
                                  ])),
                          child: Text(
                            "Ok",
                            style: TextStyle(
                                fontFamily: "Franklin_Gothic",
                                color: Color(0xffFFFFFF),
                                fontSize: 20),
                          ),
                        ),
                      ),
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
                )),
          );
        });
  }
  TextEditingController _amount =TextEditingController();
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff060E57),
        leading: IconButton(padding: EdgeInsets.zero, onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),


        title: Text("Available Funds", style: TextStyle(
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
            height: 810.h,
            width: 414.w,
            margin: EdgeInsets.only(right: 7.w, left: 7.w),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40.r)
            ),
            child: Padding(
              padding:  EdgeInsets.only(top: 50.h),
              child:FutureBuilder<Getwalletmodel>(future:getWallet().getwallet(regid),
                  builder: (context,snapshot){
                    return (snapshot.hasData)? ListView(
                    padding: EdgeInsets.only(right: 30.w, left: 30.w),
                    children: [ Column(

                      children: [
                        Container(
                          height: 50.h,
                          width: 300.w,
                          decoration: (
                              BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(color: Colors.grey.shade400),

                                boxShadow: [BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 3,
                                    offset: Offset(0, 1)

                                )
                                ],

                              )
                          ),
                          child: Center(
                            child: Text("${snapshot.data!.data.wallet}",
                              style: TextStyle(
                                  fontFamily: "Franklin_Gothic",
                                  fontSize: 25.sp,
                                  color: Color(0xff010312)
                              ),),
                          ),

                        ),
                        SizedBox(
                          height: 70.h,
                        ),
                        (snapshot.data!.data.wallet=="0")?Text("You don't have any funds for transfer",
                          style: TextStyle(
                              fontFamily: "Franklin_Gothic",
                              fontSize: 20.sp,
                              color: Color(0xff000000)
                          ),):Container(),
                        SizedBox(
                          height: 30.sp,
                        ),
                        Text(
                          "If you have travelled with booked co-travellers, enter their booking codes in their rides and get your payment faster. Otherwise you can offer a ride to get co-travellers.",
                          style: TextStyle(
                              fontFamily: "Franklin_Gothic",
                              fontSize: 15.sp,
                              color: Colors.grey
                          ),),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextFormField(
                          controller: _amount,
                          decoration: InputDecoration(
                            hintText: "Enter Amount",
                          ),
                        ),
                        InkWell(
                          onTap: () async{
                            final WalletreqModel user= await Walletreq().walletreq(regid,_amount.text,_amount.text);
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
                                _showDialog();
                              });
                            }
                                

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
                              "Redeem",
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
                ):Center(child: CircularProgressIndicator());
              }
              ),
            ),
          ),
        ),


      ),
    );
  }
}