import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/sharestatusmodel.dart';
import 'package:lechalo/screens/paymentConfirmation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactsEntry extends StatefulWidget {
  String distance,seats,fare,userid,oferid;
  ContactsEntry (this.distance,this.seats,this.fare,this.userid,this.oferid,{Key? key}):super(key: key);



  @override
  _ContactsEntryState createState() => _ContactsEntryState();
}

class _ContactsEntryState extends State<ContactsEntry> {
  TextEditingController _number =TextEditingController();
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
          "Contacts",
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
        child: ListView(
            children:[ Container(
              height: 800.h,
              margin: EdgeInsets.only(right: 7.w, left: 7.w),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40.r)),
              child: Form(
                child: Padding(
                  padding:  EdgeInsets.only(right: 40.0.w,left:40.0.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100.h,
                      ),

                      TextFormField(
                        controller: _number,

                        decoration: InputDecoration(
                        //  icon: Icon(Icons.search),
                        //  icon: Icon(Icons.search),
                          prefixIcon:Icon(Icons.perm_identity_rounded,color: Colors.black,),
                          suffixIcon: Icon(CupertinoIcons.multiply_circle_fill,color: Colors.black,),


                          hintText: "Enter Number Here..",
counterText: ""
                        ),
                        keyboardType: TextInputType.number,
                        maxLength: 10,

                      ),
                      SizedBox(
                        height: 70.h,
                      ),
                      InkWell(
                        onTap: () async{
                          final Sharestatusmodel user = await shareStatus().sharestatus(regid,_number.text);
                          print(user.status);
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PaymentConfirmation(widget.distance,widget.seats,widget.fare,widget.userid,widget.oferid)));
                          },
                        child: Container(
                         // margin: EdgeInsets.only(top: 30),
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
                            "Share",
                            style: TextStyle(
                                fontFamily: "Franklin_Gothic",
                                color: Color(0xffFFFFFF),
                                fontSize: 20.sp),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ),
            ]
        ),
      ),
    );
  }
}






