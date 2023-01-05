import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/acceptrejectsendparcelmodel.dart';
import 'package:lechalo/models/getpickparceldetailmodel.dart';
import 'package:lechalo/models/sendnotificationtopickparcelmodel.dart';

class NParcelDetails extends StatefulWidget {
  String notificationid;
  String driverid;
  String sendparcelid;

  NParcelDetails(this.notificationid, this.driverid, this.sendparcelid,
      {Key? key})
      : super(key: key);

  @override
  _NParcelDetailsState createState() => _NParcelDetailsState();
}

class _NParcelDetailsState extends State<NParcelDetails> {
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
          "Parcel Details",
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
          margin: EdgeInsets.only(right: 7, left: 7),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40)),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: FutureBuilder<Getpickparceldetailmodel>(
              future: getPickparceldetail()
                  .getpickparceldetail(widget.notificationid),
              builder: (context, snpshots) {
                return (snpshots.hasData)
                    ? ListView(children: [
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 40, right: 40),
                              child: Column(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    width: MediaQuery.of(context).size.width *
                                        0.59,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                snpshots.data!.data.vItemPhoto),
                                            fit: BoxFit.cover),
                                        border: Border.all(
                                            color: Colors.grey.shade400),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        snpshots.data!.data.tItemName,
                                        style: TextStyle(
                                            color: Color(0xff020744),
                                            fontFamily: "Franklin_Gothic",
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 13),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Parcel size ",
                                            style: TextStyle(
                                                color: Color(0xff020744),
                                                fontFamily: "Franklin_Gothic",
                                                fontSize: 16),
                                          ),
                                          Text(
                                            snpshots.data!.data.eItemSize,
                                            style: TextStyle(
                                                color: Color(0xff020744),
                                                fontFamily: "Franklin_Gothic",
                                                fontSize: 15),
                                          ),
                                          SizedBox(height: 13),
                                          Text(
                                            "Pickup Address",
                                            style: TextStyle(
                                                color: Color(0xff020744),
                                                fontFamily: "Franklin_Gothic",
                                                fontSize: 16),
                                          ),
                                          Text(
                                            snpshots.data!.data.vFromCity,
                                            style: TextStyle(
                                                color: Color(0xff020744),
                                                fontFamily: "Franklin_Gothic",
                                                fontSize: 15),
                                          ),
                                          SizedBox(height: 13),
                                          Text(
                                            "Delivery Address",
                                            style: TextStyle(
                                                color: Color(0xff020744),
                                                fontFamily: "Franklin_Gothic",
                                                fontSize: 16),
                                          ),
                                          Text(snpshots.data!.data.vToCity,
                                              style: TextStyle(
                                                  color: Color(0xff020744),
                                                  fontFamily: "Franklin_Gothic",
                                                  fontSize: 15)),
                                          SizedBox(height: 13),
                                          Text(
                                            "Sender Details",
                                            style: TextStyle(
                                                color: Color(0xff020744),
                                                fontFamily: "Franklin_Gothic",
                                                fontSize: 16),
                                          ),
                                          Text(
                                            snpshots.data!.data.vSenderName,
                                            style: TextStyle(
                                                color: Color(0xff020744),
                                                fontFamily: "Franklin_Gothic",
                                                fontSize: 15),
                                          ),
                                          SizedBox(height: 13),
                                          Text(
                                            "Receiver Name ",
                                            style: TextStyle(
                                                color: Color(0xff020744),
                                                fontFamily: "Franklin_Gothic",
                                                fontSize: 16),
                                          ),
                                          Text(
                                            snpshots.data!.data.vReceiverName,
                                            style: TextStyle(
                                                color: Color(0xff020744),
                                                fontFamily: "Franklin_Gothic",
                                                fontSize: 15),
                                          ),
                                          SizedBox(height: 13),
                                          Text(
                                            "Receiver No",
                                            style: TextStyle(
                                                color: Color(0xff020744),
                                                fontFamily: "Franklin_Gothic",
                                                fontSize: 16),
                                          ),
                                          Text(
                                            snpshots.data!.data.vReceiverMobile,
                                            style: TextStyle(
                                                color: Color(0xff020744),
                                                fontFamily: "Franklin_Gothic",
                                                fontSize: 15),
                                          ),
                                          SizedBox(height: 13),
                                          Text(
                                            "Pickup Time ?",
                                            style: TextStyle(
                                                color: Color(0xff020744),
                                                fontFamily: "Franklin_Gothic",
                                                fontSize: 16),
                                          ),
                                          Text(
                                            "Within 1 week",
                                            style: TextStyle(
                                                color: Color(0xff020744),
                                                fontFamily: "Franklin_Gothic",
                                                fontSize: 15),
                                          ),
                                          SizedBox(height: 13),
                                          Text(
                                            "Extra Details",
                                            style: TextStyle(
                                                color: Color(0xff020744),
                                                fontFamily: "Franklin_Gothic",
                                                fontSize: 16),
                                          ),
                                          Text(
                                            snpshots.data!.data.tExtraDetails,
                                            style: TextStyle(
                                                color: Color(0xff020744),
                                                fontFamily: "Franklin_Gothic",
                                                fontSize: 15),
                                          ),
                                          SizedBox(height: 13),
                                          Text(
                                            "Gross Weight",
                                            style: TextStyle(
                                                color: Color(0xff020744),
                                                fontFamily: "Franklin_Gothic",
                                                fontSize: 16),
                                          ),
                                          Text(
                                            snpshots.data!.data.dItemWeight,
                                            style: TextStyle(
                                                color: Color(0xff020744),
                                                fontFamily: "Franklin_Gothic",
                                                fontSize: 15),
                                          ),
                                          SizedBox(height: 13),
                                          Text(
                                            "Dimension",
                                            style: TextStyle(
                                                color: Color(0xff020744),
                                                fontFamily: "Franklin_Gothic",
                                                fontSize: 16),
                                          ),
                                          Text(
                                            snpshots.data!.data.dItemLength +
                                                "*" +
                                                snpshots.data!.data.dItemWidth +
                                                "*" +
                                                snpshots.data!.data.dItemHeight,
                                            style: TextStyle(
                                                color: Color(0xff020744),
                                                fontFamily: "Franklin_Gothic",
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      //                   Column(
                                      //                     crossAxisAlignment: CrossAxisAlignment.start,
                                      //                     children: [
                                      //                       Text("M",style: TextStyle(
                                      //                           color: Color(0xff020744),
                                      //                           fontFamily: "Franklin_Gothic",
                                      //
                                      //                           fontSize: 15
                                      //                       ),),
                                      //                       SizedBox(height: 13),
                                      //                       Text("Ahmedabad",style: TextStyle(
                                      //                           color: Color(0xff020744),
                                      //                           fontFamily: "Franklin_Gothic",
                                      //
                                      //                           fontSize: 15
                                      //                       ),),
                                      //                       SizedBox(height: 13),
                                      //                       Text("Gandhinagar",style: TextStyle(
                                      //                           color: Color(0xff020744),
                                      //                           fontFamily: "Franklin_Gothic",
                                      //
                                      //                           fontSize: 15
                                      //                       ),), SizedBox(height: 13),
                                      //                       Text("Me",style: TextStyle(
                                      //                           color: Color(0xff020744),
                                      //                           fontFamily: "Franklin_Gothic",
                                      //
                                      //                           fontSize: 15
                                      //                       ),), SizedBox(height: 13),
                                      //                       Text("Ashok",style: TextStyle(
                                      //                           color: Color(0xff020744),
                                      //                           fontFamily: "Franklin_Gothic",
                                      //
                                      //                           fontSize: 15
                                      //                       ),),  SizedBox(height: 13),
                                      //                       Text("989***9898",style: TextStyle(
                                      //                           color: Color(0xff020744),
                                      //                           fontFamily: "Franklin_Gothic",
                                      //
                                      //                           fontSize: 15
                                      //                       ),), SizedBox(height: 13),
                                      //                       Text("Within 1 week",style: TextStyle(
                                      //                           color: Color(0xff020744),
                                      //                           fontFamily: "Franklin_Gothic",
                                      //
                                      //                           fontSize: 15
                                      //                       ),),
                                      //                       SizedBox(height: 13),
                                      //                       Text("aksn***jhjh",style: TextStyle(
                                      //                           color: Color(0xff020744),
                                      //                           fontFamily: "Franklin_Gothic",
                                      //
                                      //                           fontSize: 15
                                      //                       ),),
                                      //                       SizedBox(height: 13),
                                      //                       Text("10",style: TextStyle(
                                      //                           color: Color(0xff020744),
                                      //                           fontFamily: "Franklin_Gothic",
                                      //
                                      //                           fontSize: 15
                                      //                       ),),
                                      //                       SizedBox(height: 13),
                                      //                       Text("10*15*21",style: TextStyle(
                                      //                           color: Color(0xff020744),
                                      //                           fontFamily: "Franklin_Gothic",
                                      //
                                      //                           fontSize: 15
                                      //                       ),),
                                      //
                                      // ]
                                      //
                                      //
                                      //                   )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FlatButton(
                                  onPressed: () async {
                                    print("aaaaaaa");
                                    final Acceptrejectsendparcelmodel user =
                                        await acceptrejectSendparcel()
                                            .acceptrejectsendparcel(
                                                widget.notificationid,
                                                "",
                                                "Accept");
                                    final Sendnotificationtopickparcelmodel
                                        user2 =
                                        await sendnotificationtoPickparcel()
                                            .sendnotificationtopickparcel(
                                                widget.driverid,
                                                widget.sendparcelid);

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
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color: Color(0xff020744),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                FlatButton(
                                  onPressed: () async {
                                    print("aaaaaaa");
                                    final Acceptrejectsendparcelmodel user =
                                        await acceptrejectSendparcel()
                                            .acceptrejectsendparcel(
                                                widget.notificationid,
                                                "",
                                                "Reject");

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
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color: Color(0xff020744),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ])
                    : Center(child: Text("Data Not Found"));
              },
            ),
          ),
        ),
      ),
    );
  }
}

Widget FlatButton(
{onPressed,color,child
}){
  return TextButton(onPressed: onPressed, child: child,style: ButtonStyle(backgroundColor: color),);
}