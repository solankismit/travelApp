import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/checkotpmodel.dart';
import 'package:lechalo/models/checkotppassmodel.dart';
import 'package:lechalo/models/otpgenerationmodel.dart';
import 'package:lechalo/models/userregmodel.dart';
import 'package:lechalo/screens/loginScreen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Verification extends StatefulWidget {
  //String emailid,password,fullname,image,gender;
 // Verification(this.emailid,this.password,this.fullname,this.image,this.gender,{Key? key}):super(key: key);


  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController otpControler = TextEditingController();
  String? regid;
  String? regMobile;
  var enteredOtp;

  String? id;
  String? mobile;

  Future<String?> getNamePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("id");

    return id;

  }
  Future<String?> getOfferPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    mobile= prefs.getString("mobile");
    return mobile;

  }



  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero,() async {
      //your async 'await' codes goes here
      final Otpgenerationmodel user = await otpGeneration().otpgeneration(regMobile,regid);
    });
    Future.delayed(Duration.zero,() async{
      SharedPreferences prefs =
      await SharedPreferences.getInstance();

      getNamePreference().then((String? id) {
        setState(() {
          regid = id;
        });
      });
     // prefs.clear();

    });
    super.initState();
    getNamePreference().then((id) {
      setState(() {
        regid = id;
        print("bbb:$regid");

      });
    });
    getOfferPreference().then((mobile){
      setState(() {
        regMobile=mobile;

        print("aaa:$mobile");
      });

    });

    print("user");

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff060E57),
        leading: InkWell(
          onTap: (){
            Navigator.of(context).pop(context);
          },
          child: Icon(Icons.arrow_back_ios,color: Color(0xffffffff),size: 25,),
        ),
        title: Text("Verification",style: TextStyle(
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
          child: ListView(
              children: [Container(
                height: MediaQuery.of(context).size.height,
                margin: EdgeInsets.only(right: 7,left: 7),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Container(

                        height:150.h,
                        width:150.w,
                        decoration: BoxDecoration(

                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/verification.png",

                              ),
                            )
                        ),
                      ),
                      Form(
                        child: Padding(
                          padding:  EdgeInsets.only(right: 50.w,left: 50.w,top:60.h ),
                          child: Column(
                            children: [
                              Text("Sit back and relax ! While we verify your mobile number",style: TextStyle(
                                  color:Color(0xff060E57),
                                  fontFamily: "Franklin_Gothic",
                                  fontSize: 18,
                                  decoration: TextDecoration.underline

                              ),
                                textAlign: TextAlign.center,),
                              SizedBox(
                                height:30.h,
                              ),

                              Text("We have sent you a 6 - digit code via SMS for Mobile number verification",style: TextStyle(
                                  color:Color(0xff060E57),
                                  fontFamily: "Franklin_Gothic",
                                  fontSize: 15.sp
                              ),
                                textAlign: TextAlign.center,),
                              SizedBox(
                                height:40.h,
                              ),
                              Text("(Enter the OTP below in case if we fail to detect the SMS automatically)",style: TextStyle(
                                  color:Colors.grey,
                                  fontFamily: "Franklin_Gothic",
                                  fontSize: 12.sp
                              ),
                                textAlign: TextAlign.center,),
                              SizedBox(
                                height:40.h ,
                              ),
                              PinCodeTextField(
                                controller: otpControler,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'otp is Required';
                                  }
                                },
                                appContext: context, length: 6,
                                onChanged: (value){
                                  print(value);
                                  setState(() {
                                    enteredOtp=value;
                                  });

                                },
                                pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    borderRadius: BorderRadius.circular(5),
                                    fieldHeight:45.h,
                                    fieldWidth:45.w,
                                    inactiveColor: Color(0xff707070)
                                ),
                              ),
                              SizedBox(
                                height:20.h ,
                              ),



                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Resend OTP in :",style: TextStyle(
                                      color: Color(0xff020744),
                                      fontFamily: "Franklin_Gothic",
                                      fontSize: 15.sp

                                  ),),
                                  TweenAnimationBuilder(tween: IntTween(begin: 60,end: 0), duration:Duration(seconds: 60) , builder: (context,value,child)=>Text("   00:${value!}",style: TextStyle(color: Color(0xffFF0E0EB3)),),)
                                ],
                              ),
                              InkWell(

                                onTap: () async {


                                  print(otpControler.text);
                                  print(regMobile);


                                  final Checkotpmodel user = await checkOtp().checkotp(regMobile,otpControler.text,regid);

                                  print(user.status);

                                  if (user.status != "success") {
                                    savedNamePreference (user.status.toString())
                                        .then((bool committed) {
                                      setState(() {

                                        Fluttertoast.showToast(
                                          msg: user.msg,
                                          backgroundColor: Color(0xff060E57),
                                          textColor: Colors.white,
                                        );
                                      });
                                    });

                                  } else  {


                                    setState(() async{
                                      Fluttertoast.showToast(
                                        msg: user.msg,
                                        backgroundColor: Color(0xff060E57),
                                        textColor: Colors.white,
                                      );
                                      print(id);
                                      // final Userregmodel user2 = await creataccount().createaccount(
                                      //    widget.emailid,
                                      //    widget.fullname,
                                      //     "",
                                      //     widget.gender,
                                      //     widget.image,
                                      //     "User",
                                      //     widget.password,
                                      //     regMobile);
                                      // if(user2.status != "success" ){
                                      //   print("${user2.msg}");
                                      // }
                                      // else{
                                        Navigator.of(context).pushAndRemoveUntil(
                                            MaterialPageRoute(
                                                builder: (context) => LoginScreen()),
                                                (route) => false);


                                   //   }






                                    });






                                  }

                                  // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 50.h),
                                  alignment: Alignment.center,
                                  height:37.h,
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
                                    "Done",
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

                    ],
                  ),
                ),
              ),
              ]
          ),
        ),


      ),
    );
  }

  savedNamePreference(String string) {}
}