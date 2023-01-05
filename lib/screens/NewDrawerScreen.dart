import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/getProfile.dart';
import 'package:lechalo/screens/loginScreen.dart';
import 'package:lechalo/screens/notification.dart';
import 'package:lechalo/screens/profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewDrawerView extends StatefulWidget {
  @override
  _NewDrawerViewState createState() => _NewDrawerViewState();
}

class _NewDrawerViewState extends State<NewDrawerView> {
  String userid = "";
  String? _user;
  //String? userimage;

  _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text(
                        "Are You Sure You Want To LogOut? ",
                        style: TextStyle(
                            fontFamily: "Franklin_Gothic", fontSize: 16),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() async {
                            print(id);

                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();

                            getNamePreference().then((String? id) {
                              setState(() {
                                userid = id.toString();
                              });
                            });
                            prefs.clear();

                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                                (route) => true);
                          });
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
                            "Yes",
                            style: TextStyle(
                                fontFamily: "Franklin_Gothic",
                                color: Color(0xffFFFFFF),
                                fontSize: 20),
                          ),
                        ),
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
                            "no",
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

  late Future<Getprofile> data;
  String? id;

  Future<String?> getNamePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("id");
    print(id.toString() + "AnkitChangela");
    print(userid.toString() + "AnkitChangela");
    return id;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNamePreference().then((id) {
      setState(() {
        print(">>>>>>>>>>>. ${id}");
        userid = id!;
        print("ankit" + userid.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder<Getprofile>(
                future: getProfile().getprofile(userid),
                builder: (context, snapshots) {
                  return (snapshots.hasData)?
                    Container(
                    child: Stack(
                      children: [
                        BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaY: 30,
                            sigmaX: 30,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3)),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Column(
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        icon: Icon(
                                          CupertinoIcons.xmark_circle_fill,
                                          size: 33,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Notifications()));
                                        },
                                        icon: Icon(
                                          Icons.notification_important,
                                          size: 33,
                                        ),
                                      )
                                    ]),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03),
                                      InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Profile()));
                                          },
                                          child: Container(
                                            height: 100,
                                            width: 100,
                                            // child: Image.network(snapshot.data!.userImage!,fit: BoxFit.cover,),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(

                                                      snapshots.data!.userImage.toString(),
                                                     // snapshot.data.userImage?.toString(),
                                                    ))),

                                            // child: Image.file(File(snapshot
                                            //     .data!.detail!.userimage)),
                                          )),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.04),
                                      Text(
                                        "Name : ",
                                        style: TextStyle(
                                            fontFamily: "Franklin_Gothic",
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                       // snapshot.data?.detail?.name.toString(),
                                        snapshots.data!.detail!.name.toString(),
                                        style: TextStyle(
                                            fontFamily: "Franklin_Gothic",
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),

                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                      ),

                                      Text(
                                        "Email Address : ",
                                        style: TextStyle(
                                            fontFamily: "Franklin_Gothic",
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        snapshots.data!.detail!.email.toString(),
                                        style: TextStyle(
                                          fontFamily: "Franklin_Gothic",
                                          fontSize: 14,
                                          //fontWeight: FontWeight.w500
                                        ),
                                      ),

                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                      ),

                                      Text(
                                        "Mobile number : ",
                                        style: TextStyle(
                                            fontFamily: "Franklin_Gothic",
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        snapshots.data!.detail!.mobile.toString(),
                                        style: TextStyle(
                                          fontFamily: "Franklin_Gothic",
                                          fontSize: 14,
                                          //fontWeight: FontWeight.w500
                                        ),
                                      ),

                                      // Padding(
                                      //   padding: const EdgeInsets.only(
                                      //       top: 60.0, right: 20, left: 20),
                                      //   child: Row(
                                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      //     children: [
                                      //       Expanded(
                                      //         child: Column(
                                      //           crossAxisAlignment: CrossAxisAlignment.start,
                                      //           children: [
                                      //             Text(
                                      //               "Email Address : ",
                                      //               style: TextStyle(
                                      //                   fontFamily: "Franklin_Gothic",
                                      //                   fontSize: 20,
                                      //                   fontWeight: FontWeight.w500),
                                      //             ),
                                      //             Text(
                                      //               snapshot.data!.detail!.email.toString(),
                                      //               style: TextStyle(
                                      //                 fontFamily: "Franklin_Gothic",
                                      //                 fontSize: 14,
                                      //                 //fontWeight: FontWeight.w500
                                      //               ),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       ),
                                      //       Column(
                                      //         crossAxisAlignment: CrossAxisAlignment.start,
                                      //         children: [
                                      //           Text(
                                      //             "Mobile number : ",
                                      //             style: TextStyle(
                                      //                 fontFamily: "Franklin_Gothic",
                                      //                 fontSize: 20,
                                      //                 fontWeight: FontWeight.w500),
                                      //           ),
                                      //           Text(
                                      //             snapshot.data!.detail!.mobile.toString(),
                                      //             style: TextStyle(
                                      //               fontFamily: "Franklin_Gothic",
                                      //               fontSize: 14,
                                      //               //fontWeight: FontWeight.w500
                                      //             ),
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05),
                                      InkWell(
                                        onTap: () {
                                          _showDialog();
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(top: 50),
                                          alignment: Alignment.center,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.26,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color: Colors.transparent,
                                          ),
                                          child: Text(
                                            "Log Out",
                                            style: TextStyle(
                                                fontFamily: "Franklin_Gothic",
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ):Center(child: CircularProgressIndicator());
                })));
  }

//   void getProfileDetails() {
//
// data=getProfile().getprofile();
// print("aaa");
// print(data);
//   }
}
