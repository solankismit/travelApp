import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/acceptorrejectbookingrequestmodel.dart';
import 'package:lechalo/models/acceptorrejecthirevehiclerequest.dart';
import 'package:lechalo/models/cancelreasonlistmodel.dart';
import 'package:lechalo/models/getnotification1.dart';
import 'package:lechalo/models/hirevehicleaddbidrateModel.dart';
import 'package:lechalo/screens/parcelDetailsinNotification.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  var _number;
  var _url="https://api.whatsapp.com//send?phone=+91";
  TextEditingController _amount=TextEditingController();
  int _Rvalue1=1;
  String? bookingid;
  _showDialog(String iNotificationID) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Padding(
                  padding:  EdgeInsets.all(8.0.h),
                  child: Container(

                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Enter Your Bid ",
                          style: TextStyle(
                              fontFamily: "Franklin_Gothic", fontSize: 16.sp),
                        ),

                        TextFormField(
                          controller: _amount,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(

                            hintText: "Enter Amount",
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () async{
                                print(_amount.text);
                                print(iNotificationID);
                                final HirevehicleaddbidrateModel user = await hirevehicleAddbidrate().hirevehicleaddbidrate(_amount.text,iNotificationID);
                                if(user.status=="success"){
                                  setState(() {
                                    Fluttertoast.showToast(
                                      msg: user.msg,
                                      backgroundColor: Color(0xff060E57),
                                      textColor: Colors.white,
                                    );
                                  });
                                  Navigator.of(context).pop();

                                }
                                else{
                                  setState(() {
                                    Fluttertoast.showToast(
                                      msg: user.msg,
                                      backgroundColor: Color(0xff060E57),
                                      textColor: Colors.white,
                                    );
                                  });
                                }

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
                                  "Submit",
                                  style: TextStyle(
                                      fontFamily: "Franklin_Gothic",
                                      color: Color(0xffFFFFFF),
                                      fontSize: 20),
                                ),
                              ),
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
                                  "Cancel",
                                  style: TextStyle(
                                      fontFamily: "Franklin_Gothic",
                                      color: Color(0xffFFFFFF),
                                      fontSize: 20),
                                ),
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
                  ),
                )),
          );
        });
  }
  _showDialog2(notificationid) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaY: 40, sigmaX: 40),
            child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: FutureBuilder<Cancelreasonlistmodel>(future: cancelReasonlist().cancelreasonlist(),builder: (context,snapshot) {
                    return (snapshot.hasData)?Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Column(
                        children: [
                          Text(
                            "Select a reason for rejecting ride",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Franklin_Gothic",
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: [
                                Radio(
                                    activeColor: Colors.black,

                                    value: int.parse(snapshot.data!.data[0].id),
                                    groupValue: _Rvalue1,

                                    onChanged: (value)async {

                                      print("aaaaaaa");
                                      final Acceptorrejecthirevehiclerequest user = await acceptOrrejecthirevehiclerequest().acceptorrejecthirevehiclerequest(notificationid,value.toString(), "Reject");

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
                                            Navigator.of(context).pop();
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
                                    }
                                ),
                                Text(
                                  "${snapshot.data!.data[0].text}",
                                  style: TextStyle(
                                      fontFamily: "Franklin_Gothic",

                                      fontSize: 19),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: [
                                Radio(

                                    activeColor: Colors.black,

                                    value: int.parse(snapshot.data!.data[1].id),
                                    groupValue: _Rvalue1,
                                    onChanged: (value)async {



                                      print("aaaaaaa");
                                      final Acceptorrejecthirevehiclerequest user = await acceptOrrejecthirevehiclerequest().acceptorrejecthirevehiclerequest(notificationid,value.toString(), "Reject");

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
                                            Navigator.of(context).pop();
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
                                    }
                                ),
                                Text(
                                  "${snapshot.data!.data[1].text}",
                                  style: TextStyle(
                                      fontFamily: "Franklin_Gothic",

                                      fontSize: 19),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),


                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.045,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.3,
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
                                "Cancel",
                                style: TextStyle(
                                    fontFamily: "Franklin_Gothic",
                                    color: Color(0xffFFFFFF),
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ):Center(child: CircularProgressIndicator());

                  }
                  ),
                )),
          );
        });
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'LeChalo',
        text: 'Click on below link to download LeChalo Android App ',
        linkUrl: ' http://play.google.com/store/apps/details?id=com.leChalo',
        chooserTitle: 'Share App via');
  }

  String? regid;
  late Future<Getnotification1?> data;
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
    final Future<Getnotification1> user =
        getNotification1().getnotification1(regid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff060E57),
          leading: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          actions: [
            IconButton(
              onPressed: share,
              icon: Icon(CupertinoIcons.arrowshape_turn_up_right_fill),
              color: Colors.white,
            )
          ],
          title: Text(
            "Notifications",
            style: TextStyle(fontFamily: "Franklin_Gothic"),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xff060E57), Color(0xff010311)])),
                child: Container(
                    height: 814.h,
                    width: 414.w,
                    margin: EdgeInsets.only(right: 7.w, left: 7.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40.r)),
                    child: Padding(
                      padding:  EdgeInsets.only(top: 15.0.h, bottom: 15.h),
                      child: FutureBuilder<Getnotification1>(
                          future: getNotification1().getnotification1(regid),
                          builder: (context, snapshop) {
                            return (snapshop.hasData)
                                ? ListView.builder(
                                itemCount: snapshop.data!.data.length,
                                itemBuilder: (context, index) {
                                  var server = snapshop.data!.data[index];
                                  return Container(
                                    margin: EdgeInsets.all(10.h),
                                    // height: MediaQuery.of(context).size.height *
                                    //     0.25,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: (BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(24.r),
                                      border:
                                      Border.all(color: Color(0xffAF0606)),
                                    )),
                                    child: Padding(
                                      padding:  EdgeInsets.all(8.0.h),
                                      child: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.all(20.h),
                                              height: 65.h,
                                              width: 65.w,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/taxi.png"))),
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Text(
                                                    "${server.title}",
                                                    style: TextStyle(
                                                        color: Color(0xff020744),
                                                        fontFamily: "Franklin_Gothic",
                                                        fontSize: 18.sp),
                                                  ),
                                                  // SizedBox(
                                                  //   height: MediaQuery.of(context).size.height*0.03,
                                                  // ),
                                                  Text(
                                                    "${server.notification}",
                                                    style: TextStyle(
                                                        color: Color(0xff070000),
                                                        fontFamily: "Franklin_Gothic",
                                                        fontSize: 18.sp),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "${server.createdAt.day}/${server.createdAt.month}/${server.createdAt.year}",
                                                        style: TextStyle(
                                                            color: Color(0xff070000),
                                                            fontFamily:
                                                            "Franklin_Gothic",
                                                            fontSize: 17.sp),
                                                      ),
                                                      SizedBox(
                                                        width: 30.w,
                                                      ),
                                                      Text(
                                                        "${server.createdAt.hour}:${server.createdAt.minute}",
                                                        style: TextStyle(
                                                            color: Color(0xff070000),
                                                            fontFamily:
                                                            "Franklin_Gothic",
                                                            fontSize: 17.sp),
                                                      ),
                                                    ],
                                                  ),
                                                  (server.type=="Request")
                                                      ? Row(
                                                    children: [
                                                      FlatButton(
                                                        onPressed: () async {
                                                          print("aaaaaaa");
                                                          final Acceptorrejectbookingrequestmodel user = await acceptorrejectBookingrequest().acceptorrejectbookingrequest(server.bookingrequestid,"", "Accept");

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
                                                        child: Text(
                                                          "Accept",
                                                          style: TextStyle(
                                                              color:
                                                              Colors.white),
                                                        ),
                                                        color:
                                                        Color(0xff020744),
                                                      ),
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      FlatButton(
                                                        onPressed: () async {
                                                          print("aaaaaaa");
                                                          final Acceptorrejectbookingrequestmodel user = await acceptorrejectBookingrequest().acceptorrejectbookingrequest(server.bookingrequestid,"", "Reject");

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
                                                        child: Text(
                                                          "Reject",
                                                          style: TextStyle(
                                                              color:
                                                              Colors.white),
                                                        ),
                                                        color:
                                                        Color(0xff020744),
                                                      ),
                                                    ],
                                                  )
                                                      : Container(),
                                                  (server.type =="RequestSendParcel")?
                                                  Row(
                                                    children: [
                                                      FlatButton(onPressed: (){
                                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NParcelDetails(server.id,server.userid,server.iSendParcelId)));

                                                      }, child: Text(
                                                        "View Details",
                                                        style: TextStyle(
                                                            color:
                                                            Colors.white),
                                                      ),
                                                        color:
                                                        Color(0xff020744),
                                                      ),
                                                    ],
                                                  ):Container(),
                                                  (server.type=="Bid")?
                                                  Row(
                                                    children: [
                                                      FlatButton(onPressed: (){
                                                        _showDialog(server.id);
                                                        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NParcelDetails(server.id,server.userid,server.iSendParcelId)));

                                                      }, child: Text(
                                                        "Bid",
                                                        style: TextStyle(
                                                            color:
                                                            Colors.white),
                                                      ),
                                                        color:
                                                        Color(0xff020744),
                                                      ),
                                                    ],
                                                  ):Container(),
                                                  (server.type=="Pending")
                                                      ? Row(
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.all(8.0.h),
                                                        child: FlatButton(
                                                          onPressed: () async {
                                                            print("aaaaaaa");
                                                            final Acceptorrejecthirevehiclerequest user = await acceptOrrejecthirevehiclerequest().acceptorrejecthirevehiclerequest(server.id,"", "Accept");

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
                                                          child: Text(
                                                            "Accept",
                                                            style: TextStyle(
                                                                color:
                                                                Colors.white),
                                                          ),
                                                          color:
                                                          Color(0xff020744),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      Padding(
                                                        padding:  EdgeInsets.all(8.0.h),
                                                        child: FlatButton(
                                                          onPressed: () async {
                                                            _showDialog2(server.id);
                                                          },
                                                          child: Text(
                                                            "Reject",
                                                            style: TextStyle(
                                                                color:
                                                                Colors.white),
                                                          ),
                                                          color:
                                                          Color(0xff020744),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                      : Container(),
                                                  (server.type=="Accept"||server.type=="IntrestedPickParcel")
                                                      ? Row(
                                                    children: [
                                                      Padding(
                                                        padding:  EdgeInsets.all(8.0.h),
                                                        child:  InkWell(
                                                          onTap:(){
                                                            launch("tel:${server.mobile}");
                                                          } ,

                                                          child: Container(
                                                            height: 70.h,
                                                            width: 70.w,
                                                            decoration: BoxDecoration(
                                                                image: DecorationImage(
                                                                    image: AssetImage(
                                                                        "assets/call.png")
                                                                )
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      Padding(
                                                        padding:  EdgeInsets.all(8.0.h),
                                                        child:InkWell(onTap: (){

                                                          _number=server.mobile;
                                                          print(_number);
                                                          _launchURL(_number);



                                                        },
                                                          child: Container(
                                                            height: 70.h,
                                                            width: 70.w,
                                                            decoration: BoxDecoration(
                                                                image: DecorationImage(
                                                                    image: AssetImage(
                                                                        "assets/whatsapp.png")
                                                                )
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                      : Container(),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                })
                                : Center(
                              child: Text("Data Not Found"),
                            );
                          }),
                    ))),
          ],

        ));
  }
  void _launchURL(_number) async =>
      await canLaunch(_url+_number) ? await launch(_url+_number) : throw 'Could not launch ${_url+_number}';
}
