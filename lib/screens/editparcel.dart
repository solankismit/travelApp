import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lechalo/api/db.dart';
import 'package:lechalo/googleplace/placeModel.dart';
import 'package:lechalo/googleplace/place_search.dart';
import 'package:lechalo/googleplace/place_services.dart';
import 'package:lechalo/models/editparcelrmodel.dart';
import 'package:lechalo/models/sendparcelmodel.dart';
import 'package:lechalo/screens/allParcelRequestList.dart';
import 'package:lechalo/screens/myParcelRequest.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Editparcel extends StatefulWidget {
  String tFromLocation,
      tToLocation,
      vFromCity,
      vToCity,
      dFromLocationLat,
      dFromLocationLong,
      dToLocationLat,
      dToLocationLong,
      tItemName,
      dItemValue,
      dItemWeight,
      eItemSize,
      eWhoWillMeetDriverAtPickupLocation,
      vSenderName,
      vSenderMobile,
      eWhoWillMeetDriverAtDeliveryLocation,
      vReceiverName,
      vReceiverMobile,
      ePickupTime,
      ePickupDateTime,
      eRecieveTime,
      eReceiveDateTime,
      tItemDimention,
      dItemLength,
      dItemWidth,
      dItemHeight,
      tExtraDetails,
      iSenderID,
      iSendParcelID;
      Editparcel(this.dItemHeight,this.dItemWidth,this.dItemLength,this.dItemWeight,this.tExtraDetails,this.vReceiverMobile,this.vReceiverName,this.vSenderName,this.vToCity,this.vFromCity,this.eItemSize,this.tItemName,this.ePickupDateTime,this.ePickupTime,this.vSenderMobile,this.tToLocation,this.tFromLocation,this.dFromLocationLat,this.dFromLocationLong,this.dItemValue,this.dToLocationLat,this.dToLocationLong,this.eReceiveDateTime,this.eRecieveTime,this.eWhoWillMeetDriverAtDeliveryLocation,this.eWhoWillMeetDriverAtPickupLocation,this.iSenderID,this.iSendParcelID,this.tItemDimention,{Key? key}) : super(key: key);

  @override
  _EditparcelState createState() => _EditparcelState();
}

class _EditparcelState extends State<Editparcel> {
  String date="";
  String? location1;
  String? location2;
  late String llat;
  late String llng;
  late String dlat;
  late String dlmg;
  String tampLocation="";
  bool from = false;
  bool to = false;
  TextEditingController _from =TextEditingController();
  TextEditingController _to =TextEditingController();
  TextEditingController _parcelname =TextEditingController();
  TextEditingController _parcelvalue =TextEditingController();
  TextEditingController _rname =TextEditingController();
  TextEditingController _rmobilr =TextEditingController();
  TextEditingController _extra =TextEditingController();
  TextEditingController _sname =TextEditingController();
  TextEditingController _smobile =TextEditingController();
  TextEditingController _weight =TextEditingController();
  TextEditingController _length =TextEditingController();
  TextEditingController _width =TextEditingController();
  TextEditingController _height =TextEditingController();
  bool value = false;

