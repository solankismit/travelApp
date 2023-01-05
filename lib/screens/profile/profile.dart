import 'package:flutter/material.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/models/getProfile.dart';
import 'package:lechalo/screens/profile/account.dart';
import 'package:lechalo/screens/profile/details.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Profile extends StatefulWidget {


  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? regid;

  int totalPage = 2;
  final PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;
  List isSelected=[true,false];
  var selectedOption=0;
  List options =[Pdetails(),Paccount()];

  late Future<Getprofile> data;
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
    final Future<Getprofile> user = getProfile()
        .getprofile(regid) ;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xff060E57),
        leading: IconButton(padding: EdgeInsets.zero,onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),



        title: Text("Profile",style: TextStyle(
            fontFamily: "Franklin_Gothic"
        ),),
        centerTitle: true,
        elevation: 0,

      ),
      body:
      SingleChildScrollView(
        child: FutureBuilder<Getprofile?>(
            future: getProfile().getprofile(regid),
            builder: (context, snapshot) {

              return Container(

                height: 814.h,

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
          child: snapshot.hasData ?Container(

                height: 800.h,                                            // main
                margin: EdgeInsets.only(right: 7.w, left: 7.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40.r)
                ),
                child:  Column(

                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: 20.h),
                      child: Container(
                        height: 100.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                                image: NetworkImage(snapshot.data!.userImage!)
                            )
                        ),
                      ),
                    ),

                    SizedBox(
                        height: 20.h
                    ),
                    Text(snapshot.data!.detail!.name.toString(), style: TextStyle(
                        fontFamily: "Franklin_Gothic",
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500
                    ),),

                    // Container(
                    //   height: 10.h,
                    //     width: 10.w,
                    //     child: Text(snapshot.data!.detail!.gender.toString())
                    // ),

                    SizedBox(
                      height: 60.h,
                    ),

                    topnavigation(),

                    Container(
                      color: Colors.white,
                        height: 555.h,
                        width: 380.w,
                        child:
                        options[selectedOption]
                    ),

                  ],
                )
          ):Center(child: CircularProgressIndicator(color: Colors.white,)),

              );

            }
          ),
      ),
        );
  }


  topnavigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildOption("Details",0),
SizedBox(
  width: 25.w,
),
        buildOption("Account",1),

      ],
    );
  }


  buildOption(String title,int index) {
  return Column(
    children: [
      isSelected[index] ? InkWell(
        onTap: (){
          setState(() {

          });
        },
        child: Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.redAccent,
                      width: 2.w,)
                )
            ),
            child: Text("${title}",style: TextStyle(
                fontFamily: "Franklin_Gothic",
                fontSize: 18.sp
            ),)
        ),
      ):InkWell(
        onTap: (){
          setState(() {
            selectedOption=index;
            isOptionSelected(index);
            print(index);
          });
        },
        child: Container(
            child: Text("${title}",style: TextStyle(
                fontFamily: "Franklin_Gothic",
                fontSize: 18.sp
            ),)
        ),
      ),

    ],
  );
}

















void isOptionSelected(int index) {
  var previousIndex=isSelected.indexOf(true);
  isSelected[index]=true;
  isSelected[previousIndex]=false;
}
}