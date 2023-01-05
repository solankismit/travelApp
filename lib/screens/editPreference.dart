
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/getpreferencemodel.dart';
import 'package:lechalo/models/myschedule.dart';
import 'package:lechalo/models/preferencemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditPreference extends StatefulWidget {
  const EditPreference({Key? key}) : super(key: key);

  @override
  _EditPreferenceState createState() => _EditPreferenceState();
}

class _EditPreferenceState extends State<EditPreference> {
  String? regid;
  late Future<Preferencemodel?> data;
  String? id;
  String pet="";
  String music="";
  String smok="";
  String chat="";

  Future<String?> getNamePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("id");
    return id;
  }
  late String _value1;
  late String _value2;
  late String _value3;
  late String _value4;
  bool value1 = true;
  bool value2 = true;
  bool value3 = true;
  bool value4 = true;
  @override
  void initState() {
    Future.delayed(Duration.zero,()async{
    final Getpreferencemodel user = await getPreference().getpreference(regid);
    _value1=user.detail.pet;
    _value2=user.detail.music;
    _value3=user.detail.smoke;
    _value4=user.detail.chat;
    print("pet:$pet");
    print("music:$music");
    print(smok);
    print(chat);
    value1=(_value1 !="Allow") ? false : true;
    value2=(_value2 !="Allow") ? false : true;
    value3=(_value3 !="Allow") ? false : true;
    value4=(_value4 !="Allow") ? false : true;


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
        leading: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: Text(
          "Edit Preference",
          style: TextStyle(fontFamily: "Franklin_Gothic"),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff060E57), Color(0xff010311)])),
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.only(right: 7.w, left: 7.w),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40.r)),
          child: Padding(
            padding:  EdgeInsets.only(top: 20.h),
            child: FutureBuilder<Getpreferencemodel>(
              future: getPreference().getpreference(regid),
              builder: (context,snapshots) {
                // value1=(snapshots.data!.detail.pet!="Don't Allow")?true:false;
                // value2=(snapshots.data!.detail.music!="Don't Allow")?true:false;
                // value3=(snapshots.data!.detail.smoke!="Don't Allow")?true:false;
                // value4=(snapshots.data!.detail.chat!="Don't Allow")?true:false;

                return
                  (snapshots.hasData)?ListView(
                    padding: EdgeInsets.only(right: 25.w, left: 25.w),
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Yes for",
                                style: TextStyle(
                                    fontFamily: "Franklin_Gothic",
                                    color: Colors.grey,
                                    fontSize: 16.sp),
                              ),
                              Text(
                                " allow",
                                style: TextStyle(
                                    fontFamily: "Franklin_Gothic",
                                    color: Color(0xff050D52),
                                    fontSize: 16.sp),
                              ),
                              Text(
                                " and No for",
                                style: TextStyle(
                                    fontFamily: "Franklin_Gothic",
                                    color: Colors.grey,
                                    fontSize: 16.sp),
                              ),
                              Text(
                                " Don't allow",
                                style: TextStyle(
                                    fontFamily: "Franklin_Gothic",
                                    color: Color(0xffD60000),
                                    fontSize: 16.sp),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 60.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 60.h,
                                    width: 60.w,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/pets.png"))),
                                  ),
                                  Text(
                                    "Pets",
                                    style: TextStyle(
                                        fontFamily: "Franklin_Gothic",
                                        color: Color(0xff050D52),
                                        fontSize: 18.sp),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Transform.scale(
                                    scale: 0.8,
                                    child: CupertinoSwitch(
                                        value: value1,
                                        activeColor: Color(0xff050D52),
                                        trackColor: Color(0xffD60000),
                                        onChanged: (value1) {
setState(() {

});
                                            this.value1 = value1;
                                            print(this.value1);
                                            (this.value1 == true)
                                                ? _value1 = "Allow"
                                                : _value1 = "Don't Allow";
                                            print(_value1);

                                        }),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 60.h,
                                    width: 60.w,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/music.png"))),
                                  ),
                                  Text(
                                    "Music",
                                    style: TextStyle(
                                        fontFamily: "Franklin_Gothic",
                                        color: Color(0xff050D52),
                                        fontSize: 20.sp),
                                  ),
                                  SizedBox(
                                    height: 18.h,
                                  ),
                                  Transform.scale(
                                    scale: 0.8,
                                    child: CupertinoSwitch(
                                        value: value2,
                                        activeColor: Color(0xff050D52),
                                        trackColor: Color(0xffD60000),
                                        onChanged: (value2) {
                                          setState(() {
                                            this.value2 = value2;
                                            print(this.value2);
                                            (this.value2 == true)
                                                ? _value2 = "Allow"
                                                : _value2 = "Don't Allow";
                                            print(_value2);
                                          });
                                        }),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 60.h,
                                    width: 60.w,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                            AssetImage("assets/smoking.png"))),
                                  ),
                                  Text(
                                    "Smoking",
                                    style: TextStyle(
                                        fontFamily: "Franklin_Gothic",
                                        color: Color(0xff050D52),
                                        fontSize: 18.sp),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Transform.scale(
                                    scale: 0.8,
                                    child: CupertinoSwitch(
                                        value: value3,
                                        activeColor: Color(0xff050D52),
                                        trackColor: Color(0xffD60000),
                                        onChanged: (value3) {
                                          setState(() {
                                            this.value3 = value3;
                                            print(this.value3);
                                            (this.value3 == true)
                                                ? _value3 = "Allow"
                                                : _value3 = "Don't Allow";
                                            print(_value3);
                                          });
                                        }),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 60.h,
                                    width: 60.w,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/chattiness.png"))),
                                  ),
                                  Text(
                                    "Chattiness",
                                    style: TextStyle(
                                        fontFamily: "Franklin_Gothic",
                                        color: Color(0xff050D52),
                                        fontSize: 18.sp),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Transform.scale(
                                    scale: 0.8,
                                    child: CupertinoSwitch(
                                        value: value4,
                                        activeColor: Color(0xff050D52),
                                        trackColor: Color(0xffD60000),
                                        onChanged: (value4) {
                                          setState(() {
                                            this.value4 = value4;
                                            print(this.value4);
                                            (this.value4 == true)
                                                ? _value4 = "Allow"
                                                : _value4 = "Don't Allow";
                                            print(_value4);
                                          });
                                        }),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 70.h,
                          ),
                          InkWell(
                            onTap: () async {
                              print("v1");
                              print(_value1);
                              print("v2");
                              print(_value2);
                              print("v3");
                              print(_value3);
                              print("v4");
                              print(_value4);
                              final Preferencemodel user = await setPreference()
                                  .setpreference(
                                  regid, _value4, _value3, _value2,
                                  _value1, "Allow");

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
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => Verification(),
                                  //   ),
                                  // );
                                });
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50.h,
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
                    ]):Center(
                    child: Text("Data Not Found"),
                  );

              }
            ),
          ),
        ),
      ),
    );
  }
}