  late String base64image;
  final picker = ImagePicker();
  File? image;
  String? regid;
  var uplodedimage;
  // Future<void> pickImage() async {
  //   final _image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //
  //   final imageTemporary = File(_image!.path);
  //   setState(() {
  //     this.image = imageTemporary;
  //     base64image = base64Encode(image!.readAsBytesSync());
  //     print(image!.path);
  //   });
  // }
  // Future<void> pickImage2() async {
  //   final _image = await ImagePicker().pickImage(source: ImageSource.camera);
  //
  //   final imageTemporary = File(_image!.path);
  //   setState(() {
  //     this.image = imageTemporary;
  //     base64image = base64Encode(image!.readAsBytesSync());
  //     print(image!.path);
  //   });
  // }
  _showDialog2(){
    showDialog(context: context, builder: (BuildContext context){
      return BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX: 40,
            sigmaY: 40
        ),
        child:Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),

            ),
            child:Container(

              height: MediaQuery.of(context).size.height*0.25,
              width: MediaQuery.of(context).size.width*0.7,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Text("Upload Profile Picture",style: TextStyle(fontFamily: "Franklin_Gothic",fontSize: 20),),

                      IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon: Icon(Icons.close,color: Colors.black,)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: (){
                         // pickImage();
                          Navigator.of(context).pop();

                        },
                        child: Column(
                          children: [
                            Container(
                              height:MediaQuery.of(context).size.height*0.15,
                              width:MediaQuery.of(context).size.width*0.25,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/gallery.png")
                                  )
                              ),

                            ),
                            Text("Gallery",style: TextStyle(fontFamily:"Franklin_Gothic" ,fontSize: 18),)
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: (){
                         // pickImage2();
                          Navigator.of(context).pop();
                        },
                        child: Column(
                          children: [
                            Container(
                              height:MediaQuery.of(context).size.height*0.15,
                              width:MediaQuery.of(context).size.width*0.25,
                              decoration: BoxDecoration(
                                  image: DecorationImage(

                                      image: AssetImage("assets/camera.png")
                                  )
                              ),

                            ),
                            Text("Camera",style: TextStyle(fontFamily:"Franklin_Gothic" ,fontSize: 18),)
                          ],
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
            )
        ),
      );
    });
  }
  String _Rvalue1="Me";
  String _Rvalue3="Me";
  int _Rvalue2=2;
  bool _showdata=false;
  String selected="S";
  _showDialog(){
    showDialog(context: context, builder: (BuildContext context){
      return BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX: 20,
            sigmaY: 20
        ),
        child:Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),

            ),
            child:Container(

              height: MediaQuery.of(context).size.height*0.9,
              width: MediaQuery.of(context).size.width*0.9,
              child: Padding(
                padding: const EdgeInsets.only(top:9),
                child:
                ListView(
                    children:[ Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            child: Row(

                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Parcel Details",style:  TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Franklin_Gothic"
                                )),
                                SizedBox(width: MediaQuery.of(context).size.width/5,),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black
                                  ),
                                  child: IconButton(padding: EdgeInsets.zero,onPressed: () {
                                    Navigator.pop(context);
                                  }, icon: Icon(Icons.close, color: Colors.white,)),
                                )

                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:40,right: 40),
                          child: Column(




                            children: [

                              Container(


                                height:MediaQuery.of(context).size.height*0.2,
                                width:MediaQuery.of(context).size.width*0.59,

                                decoration: BoxDecoration(
                                    image:DecorationImage(
                                      image: AssetImage("assets/uploadParcel.png"),



                                    ),
                                    border:Border.all(color: Colors.grey.shade400),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              ),
                              Row(
                                children: [
                                  Text("Laptop",style: TextStyle(
                                      color: Color(0xff020744),
                                      fontFamily: "Franklin_Gothic",

                                      fontSize: 16
                                  ),),
                                ],
                              ),
                              SizedBox(height: 13),



                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Parcel size ",style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 16
                                      ),),
                                      Text("M",style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 15
                                      ),),
                                      SizedBox(height: 13),
                                      Text("Pickup Address",style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 16
                                      ),),
                                      Text("Ahmedabad",style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 15
                                      ),),
                                      SizedBox(height: 13),
                                      Text("Delivery Address",style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 16
                                      ),),
                                      Text("Gandhinagar",style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 15
                                      )),SizedBox(height: 13),
                                      Text("Sender Details",style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 16
                                      ),),
                                      Text("Me",style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 15
                                      ),),SizedBox(height: 13),
                                      Text("Receiver Name ",style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 16
                                      ),),
                                      Text("Ashok",style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 15
                                      ),),SizedBox(height: 13),
                                      Text("Receiver No",style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 16
                                      ),),
                                      Text("989***9898",style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 15
                                      ),),SizedBox(height: 13),
                                      Text("Pickup Time ?",style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 16
                                      ),),
                                      Text("Within 1 week",style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 15
                                      ),),SizedBox(height: 13),
                                      Text("Extra Details",style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 16
                                      ),),
                                      Text("aksn***jhjh",style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 15
                                      ),),SizedBox(height: 13),
                                      Text("Gross Weight",style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 16
                                      ),),
                                      Text("10",style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 15
                                      ),),
                                      SizedBox(height: 13),
                                      Text("Dimension",style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 16
                                      ),),
                                      Text("10*15*21",style: TextStyle(
                                          color: Color(0xff020744),
                                          fontFamily: "Franklin_Gothic",

                                          fontSize: 15
                                      ),),

                                    ],
                                  ),

                                ],
                              ),








                            ],
                          ),
                        ),

                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();







                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 30,bottom: 10),
                            alignment: Alignment.center,
                            height:37,
                            width: 155,
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
                              "Create Request",
                              style: TextStyle(
                                  fontFamily: "Franklin_Gothic",
                                  color: Color(0xffFFFFFF),
                                  fontSize: 20),
                            ),
                          ),
                        ),

                      ],
                    ),
                    ]
                ),
              ),

            )
        ),
      );
    });
  }
  String? id;
  double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 +
        c(lat1 * p) * c(lat2 * p) *
            (1 - c((lon2 - lon1) * p))/2;
    print("aa");
    print(12742*asin(sqrt(a)));
    return 12742 * asin(sqrt(a));
  }
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
    _from.text=widget.tFromLocation;
    _to.text=widget.tToLocation;
    llat=widget.dFromLocationLat;
     llng=widget.dFromLocationLong;
     dlat=widget.dToLocationLat;
     dlmg=widget.dToLocationLong;
     _parcelname.text=widget.tItemName;
     _parcelvalue.text=widget.dItemValue;
    selected=widget.eItemSize;
    _sname.text=widget.vSenderName;
    _smobile.text=widget.vSenderMobile;
    _rname.text=widget.vReceiverName;
    _rmobilr.text=widget.vReceiverMobile;
    _Rvalue2=int.parse(widget.ePickupTime);
    date=widget.ePickupDateTime;
    _extra.text=widget.tExtraDetails;
     location1=widget.tFromLocation;
     location2=widget.tToLocation;
     image=File("sasa");

  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(


      appBar: AppBar(
        backgroundColor: Color(0xff060E57),
        leading: IconButton(padding: EdgeInsets.zero,onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),


        title: Text("Send Parcel",style: TextStyle(
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
          height: 814.h,
          width: 414.w,
          margin: EdgeInsets.only(right: 7.w,left: 7.w),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40.r)
          ),
          child: ListView(
              padding: EdgeInsets.only(right: 40.w,left: 40.w),
              children:[ Form(
                child: Padding(
                  padding:  EdgeInsets.only(top: 12.0.h),
                  child: Column(
                    children: [
                      TextFormField(
                          controller: _from,
                          decoration: InputDecoration(
                              hintText: "From",
                              hintStyle: TextStyle(
                                  color: Colors.blueGrey,
                                  fontFamily: "Franklin_Gothic"
                              ),
                              suffixIcon: Icon(Icons.location_pin,color: Colors.black,)
                          ),
                          onFieldSubmitted: (value){
                            from=false;
                          },
                          onTap: (){
                            from=true;
                            to=false;
                          },

                          onChanged: (value){
                            setState(() {
                              location1=value;
                            });






                            //   PlacesService().getAutoComplate(value);
                            // print(PlacesService().getAutoComplate(value).toString().length);
                          }

                      ),
                      (_from.text.length>0 && from==true)? Container(
                        decoration: BoxDecoration(
                            color: Colors.white
                        ),
                        height: 300.h,
                        width:MediaQuery.of(context).size.width,

                        child:
                        FutureBuilder<List<PlaceSearch>>(future: PlacesService().getAutoComplate(location1!),
                            builder: (context,snapshots) {


                              return (snapshots.hasData)?ListView.builder(
                                  itemCount: snapshots.data!.length,
                                  itemBuilder: (context, index) {
                                    var server = snapshots.data![index];


                                    return (snapshots.hasData) ? ListTile(
                                      onTap: () async{
                                        final Place user2= await PlacesService().getlatlong(server.placeId);
                                        this.llat=user2.geometry.location.lat.toString();
                                        this.llng=user2.geometry.location.lng.toString();

                                        setState(() {
                                          List<String> result=server.description.split(',');
                                          _from.text = result[0];
                                          print(server.description);
                                        });
                                        from=false;

                                      },
                                      title: Text(
                                          server.description
                                      ),
                                    ) : CircularProgressIndicator();}
                              ):Center(child: CircularProgressIndicator());

                            }
                        ),
                      ):Container(),


                      TextFormField(
                          controller: _to,
                          decoration: InputDecoration(
                              hintText: "To",
                              hintStyle: TextStyle(
                                  color: Colors.blueGrey,

                                  fontFamily: "Franklin_Gothic"
                              ),
                              suffixIcon: Icon(Icons.location_pin,color: Colors.black,)
                          ),
                          onFieldSubmitted: (value){
                            to=false;
                          },
                          onTap: (){
                            to=true;
                            from=false;
                          },
                          onChanged: (value){
                            setState(() {
                              location2=value;
                            });


                            //   PlacesService().getAutoComplate(value);
                            // print(PlacesService().getAutoComplate(value).toString().length);
                          }
                      ),
                      (_to.text.length>0 && to==true)?Container(
                        decoration: BoxDecoration(
                            color: Colors.white
                        ),
                        height: 300.h,
                        width:MediaQuery.of(context).size.width,

                        child:
                        FutureBuilder<List<PlaceSearch>>(future: PlacesService().getAutoComplate(location2!),
                            builder: (context,snapshots) {


                              return (snapshots.hasData)?ListView.builder(
                                  itemCount: snapshots.data!.length,
                                  itemBuilder: (context, index) {
                                    var server = snapshots.data![index];


                                    return (snapshots.hasData) ? ListTile(
                                      onTap: () async{
                                        print(server.placeId);

                                        final Place user1= await PlacesService().getlatlong(server.placeId);
                                        this.dlat=user1.geometry.location.lat.toString();
                                        this.dlmg=user1.geometry.location.lng.toString();
                                        setState(() {
                                          List<String> res=server.description.split(',');
                                          _to.text = res[0];
                                        });
                                        to=false;

                                      },
                                      title: Text(
                                          server.description
                                      ),
                                    ) : CircularProgressIndicator();}
                              ):Center(child: CircularProgressIndicator());

                            }
                        ),
                      ):Container(),
                      SizedBox(height: 50.h,),
                      Row(
                        children: [
                          Text("Enter parcel name",style:  TextStyle(
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                            fontFamily: "Franklin_Gothic",
                            fontSize: 16.sp,
                          )),
                        ],
                      ),
                      SizedBox(height: 10.h,),

                      TextFormField(
                        controller: _parcelname,
                        decoration: InputDecoration(
                          hintText: "Parcel name",
                          hintStyle: TextStyle(

                            // fontWeight: FontWeight.bold,
                              fontFamily: "Franklin_Gothic"
                          ),

                        ),
                        onChanged: (data){

                        },
                      ),
                      SizedBox(height: 50.h,),
                      Row(
                        children: [
                          Text("Enter parcel value",style:  TextStyle(
                            color: Colors.black,
                            //fontWeight: FontWeight.bold,
                            fontFamily: "Franklin_Gothic",
                            fontSize: 16,
                          )),
                          SizedBox(width: 10.w,),
                          Container(
                              height:17.h,
                              width: 17.w,
                              child: Image.asset("assets/money.png")),
                        ],
                      ),
                      SizedBox(height: 10.h,),

                      TextFormField(
                        controller: _parcelvalue,
                        decoration: InputDecoration(
                          hintText: "Parcel value",
                          hintStyle: TextStyle(

                            // fontWeight: FontWeight.bold,
                              fontFamily: "Franklin_Gothic"
                          ),

                        ),
                        onChanged: (data){

                        },
                        keyboardType: TextInputType.number,
                      ),

                      SizedBox(height: 30.h,),
                      Row(
                        children: [
                          Text("Define size",style:  TextStyle(
                            color: Colors.black,
                            //fontWeight: FontWeight.bold,
                            fontFamily: "Franklin_Gothic",
                            fontSize: 16.sp,
                          )),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildOption("assets/layer.jpeg", "S"),
                          buildOption("assets/autoRickshaw.png","M"),
                          buildOption("assets/cab2.png", "L"),
                          buildOption("assets/deliveryTruck.png", "XL"),
                          buildOption("assets/moverTruck.png", "XXL"),
                          buildOption("assets/logisticsTruck.png","XXXL"),


                        ],
                      ),

                      SizedBox(height: 30.h,),
                      Row(
                        children: [
                          Text("Upload picture of your parcel",style:  TextStyle(
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                            fontFamily: "Franklin_Gothic",
                            fontSize: 16.sp,
                          )),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          _showDialog2();
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FRRouteDetails()));
                        },
                        child: Container(

                          alignment: Alignment.center,
                          height: 120.h,
                          width: 120.w,

                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/uploadParcel.png")
                              )
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text("Sender Details",style:  TextStyle(
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                            fontFamily: "Franklin_Gothic",
                            fontSize: 16.sp,
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor: Color(0xff292DA1),

                            value: "Me",
                            groupValue: _Rvalue1,
                            onChanged: (value){
                              setState(() {
                                _Rvalue1=value.toString();
                              });
                            },
                          ),
                          Text("My self",style: TextStyle(
                              color: Color(0xff020744),
                              fontFamily: "Franklin_Gothic",
                              // fontWeight: FontWeight.bold,
                              fontSize: 16.sp
                          ),),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor: Color(0xff292DA1),



                            value: "Other",
                            groupValue: _Rvalue1,
                            onChanged: (value){
                              setState(() {
                                _Rvalue1=value.toString();
                              });
                            },
                          ),
                          Text("Someone else on behalf of me",style: TextStyle(
                              color: Color(0xff020744),
                              fontFamily: "Franklin_Gothic",
                              // fontWeight: FontWeight.bold,
                              fontSize: 16.sp
                          ),),
                        ],
                      ),
                      TextFormField(
                        controller: _sname,
                        decoration: InputDecoration(
                          hintText: "Receiver name",
                          hintStyle: TextStyle(

                            //fontWeight: FontWeight.bold,
                              fontFamily: "Franklin_Gothic"
                          ),

                        ),
                        onChanged: (data){

                        },
                      ),
                      TextFormField(
                        controller: _smobile,
                        decoration: InputDecoration(
                          hintText: "Receiver mobile number",
                          hintStyle: TextStyle(

                            // fontWeight: FontWeight.bold,
                              fontFamily: "Franklin_Gothic"
                          ),

                        ),
                        onChanged: (data){

                        },
                      ),
                      SizedBox(height: 30.h,),
                      Row(
                        children: [
                          Text("Receiver Details",style:  TextStyle(
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                            fontFamily: "Franklin_Gothic",
                            fontSize: 16.sp,
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor: Color(0xff292DA1),

                            value: "Me",
                            groupValue: _Rvalue3,
                            onChanged: (value){
                              setState(() {
                                _Rvalue3=value.toString();
                              });
                            },
                          ),
                          Text("My self",style: TextStyle(
                              color: Color(0xff020744),
                              fontFamily: "Franklin_Gothic",
                              // fontWeight: FontWeight.bold,
                              fontSize: 16.sp
                          ),),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor: Color(0xff292DA1),
                            value: "Other",
                            groupValue: _Rvalue3,
                            onChanged: (value){
                              setState(() {
                                _Rvalue3=value.toString();
                              });
                            },
                          ),
                          Text("Someone else on behalf of me",style: TextStyle(
                              color: Color(0xff020744),
                              fontFamily: "Franklin_Gothic",
                              // fontWeight: FontWeight.bold,
                              fontSize: 16.sp
                          ),),
                        ],
                      ),
                      TextFormField(
                        controller: _rname,
                        decoration: InputDecoration(
                          hintText: "Receiver name",
                          hintStyle: TextStyle(

                            //fontWeight: FontWeight.bold,
                              fontFamily: "Franklin_Gothic"
                          ),

                        ),
                        onChanged: (data){

                        },
                      ),
                      TextFormField(
                        controller: _rmobilr,
                        decoration: InputDecoration(
                          hintText: "Receiver mobile number",
                          hintStyle: TextStyle(

                            // fontWeight: FontWeight.bold,
                              fontFamily: "Franklin_Gothic"
                          ),

                        ),
                        onChanged: (data){

                        },
                      ),
                      SizedBox(height: 30.h,),
                      Row(
                        children: [
                          Text("Pickup time ?",style:  TextStyle(
                            color: Colors.black,
                            //fontWeight: FontWeight.bold,
                            fontFamily: "Franklin_Gothic",
                            fontSize: 16.sp,
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor: Color(0xff292DA1),

                            value: 1,
                            groupValue: _Rvalue2,
                            onChanged: (value){
                              setState(() {
                                _Rvalue2=value as int;
                              });
                            },
                          ),
                          Text("Immediate (within 45 minutes)",style: TextStyle(
                              color: Color(0xff020744),
                              fontFamily: "Franklin_Gothic",
                              //fontWeight: FontWeight.bold,
                              fontSize: 16.sp
                          ),),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor:Color(0xff292DA1),
                            value: 2,
                            groupValue: _Rvalue2,
                            onChanged: (value){
                              setState(() {
                                _Rvalue2=value as int;
                              });
                            },
                          ),
                          Text("Within 1 Day",style: TextStyle(
                              color: Color(0xff020744),
                              fontFamily: "Franklin_Gothic",
                              // fontWeight: FontWeight.bold,
                              fontSize: 16.sp
                          ),),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor: Color(0xff292DA1),

                            value: 3,
                            groupValue: _Rvalue2,
                            onChanged: (value){
                              setState(() {
                                _Rvalue2=value as int;
                              });
                            },
                          ),
                          Text("Within 1 Week",style: TextStyle(
                              color: Color(0xff020744),
                              fontFamily: "Franklin_Gothic",
                              //fontWeight: FontWeight.bold,
                              fontSize: 16.sp
                          ),),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor: Color(0xff292DA1),



                            value: 4,
                            groupValue: _Rvalue2,
                            onChanged: (value){
                              setState(() {
                                _Rvalue2=value as int;
                              });
                              showCupertinoModalPopup(context: context, builder: (context)=>

                                  Container(

                                    margin: EdgeInsets.only(right: 7.w, left: 7.w),
                                    height:300.h,
                                    width:414.w,
                                    child: CupertinoDatePicker(
                                      backgroundColor: Colors.white,
                                      initialDateTime:DateTime.now(), onDateTimeChanged: (dateTime) {
                                      setState(() {
                                        dateTime;
                                        date=dateTime.toString();
                                        print(dateTime);
                                      });
                                    } ,
                                      mode: CupertinoDatePickerMode.date,
                                    ),
                                  )



                              );
                            },

                          ),
                          Text("Select Date and Time",style: TextStyle(
                              color: Color(0xff020744),
                              fontFamily: "Franklin_Gothic",
                              // fontWeight: FontWeight.bold,
                              fontSize: 16.sp
                          ),),
                        ],
                      ),
                      SizedBox(height: 30.h,),
                      Row(
                        children: [
                          Text("Extra Details",style:  TextStyle(
                              color: Colors.black,
                              // fontWeight: FontWeight.bold,
                              fontFamily: "Franklin_Gothic",
                              fontSize: 16.sp
                          )),
                        ],
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Flammable or handle with care etc",
                          hintStyle: TextStyle(

                            //  fontWeight: FontWeight.bold,
                              fontFamily: "Franklin_Gothic"
                          ),

                        ),
                        onChanged: (data){

                        },
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _showdata=!_showdata;
                          });




                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 30.h),
                          alignment: Alignment.center,
                          height: 40.h,
                          width: 250.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Colors.white,
                              border: Border.all(color: Color(0xffBF0000))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(_showdata?
                              "Hide Details (Optional)":"Add more Details (Optional)  ",
                                style: TextStyle(
                                    fontFamily: "Franklin_Gothic",

                                    fontSize: 16.sp),
                              ),
                              Icon(_showdata?Icons.arrow_drop_down:Icons.arrow_drop_up,color: Color(0xff020744),)
                            ],
                          ),
                        ),
                      ),
                      _showdata? Container(
                        child: Column(
                          children: [
                            SizedBox(height: 40.h,),
                            Row(
                              children: [
                                Text("Gross weight",style:  TextStyle(
                                    color: Colors.black,
                                    //fontWeight: FontWeight.bold,
                                    fontFamily: "Franklin_Gothic",
                                    fontSize: 16.sp
                                )),
                              ],
                            ),

                            TextFormField(
                              controller: _weight,
                              decoration: InputDecoration(
                                hintText: "Total weight (Kg)",
                                hintStyle: TextStyle(

                                  // fontWeight: FontWeight.bold,
                                  fontFamily: "Franklin_Gothic",

                                ),

                              ),
                              onChanged: (data){

                              },
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(height: 40.h,),
                            Row(
                              children: [
                                Text("Dimension (Inch)",style:  TextStyle(
                                    color: Colors.black,
                                    //fontWeight: FontWeight.bold,
                                    fontFamily: "Franklin_Gothic",
                                    fontSize: 16.sp
                                )),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 60.w,
                                  child: TextFormField(
                                    controller: _length,
                                    decoration: InputDecoration(
                                      hintText: "Length",
                                      hintStyle: TextStyle(

                                        // fontWeight: FontWeight.bold,
                                          fontFamily: "Franklin_Gothic"
                                      ),

                                    ),
                                    onChanged: (data){

                                    },
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                SizedBox(width: 20.w,),
                                Container(
                                  width: 60.w,
                                  child: TextFormField(
                                    controller: _width,
                                    decoration: InputDecoration(
                                      hintText: "Width",
                                      hintStyle: TextStyle(

                                        // fontWeight: FontWeight.bold,
                                          fontFamily: "Franklin_Gothic"
                                      ),

                                    ),
                                    onChanged: (data){

                                    },
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                SizedBox(width: 20.w,),
                                Container(
                                  width: 60.w,
                                  child: TextFormField(
                                    controller: _height,
                                    decoration: InputDecoration(
                                      hintText: "Height",
                                      hintStyle: TextStyle(

                                        //fontWeight: FontWeight.bold,
                                          fontFamily: "Franklin_Gothic"
                                      ),

                                    ),
                                    onChanged: (data){

                                    },
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ):Container(
                        height: 0.h,
                        width: 0.w,

                      ),
                      // Container(
                      //
                      // )





                      InkWell(
                        onTap: () async{
                          print(regid);
                         // calculateDistance(llat, llng, dlat, dlmg);
                          //_showDialog();
                          final Editparcelrmodel user = await Updatesendparceldetails().updatesendparceldetails(_from.text, _to.text, _from.text, _to.text, llat, llng, dlat,dlmg,_parcelname.text,_parcelvalue.text, "0", selected, _Rvalue1,_sname.text, _smobile.text, _Rvalue3, _rname.text, _rmobilr.text, _Rvalue2.toString(), date, "0", date, _weight.text, _length.text,_width.text,_height.text, _extra.text, image.toString(),regid,widget.iSendParcelID);
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
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();

                              });
                            }
                          });

                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 50.h,bottom: 10.h),
                          alignment: Alignment.center,
                          height:35.h,
                          width: 170.w,
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
                            "Edit",
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
              ]
          ),
        ),


      ),
    );
  }
  buildOption(String image,String index) {
    return InkWell(
      onTap: (){
        setState(() {
          selected=index;
          print(selected);

        });
      },
      child: Container(
        height:MediaQuery.of(context).size.height*0.05,
        width:MediaQuery.of(context).size.width*0.1,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("${image}")
            ),
            border: Border(
                bottom: BorderSide(color:(selected==index)? Colors.red:Colors.transparent,
                  width: 2,)
            )
        ),

      ),
    );


  }
}
