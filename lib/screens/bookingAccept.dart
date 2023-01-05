import 'package:flutter/material.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/getbookingconfirmbyoffermodel.dart';
import 'package:lechalo/models/getbookingrequestbyoffer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingAccept extends StatefulWidget {


  @override
  _BookingAcceptState createState() => _BookingAcceptState();
}

class _BookingAcceptState extends State<BookingAccept> {

  String? regid;
  String? regbookibgofferid;


  String? id;
  String? bookibgofferid;
  Future<String?> getbookingofferPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bookibgofferid = prefs.getString("bookingofferid");
    return bookibgofferid;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getbookingofferPreference().then((bookingofferid) {
      setState(() {
        regbookibgofferid = bookingofferid;
        print("aaa");
        print(regbookibgofferid);
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
          "Booking Accepted",
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
            child:  FutureBuilder<Getbookingconfirmbyoffermodel>(future: getBookingconfirmbyoffer().getbookingconfirmbyoffer(regbookibgofferid),
    builder: (context,snapshot) {
      return (snapshot.hasData) ? ListView.builder(
          itemCount: snapshot.data!.detail.length,
          itemBuilder: (context, index) {
            var server = snapshot.data!.detail[index];
            return
              Padding(
                padding:  EdgeInsets.only(right: 15.w, left: 15.w),
                child:
                Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            right: 8.0.w, left: 8.0.w, top: 8.0.h),
                        height: 130.h,
                        width: 414.w,
                        decoration: (BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24.r),
                          border: Border.all(color: Colors.grey.shade400),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 3,
                                offset: Offset(0, 1))
                          ],
                        )),
                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(


                              children: [
                                Container(

                                  height:
                                  70.h,
                                  width: 70.w,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                          AssetImage("assets/profile.png"))),
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text(
                                      server.name,
                                      style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",
                                          fontSize: 17.sp),
                                    ),
                                    // SizedBox(
                                    //   height: MediaQuery.of(context).size.height*0.023,
                                    // ),
                                    Text(
                                      server.mobile,
                                      style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",
                                          fontSize: 17.sp),
                                    ),
                                  ],
                                ),


                              ],
                            ),


                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                    ]
                ),

              );
          }
      ):Center(child: Text("Data Not Found"),);
    }
      ),
    )
      )
    );
  }
}

