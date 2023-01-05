import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class NewPastTransaction extends StatefulWidget {

  @override
  _NewPastTransactionState createState() => _NewPastTransactionState();
}

class _NewPastTransactionState extends State<NewPastTransaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff060E57),
        leading: IconButton(padding: EdgeInsets.zero, onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),


        title: Text("New/Past Transactions", style: TextStyle(
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
        child: Container(
          height: 810.h,
          margin: EdgeInsets.only(right: 7.w, left: 7.w),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40.sp)
          ),
          child: Padding(
            padding:  EdgeInsets.only(top: 20.h),
            child: ListView(
                padding: EdgeInsets.only(right: 40.w, left: 40.w),
                children: [ Column(

                  children: [
                    Text("Here you can find a list of your transactions that are in progress or have been successfully completed.",style: TextStyle(
                        fontFamily: "Franklin_Gothic",
                      fontSize: 15.sp,
                      color: Colors.grey
                    ),),
                    Container(
                      height: 120.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/money.png")
                        )
                      ),
                    )



                  ],
                ),
                ]
            ),
          ),
        ),


      ),
    );
  }
}