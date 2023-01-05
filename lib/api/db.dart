// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/services.dart';
// import 'package:lechalo/models/acceptorrejectbookingrequestmodel.dart';
// import 'package:lechalo/models/acceptorrejecthirevehiclerequest.dart';
// import 'package:lechalo/models/acceptrejectsendparcelmodel.dart';
// import 'package:lechalo/models/addaccountmodel.dart';
// import 'package:lechalo/models/addtruckvehiclemodel.dart';
// import 'package:lechalo/models/addvehicledocmodel.dart';
// import 'package:lechalo/models/addvehiclemodel.dart';
// import 'package:lechalo/models/allhirevehicles.dart';
// import 'package:lechalo/models/allrequestedride.dart';
// import 'package:lechalo/models/allride.dart';
// import 'package:lechalo/models/allsendparcelmodel.dart';
// import 'package:lechalo/models/bookinglist.dart';
// import 'package:lechalo/models/bookingmodel.dart';
// import 'package:lechalo/models/cancelbookingmodel.dart';
// import 'package:lechalo/models/canceloffermodel.dart';
// import 'package:lechalo/models/cancelreasonlistmodel.dart';
// import 'package:lechalo/models/cartypemodel.dart';
// import 'package:lechalo/models/checkotpmodel.dart';
// import 'package:lechalo/models/checkotppassmodel.dart';
// import 'package:lechalo/models/currentallsendparcelmodel.dart';
// import 'package:lechalo/models/driverhirevehiclebookingbiddinglistmodel.dart';
// import 'package:lechalo/models/editparcelrmodel.dart';
// import 'package:lechalo/models/errormodel.dart';
// import 'package:lechalo/models/findrequestofferbyusermodel.dart';
// import 'package:lechalo/models/findridemodel.dart';
// import 'package:lechalo/models/forfotpasswordModel.dart';
// import 'package:lechalo/models/getProfile.dart';
// import 'package:lechalo/models/getaccountmodel.dart';
// import 'package:lechalo/models/getaddressmodel.dart';
// import 'package:lechalo/models/getbookingconfirmbyoffermodel.dart';
// import 'package:lechalo/models/getbookingrequestbyoffer.dart';
// import 'package:lechalo/models/getdocmodel.dart';
// import 'package:lechalo/models/getnotification1.dart';
// import 'package:lechalo/models/getpickparceldetailmodel.dart';
// import 'package:lechalo/models/getpreferencemodel.dart';
// import 'package:lechalo/models/getvehicleoffermodel.dart';
// import 'package:lechalo/models/getvehicles.dart';
// import 'package:lechalo/models/getwalletmodel.dart';
// import 'package:lechalo/models/givedriverratemodel.dart';
// import 'package:lechalo/models/hirevehicleaddbidrateModel.dart';
// import 'package:lechalo/models/hirevehiclecreaterequestmodel.dart';
// import 'package:lechalo/models/hirevehiclesearchridemodel.dart';
// import 'package:lechalo/models/myoffer.dart';
// import 'package:lechalo/models/myschedule.dart';
// import 'package:lechalo/models/newoffermodel.dart';
// import 'package:lechalo/models/otpgenerationmodel.dart';
// import 'package:lechalo/models/otpgenerationpassmodel.dart';
// import 'package:lechalo/models/passengerconfirmhirevehiclerequestModel.dart';
// import 'package:lechalo/models/pickparceldetailsmodel.dart';
// import 'package:lechalo/models/preferencemodel.dart';
// import 'package:lechalo/models/publicprofilemodel.dart';
// import 'package:lechalo/models/removeschedulemodel.dart';
// import 'package:lechalo/models/removeuservehiclemodel.dart';
// import 'package:lechalo/models/requestoffermodel.dart';
// import 'package:lechalo/models/sendnotificationtopickparcelmodel.dart';
// import 'package:lechalo/models/sendparcelmodel.dart';
// import 'package:lechalo/models/setaddressmodel.dart';
// import 'package:lechalo/models/sharestatusmodel.dart';
// import 'package:lechalo/models/singleoffer1model.dart';
// import 'package:lechalo/models/updatepasswordmodel.dart';
// import 'package:lechalo/models/updateprofilemodel.dart';
// import 'package:lechalo/models/updatevehiclemodel.dart';
// import 'package:lechalo/models/walletreqModel.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:lechalo/constant.dart';
// import 'package:lechalo/models/loginmodel.dart';
// import 'package:http/http.dart' as http;
// import 'package:lechalo/models/userregmodel.dart';
//
// import '../models/android_vertion_model.dart';
// import '../models/parcelscheduleride_model.dart';
//
// //import '../models/incorrectpassword.dart';
//
// class Login {
//   Future<LoginModel> login(mobilenumber, password, type) async {
//     var url = apiUrl + "/login";
//     var response = await http.post(Uri.parse(url), body: {
//       "mobile": mobilenumber,
//       "password": password,
//       "type": type,
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return LoginModel.fromJson(data);
//   }
// }
//
// class creataccount {
//   creataccount();
//   Future<Userregmodel> createaccount(
//     email,
//     Fullname,
//     birthyear,
//     gender,
//     userimage,
//     type,
//     password,
//     mobile,
//       imagepath
//   ) async {
//     var url = apiUrl + "/userreg";
//     var request = http.MultipartRequest("POST",Uri.parse(url));
//     request.fields['email'] = email;
//     request.fields['name'] = Fullname;
//     request.fields['birthyear'] = birthyear;
//     request.fields['gender'] = gender;
//     request.fields['type'] = type;
//     request.fields['password'] = password;
//     request.fields['mobile'] = mobile;
//
//     http.MultipartFile picture = await http.MultipartFile.fromPath('userimage',imagepath,
//         filename: imagepath);
//     request.files.add(picture);
//     var response = await request.send();
//     var responseData = await response.stream.toBytes();
//     var result = String.fromCharCodes(responseData);
//     print(result);
//     // var response = await http.post(Uri.parse(url), body: {
//     //   "email": email,
//     //   "name": Fullname,
//     //   "birthyear": birthyear,
//     //   "gender": gender,
//     //   "userimage": userimage,
//     //   "type": type,
//     //   "password": password,
//     //   "mobile": mobile,
//     // });
//
//     var data = jsonDecode(result);
//    // print("Response: " + response.body);
//     return Userregmodel.fromJson(data);
//   }
// }
//
// class otpgenerationPass {
//   Future<Otpgenerationpassmodel> otpgenerationpass(mobilenumber, type) async {
//     var url = apiUrl + "/otpgenerationpass";
//     var response = await http.post(Uri.parse(url), body: {
//       "type": type,
//       "mobile": mobilenumber,
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Otpgenerationpassmodel.fromJson(data);
//   }
// }
//
// // class incorrectPassword {
// //   Future<incorredctpasswordmodel> incorrectpassword(status , msg) async{
// //     var url = apiUrl + "/login";
// //     var response = await http.post(Uri.parse(url), body: {
// //       "status": status,
// //       "msg": msg,
// //     });
// //
// //     var data = jsonDecode(response.body);
// //     print("Response: " + response.body);
// //     return incorredctpasswordmodel.fromJson(data);
// //   }
// // }
//
//
// class otpGeneration {
//   Future<Otpgenerationmodel> otpgeneration(mobilenumber, id) async {
//     var url = apiUrl + "/otpgeneration";
//     var response = await http.post(Uri.parse(url), body: {
//       "id": id,
//       "mobile": mobilenumber,
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Otpgenerationmodel.fromJson(data);
//   }
// }
//
// class checkotpPass {
//   Future<Checkotppassmodel> checkotppass(mobilenumber, otp, type) async {
//     var url = apiUrl + "/checkotppass";
//     var response = await http.post(Uri.parse(url), body: {
//       "otp": otp,
//       "mobile": mobilenumber,
//       "type": type,
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Checkotppassmodel.fromJson(data);
//   }
// }
//
// class resetPassword {
//   Future<Forfotpassword> resetpassword(mobile, type, password) async {
//     var url = apiUrl + "/resetpassword";
//     var response = await http.post(Uri.parse(url), body: {
//       "mobile": mobile,
//       "type": type,
//       "password": password,
//     });
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Forfotpassword.fromJson(data);
//   }
// }
//
// class updatePassword {
//   Future<Updatepasswordmodel> updatepassword(
//       userid, oldpassword, password) async {
//     var url = apiUrl + "/updatepassword";
//     var response = await http.post(Uri.parse(url), body: {
//       "userid": userid,
//       "oldpassword": oldpassword,
//       "password": password,
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Updatepasswordmodel.fromJson(data);
//   }
// }
//
// class getWallet {
//   Future<Getwalletmodel> getwallet(userId) async {
//     var url = apiUrl + "/getwallet";
//     http.Response response = await http.post(Uri.parse(url), body: {
//       "userid": userId,
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Getwalletmodel.fromJson(data!);
//   }
// }
//
// class addAccount {
//   Future<Addaccountmodel> addaccount(
//     userid,
//     country,
//     account,
//     bankname,
//     ifsc,
//   ) async {
//     var url = apiUrl + "/addaccount";
//     var response = await http.post(Uri.parse(url), body: {
//       "userid": userid,
//       "country": country,
//       "account": account,
//       "bankname": bankname,
//       "ifsc": ifsc,
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Addaccountmodel.fromJson(data);
//   }
// }
//
// class getAccount {
//   Future<Getaccountmodel> getaccount(userid) async {
//     var url = apiUrl + "/getaccount";
//     var response = await http.post(Uri.parse(url), body: {
//       "userid": userid,
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Getaccountmodel.fromJson(data);
//   }
// }
// // class creataccount {
// //   Future<Userreg> createaccount(
// //     email,
// //      Fullname,
// //      birthyear,
// //      gender,
// //      userimage,
// //      type,
// //      password,
// //      mobile,
// //   ) async {
// //     final response = await http.post(
// //       Uri.parse(apiUrl + "/userreg"),
// //       body: {
// //         "email": email,
// //         "name": Fullname,
// //         "birthyear": birthyear,
// //         "gender": gender,
// //         "userimage": userimage,
// //         "type": type,
// //         "password": password,
// //         "mobile": mobile,
// //       },
// //     );
// //     var data = jsonDecode(response.body);
// //     print("Response: " + response.body);
// //     return Userreg.fromJson(data);
// //
// //
// //       // var data=jsonDecode(response.body);
// //       // print("data:$data");
// //       // return data;
// //
// //
// //   }
// // }
//
// class getProfile {
//   getProfile();
//   Future<Getprofile> getprofile(userid) async {
//     print("deep${userid.toString()}");
//     var url = apiUrl + "/getprofile";
//     //id,name,email,password,rememberMe,createdAt,updatedAt,statuschangeat,type,mobile,status,birthyear,age,gender,userimage,request,otp,roleid,bio,chat,smoke,pet,aC,wallet,redeemReq,devicetype,devicetoken,deviceid,ratestatus,driverrate,offeridrate,fname,lname
//     http.Response response = await http.post(Uri.parse(url),
//         body: {
//       "userid": userid,
//       //     "id":id,
//       //     "name":name,
//       //     "email":email,
//       //     "password":password,
//       //     "rememberMe":rememberMe,
//       //     "createdAt":createdAt,
//       //     "updatedAt":updatedAt,
//       //     "statuschangeat":statuschangeat,
//       //     "type":type,
//       //     "mobile":mobile,
//       //     "status":status,
//       //     "birthyear":birthyear,
//       //     "age":age,
//       //     "gender":gender,
//       //     "userimage":userimage,
//       //     "request":request,
//       //     "otp":otp,
//       //     "roleid":roleid,
//       //     "bio":bio,
//       //     "chat":chat,
//       //     "smoke":smoke,
//       //     "music":smoke,
//       //     "pet":pet,
//       //     "aC":aC,
//       //     "wallet":wallet,
//       //     "address":wallet,
//       //     "redeemReq":redeemReq,
//       //     "devicetype":devicetype,
//       //     "devicetoken":devicetoken,
//       //     "deviceid":deviceid,
//       //     "ratestatus":ratestatus,
//       //     "driverrate":driverrate,
//       //     "offeridrate":offeridrate,
//       //     "fname":fname,
//       //     "lname":lname,
//
//
//
//     });
//     var data = jsonDecode(response.body);
//     print("getProfile: " + response.body);
//     print("ankit>>>>>>>>>>>>>>>>>>>>" + userid);
//     return Getprofile.fromJson(data);
//   }
// }
//
// class getVehicles {
//   Future<Getvehicles> getvehicles(userId) async {
//     var url = apiUrl + "/getvehicles";
//     http.Response response = await http.post(Uri.parse(url), body: {
//       "id": userId,
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Getvehicles.fromJson(data!);
//   }
//
//   Future<Getvehicles> deletevehicles() async {
//     var url = apiUrl + "/getvehicles";
//     http.Response response = await http.delete(
//       Uri.parse(url),
//     );
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Getvehicles.fromJson(data!);
//   }
// }
//
// class getNotification1 {
//   Future<Getnotification1> getnotification1(user_Id) async {
//     var url = apiUrl + "/getnotification1";
//     http.Response response = await http.post(Uri.parse(url), body: {
//       "userid": user_Id,
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Getnotification1.fromJson(data!);
//   }
// }
//
// class acceptorrejectBookingrequest {
//   Future<Acceptorrejectbookingrequestmodel> acceptorrejectbookingrequest(
//       bookingrequestid, cancelreason, type) async {
//     var url = apiUrl + "/acceptorrejectbookingrequest";
//     http.Response response = await http.post(Uri.parse(url), body: {
//       "bookingrequestid": bookingrequestid,
//       "cancelreason": cancelreason,
//       "type": type
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Acceptorrejectbookingrequestmodel.fromJson(data!);
//   }
// }
//
// class allRequestedride {
//   Future<Allrequestedride> allrequestedride(user_Id) async {
//     var url = apiUrl + "/allrequestedride";
//     http.Response response = await http.post(Uri.parse(url), body: {
//       "userid": user_Id,
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Allrequestedride.fromJson(data!);
//   }
// }
//
// class allRide {
//   Future<Allride> allride(user_Id,vehicle_type) async {
//     var url = apiUrl + "/allride";
//     http.Response response = await http.post(Uri.parse(url), body: {
//       "userid": user_Id,
//       "vehicle_type":vehicle_type
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Allride.fromJson(data!);
//   }
// }
//
// class allHirevehicles {
//   Future<Allhirevehicles> allhirevehicles(user_Id) async {
//     var url = apiUrl +"/allhirevehicles";
//     http.Response response = await http.post(Uri.parse(url), body: {
//       "userid": user_Id,
//     });
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Allhirevehicles.fromJson(data!);
//   }
// }
//
// class myOffer {
//   Future<Myoffer> myoffer(user_Id) async {
//     var url = apiUrl + "/myoffer";
//     http.Response response = await http.post(Uri.parse(url), body: {
//       "userid": user_Id,
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Myoffer.fromJson(data!);
//   }
// }
//
// class getBookingrequestbyoffer {
//   Future<Getbookingrequestbyoffer> getbookingrequestbyoffer(offer_Id) async {
//     var url = apiUrl + "/getbookingrequestbyoffer";
//     http.Response response = await http.post(Uri.parse(url), body: {
//       "offerid": offer_Id,
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Getbookingrequestbyoffer.fromJson(data!);
//   }
// }
//
// class getBookingconfirmbyoffer {
//   Future<Getbookingconfirmbyoffermodel> getbookingconfirmbyoffer(
//       offer_Id) async {
//     var url = apiUrl + "/getbookingconfirmbyoffer";
//     http.Response response = await http.post(Uri.parse(url), body: {
//       "offerid": offer_Id,
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Getbookingconfirmbyoffermodel.fromJson(data!);
//   }
// }
//
// class cancelOffer {
//   Future<Canceloffermodel> canceloffer(offer_Id) async {
//     var url = apiUrl + "/canceloffer";
//     http.Response response = await http.post(Uri.parse(url), body: {
//       "offerid": offer_Id,
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Canceloffermodel.fromJson(data!);
//   }
// }
//
// class bookingList {
//   Future<Bookinglist> bookinglist(user_Id) async {
//     var url = apiUrl + "/bookinglist";
//     http.Response response = await http.post(Uri.parse(url), body: {
//       "userid": user_Id,
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Bookinglist.fromJson(data!);
//   }
// }
//
// class mySchedule {
//   Future<Myschedule> myschedule(user_Id) async {
//     var url = apiUrl + "/myschedule";
//     http.Response response = await http.post(Uri.parse(url), body: {
//       "userid": user_Id,
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Myschedule.fromJson(data!);
//   }
// }
//
// class addVehicle {
//   Future<Addvehiclemodel> addvehicle(
//     id,
//     vid,
//     vehocletype,
//     vehiclemodel,
//     vehicleno,
//     ac,
//     isCommercial,
//     ePlaceType,
//     vCity_1,
//     vCity_2,
//     vCity_3,
//     isParcel,
//   ) async {
//     var url = apiUrl + "/addvehicle";
//     var response = await http.post(Uri.parse(url), body: {
//       "userid": id,
//       "vehicleid": vid,
//       "vehiclemodel": vehocletype,
//       "vehiclemodel": vehiclemodel,
//       "vehicleno": vehicleno,
//       "ac": ac,
//       "isCommercial": isCommercial,
//       "ePlaceType": ePlaceType,
//       "vCity_1": vCity_1,
//       "vCity_2": vCity_2,
//       "vCity_3": vCity_3,
//       "isParcel": isParcel
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Addvehiclemodel.fromJson(data);
//   }
// }
//
// class addVehicledoc {
//   Future<Addvehicledocmodel> addvehicledoc(
//     id,
//     vehicleid,
//     key,
//     document,
//     documentno,
//   ) async {
//     var url = apiUrl + "/addvehicledoc";
//     http.Response response = await http.post(Uri.parse(url), body: {
//       "id": id,
//       "vehicleid": vehicleid,
//       "key": key,
//       "document": document,
//       "documentno": documentno
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response:" + response.body);
//     return Addvehicledocmodel.fromJson(data!);
//   }
// }
//
// class setPreference {
//   Future<Preferencemodel> setpreference(
//       user_Id, chat, smoke, music, pet, ac) async {
//     var url = apiUrl + "/preference";
//     http.Response response = await http.post(Uri.parse(url), body: {
//       "userid": user_Id,
//       "chat": chat,
//       "smoke": smoke,
//       "music": music,
//       "pet": pet,
//       "AC": ac,
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response:" + response.body);
//     return Preferencemodel.fromJson(data!);
//   }
// }
//
// class getPreference {
//   Future<Getpreferencemodel> getpreference(userId) async {
//     var url = apiUrl + "/getpreference";
//     http.Response response = await http.post(Uri.parse(url), body: {
//       "userid": userId,
//     });
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Getpreferencemodel.fromJson(data!);
//   }
// }
//
// class updateProfile {
//   updateprofile(
//     userid,
//     email,
//     Fullname,
//     birthyear,
//     gender,
//     userimage,
//     bio,
//       imagepath,
//   ) async {
//     var url = apiUrl + "/updateprofile";
//     var request = http.MultipartRequest("POST",Uri.parse(url));
//     request.fields['userid'] = userid;
//     request.fields['name'] = Fullname;
//     request.fields['email'] = email;
//     request.fields['birthyear'] = birthyear;
//     request.fields['gender'] = gender;
//
//
//     http.MultipartFile picture = await http.MultipartFile.fromPath('userimage',imagepath,
//     filename:imagepath);
//     request.files.add(picture);
//     var response = await request.send();
//     var responseData = await response.stream.toBytes();
//     var result = String.fromCharCodes(responseData);
//     print(result);
//     // var response = await http.post(Uri.parse(url), body: {
//     //   "userid": userid,
//     //   "name": Fullname,
//     //   "email": email,
//     //   "birthyear": birthyear,
//     //   "gender": gender,
//     //   "userimage": userimage,
//     //   "bio": bio
//     // });
//     //
//      var data = jsonDecode(result);
//     // print("Response: " + response.body);
//      return Updateprofilemodel.fromJson(data);
//   }
// }
//
// class singleOffer1 {
//   Future<Singleoffer1Model> singleoffer1(userid, offerid) async {
//     var url = apiUrl + "/singleoffer1";
//     http.Response response = await http.post(Uri.parse(url), body: {
//       "userid": userid,
//       "offerid": offerid,
//     });
//     var data = jsonDecode(response.body);
//     print("****Response: " + response.body);
//     print(data);
//
//     return Singleoffer1Model.fromJson(data!);
//   }
// }
//
// class setAddress {
//   Future<Setaddressmodel> setaddress(userId, address) async {
//     var url = apiUrl + "/setaddress";
//     http.Response response = await http
//         .post(Uri.parse(url), body: {"userid": userId, "address": address});
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Setaddressmodel.fromJson(data!);
//   }
// }
//
// class getAddress {
//   Future<Getaddressmodel> getaddress(userId) async {
//     var url = apiUrl + "/getaddress";
//     http.Response response = await http.post(Uri.parse(url), body: {
//       "userid": userId,
//     });
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Getaddressmodel.fromJson(data!);
//   }
// }
//
// class currentAllsendparcel {
//   Future<Currentallsendparcelmodel> currentallsendparcel() async {
//     var url = apiUrl + "/currentallsendparcel";
//     http.Response response = await http.post(
//       Uri.parse(url),
//     );
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Currentallsendparcelmodel.fromJson(data!);
//   }
// }
//
// class removeUservehicle {
//   Future<Removeuservehiclemodel> removeuservehicle(uservehicleid) async {
//     var url = apiUrl + "/removeuservehicle";
//     http.Response response =
//         await http.post(Uri.parse(url), body: {"uservehicleid": uservehicleid});
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Removeuservehiclemodel.fromJson(data!);
//   }
// }
//
// class removeSchedule {
//   Future<Removeschedulemodel> removeschedule(id) async {
//     var url = apiUrl + "/removeschedule";
//     http.Response response = await http.post(Uri.parse(url), body: {"id": id});
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Removeschedulemodel.fromJson(data!);
//   }
// }
//
// class cancelReasonlist {
//   Future<Cancelreasonlistmodel> cancelreasonlist() async {
//     var url = apiUrl + "/cancelreasonlist";
//     http.Response response = await http.post(
//       Uri.parse(url),
//     );
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Cancelreasonlistmodel.fromJson(data!);
//   }
// }
//
// class cancelBooking {
//   Future<Cancelbookingmodel> cancelbooking(bookid) async {
//     var url = apiUrl + "/cancelbooking";
//     http.Response response =
//         await http.post(Uri.parse(url), body: {"bookid": bookid});
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Cancelbookingmodel.fromJson(data!);
//   }
// }
//
// class allSendparcel {
//   Future<Allsendparcelmodel> allsendparcel(iSenderID) async {
//     var url = apiUrl + "/allsendparcel";
//     http.Response response =
//         await http.post(Uri.parse(url), body: {"iSenderID": iSenderID});
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Allsendparcelmodel.fromJson(data!);
//   }
// }
//
// class hireVehiclesearchride {
//   Future<Hirevehiclesearchridemodel> hirevehiclesearchride(type, city) async {
//     var url = apiUrl + "/hirevehiclesearchride";
//     http.Response response =
//         await http.post(Uri.parse(url), body: {"type": type, "city": city});
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Hirevehiclesearchridemodel.fromJson(data!);
//   }
// }
//
// class getPickparceldetail {
//   Future<Getpickparceldetailmodel> getpickparceldetail(iNotificationID) async {
//     var url = apiUrl + "/getpickparceldetail";
//     http.Response response = await http
//         .post(Uri.parse(url), body: {"iNotificationID": iNotificationID});
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Getpickparceldetailmodel.fromJson(data!);
//   }
// }
//
// class acceptrejectSendparcel {
//   Future<Acceptrejectsendparcelmodel> acceptrejectsendparcel(
//       iNotificationID, cancelreason, type) async {
//     var url = apiUrl + "/acceptrejectsendparcel";
//     http.Response response = await http.post(Uri.parse(url), body: {
//       "iNotificationID": iNotificationID,
//       "cancelreason": cancelreason,
//       "type": type
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Acceptrejectsendparcelmodel.fromJson(data!);
//   }
// }
//
// class sendnotificationtoPickparcel {
//   Future<Sendnotificationtopickparcelmodel> sendnotificationtopickparcel(
//       iDriverID, iSendParcelID) async {
//     var url = apiUrl + "/sendnotificationtopickparcel";
//     http.Response response = await http.post(Uri.parse(url),
//         body: {"iDriverID": iDriverID, "iSendParcelID": iSendParcelID});
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Sendnotificationtopickparcelmodel.fromJson(data!);
//   }
// }
//
// class hirevehiclereateRequest {
//   Future<Hirevehiclecreaterequestmodel> hirevehiclecreaterequest(
//       iBookUserID,
//       vPickupLocation,
//       vDropLocation,
//       eVehicleType,
//       vCity,
//       dtRequestBooking,
//       tmRequestBooking) async {
//     var url = apiUrl + "/hirevehiclecreaterequest";
//     http.Response response = await http.post(Uri.parse(url), body: {
//       "iBookUserID": iBookUserID,
//       "vPickupLocation": vPickupLocation,
//       "vDropLocation": vDropLocation,
//       "eVehicleType": eVehicleType,
//       "vCity": vCity,
//       "dtRequestBooking": dtRequestBooking,
//       "tmRequestBooking": tmRequestBooking,
//     });
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Hirevehiclecreaterequestmodel.fromJson(data!);
//   }
// }
//
// class driverhirevehiclebookingBiddinglist {
//   Future<DriverhirevehiclebookingbiddinglistModel>
//       driverhirevehiclebookingbiddinglist(iDriverID) async {
//     var url = apiUrl + "/driverhirevehiclebookingbiddinglist";
//     http.Response response =
//         await http.post(Uri.parse(url), body: {"iDriverID": iDriverID});
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return DriverhirevehiclebookingbiddinglistModel.fromJson(data!);
//   }
// }
//
// class shareStatus {
//   Future<Sharestatusmodel> sharestatus(userid, contact) async {
//     var url = apiUrl + "/sharestatus";
//     http.Response response = await http.post(Uri.parse(url), body: {
//       "userid": userid,
//       "contact": contact,
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Sharestatusmodel.fromJson(data!);
//   }
// }
//
// class findRide {
//   Future<Findridemodel> findride(
//       leavecity, destcity, userid, vehicle_type) async {
//     var url = apiUrl + "/findride";
//     http.Response response = await http.post(Uri.parse(url), body: {
//       "leavecity": leavecity,
//       "destcity": destcity,
//       "userid": userid,
//       "vehicle_type": vehicle_type
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Findridemodel.fromJson(data!);
//   }
// }
//
// class findRequestofferbyuser {
//   Future<Findrequestofferbyusermodel> findrequestofferbyuser(userId) async {
//     var url = apiUrl + "/findrequestofferbyuser";
//     http.Response response = await http.post(Uri.parse(url), body: {
//       "userid": userId,
//     });
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Findrequestofferbyusermodel.fromJson(data!);
//   }
// }
//
// class addTruckvehicle {
//   Future<Addtruckvehiclemodel> addtruckvehicle(id, vehicletypeid, model, vehicleno) async {
//     var url = apiUrl + "/addtruckvehicle";
//
//     http.Response response = await http.post(Uri.parse(url),
//         headers: {
//       "content-type": "application/json",
//         },
//
//         body: {
//       "id": id,
//       "vehicletypeid": vehicletypeid,
//       "model": model,
//       "vehicleno": vehicleno,
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Addtruckvehiclemodel.fromJson(data!);
//   }
// }
//
// class giveDriverrate {
//   Future<Givedriverratemodel> givedriverrate(
//       user_Id, offerid, rating, rateby, review) async {
//     var url = apiUrl + "/givedriverrate";
//     http.Response response = await http.post(Uri.parse(url), body: {
//       "userid": user_Id,
//       "offerid": offerid,
//       "rating": rating,
//       "rateby": rateby,
//       "review": review,
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Givedriverratemodel.fromJson(data!);
//   }
// }
//
// class getDoc {
//   Future<Getdocmodel> getdoc(id, uservehicleid, document) async {
//     var url = apiUrl + "/getdoc";
//     http.Response response = await http.post(Uri.parse(url),
//         body: {"id": id, "uservehicleid": uservehicleid, "document": document});
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Getdocmodel.fromJson(data!);
//   }
// }
//
// class requestOffer {
//   Future<Requestoffermodel> requestoffer(
//     userid,
//     leave_long,
//     leave_lat,
//     dest_long,
//     dest_lat,
//     godate,
//     seats,
//     distance,
//     leavecity,
//     destination,
//     destaddress,
//     leaveaddress,
//     vehicle_type,
//   ) async {
//     var url = apiUrl + "/requestoffer";
//     var response = await http.post(Uri.parse(url), body: {
//       "userid": userid,
//       "leave_long": leave_long,
//       "leave_lat": leave_lat,
//       "dest_long": dest_long,
//       "dest_lat": dest_lat,
//       "godate": godate,
//       "seats": seats,
//       "distance": distance,
//       "leavecity": leavecity,
//       "destination": destination,
//       "destaddress": destaddress,
//       "leaveaddress": leaveaddress,
//       "vehicle_type": vehicle_type
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Requestoffermodel.fromJson(data);
//   }
// }
//
// class pickParceldetails {
//   Future<Pickparceldetailsmodel> pickparceldetails(
//       iDriverID,
//       iVehicleID,
//       dLeaveLong,
//       dLeaveLat,
//       dDestLong,
//       dDestLat,
//       vLeaveAddress,
//       vDestAddress,
//       vLeaveCity,
//       vDestCity,
//       eOfferPriceType,
//       dOfferRate,
//       vVehicleLoadCapacity,
//       vVehicleDimention,
//       eTermCondition,
//       dtGo,
//       tmGo,
//       schedule_ride_by,
//       schedule_ride_data) async {
//     var url = apiUrl + "/pickparceldetails";
//     var response = await http.post(Uri.parse(url), body: {
//       "iDriverID": iDriverID,
//       "iVehicleID": iVehicleID,
//       "dLeaveLong": dLeaveLong,
//       "dLeaveLat": dLeaveLat,
//       "dDestLong": dDestLong,
//       "dDestLat": dDestLat,
//       "vLeaveAddress": vLeaveAddress,
//       "vDestAddress": vDestAddress,
//       "vLeaveCity": vLeaveCity,
//       "vDestCity": vDestCity,
//       "eOfferPriceType": eOfferPriceType,
//       "dOfferRate": dOfferRate,
//       "vVehicleLoadCapacity": vVehicleLoadCapacity,
//       "vVehicleDimention": vVehicleDimention,
//       "eTermCondition": eTermCondition,
//       "dtGo": dtGo,
//       "tmGo": tmGo,
//       "schedule_ride_by": schedule_ride_by,
//       "schedule_ride_data": schedule_ride_data,
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Pickparceldetailsmodel.fromJson(data);
//   }
// }
//
// class getvehicleOffer {
//   Future<Getvehicleoffermodel> getvehicleoffer(id, type) async {
//     var url = apiUrl + "/getvehicleoffer";
//     http.Response response = await http.post(Uri.parse(url), body: {
//       "id": id,
//       "type": type,
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Getvehicleoffermodel.fromJson(data!);
//   }
// }
//
// class updateVehicle {
//   Future<Updatevehiclemodel> updatevehicle(
//       uservehicleid,
//       model,
//       vehicleno,
//       vehicletypeid,
//       ac,
//       isCommercial,
//       ePlaceType,
//       vCity_1,
//       vCity_2,
//       vCity_3,
//       isParcel) async {
//     var url = apiUrl + "/updatevehicle";
//     http.Response response = await http.post(Uri.parse(url), body: {
//       "uservehicleid": uservehicleid,
//       "model": model,
//       "vehicleno": vehicleno,
//       "vehicletypeid": vehicletypeid,
//       "ac": ac,
//       "isCommercial": isCommercial,
//       "ePlaceType": ePlaceType,
//       "vCity_1": vCity_1,
//       "vCity_2": vCity_2,
//       "vCity_3": vCity_3,
//       "isParcel": isParcel,
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Updatevehiclemodel.fromJson(data!);
//   }
// }
//
// class checkOtp {
//   Future<Checkotpmodel> checkotp(mobilenumber, otp, id) async {
//     var url = apiUrl + "/checkotp";
//     var response = await http.post(Uri.parse(url), body: {
//       "otp": otp,
//       "mobile": mobilenumber,
//       "id": id,
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Checkotpmodel.fromJson(data);
//   }
// }
//
// class hirevehicleAddbidrate {
//   Future<HirevehicleaddbidrateModel> hirevehicleaddbidrate(
//       dBiddingRate, iNotificationID) async {
//     var url = apiUrl + "/hirevehicleaddbidrate";
//     http.Response response = await http.post(Uri.parse(url), body: {
//       "dBiddingRate": dBiddingRate,
//       "iNotificationID": iNotificationID,
//     });
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return HirevehicleaddbidrateModel.fromJson(data!);
//   }
// }
//
// class acceptOrrejecthirevehiclerequest {
//   Future<Acceptorrejecthirevehiclerequest> acceptorrejecthirevehiclerequest(
//       iNotificationID, iCancelReasonID, type) async {
//     var url = apiUrl + "/acceptorrejecthirevehiclerequest";
//     http.Response response = await http.post(Uri.parse(url), body: {
//       "iNotificationID": iNotificationID,
//       "iCancelReasonID": iCancelReasonID,
//       "type": type,
//     });
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Acceptorrejecthirevehiclerequest.fromJson(data!);
//   }
// }
//
// class passengerConfirmhirevehiclerequest {
//   Future<PassengerconfirmhirevehiclerequestModel>
//       passengerconfirmhirevehiclerequest(iPassengerID) async {
//     var url = apiUrl + "/passengerconfirmhirevehiclerequest";
//     http.Response response =
//         await http.post(Uri.parse(url), body: {"iPassengerID": iPassengerID});
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return PassengerconfirmhirevehiclerequestModel.fromJson(data!);
//   }
// }
//
// class Walletreq {
//   Future<WalletreqModel> walletreq(userid, redeem_req, redeem_amt) async {
//     var url = apiUrl + "/walletreq";
//     http.Response response = await http.post(Uri.parse(url), body: {
//       "userid": userid,
//       "redeem_req": redeem_req,
//       "redeem_amt": redeem_amt,
//     });
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return WalletreqModel.fromJson(data!);
//   }
// }
//
// class Newoffer {
//   Future<Newoffermodel> newoffer(
//       uservehicleid,
//       userid,
//       leave_long,
//       leave_lat,
//       dest_long,
//       dest_lat,
//       stop_long1,
//       stop_lat1,
//       godate,
//       gotime,
//       seats,
//       distance,
//       leavetostop,
//       stoptodestination,
//       offertype,
//       leave,
//       destination,
//       stop1,
//       destaddress,
//       leaveaddress,
//       stopaddress,
//       offerprice,
//       offerprice_type,
//       schedule_ride_by,
//       schedule_ride_data) async {
//     var url = apiUrl + "/newoffer";
//     var response = await http.post(Uri.parse(url), body: {
//       "uservehicleid": uservehicleid,
//       "userid": userid,
//       "leave_long": leave_long,
//       "leave_lat": leave_lat,
//       "dest_long": dest_long,
//       "dest_lat": dest_lat,
//       "stop_long1": stop_long1,
//       "stop_lat1": stop_lat1,
//       "godate": godate,
//       "gotime": gotime,
//       "seats": seats,
//       "distance": distance,
//       "leavetostop": leavetostop,
//       "stoptodestination": stoptodestination,
//       "offertype": offertype,
//       "leave": leave,
//       "destination": destination,
//       "stop1": stop1,
//       "destaddress": destaddress,
//       "leaveaddress": leaveaddress,
//       "stopaddress": stopaddress,
//       "offerprice": offerprice,
//       "offerprice_type": offerprice_type,
//       "schedule_ride_by": schedule_ride_by,
//       "schedule_ride_data": schedule_ride_data
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Newoffermodel.fromJson(data);
//   }
// }
//
// class Sendparcel {
//   Future<Sendparcelmodel> sendparcel(
//       tFromLocation,
//       tToLocation,
//       vFromCity,
//       vToCity,
//       dFromLocationLat,
//       dFromLocationLong,
//       dToLocationLat,
//       dToLocationLong,
//       tItemName,
//       dItemValue,
//       dItemWeight,
//       eItemSize,
//       eWhoWillMeetDriverAtPickupLocation,
//       vSenderName,
//       vSenderMobile,
//       eWhoWillMeetDriverAtDeliveryLocation,
//       vReceiverName,
//       vReceiverMobile,
//       ePickupTime,
//       ePickupDateTime,
//       eRecieveTime,
//       eReceiveDateTime,
//       tItemDimention,
//       dItemLength,
//       dItemWidth,
//       dItemHeight,
//       tExtraDetails,
//       vItemPhoto,
//       iSenderID,
//       imagepath) async {
//     var url = apiUrl + "/sendparcel";
//     var request = http.MultipartRequest("POST",Uri.parse(url));
//     request.fields['tFromLocation'] = tFromLocation;
//     request.fields['tToLocation'] = tToLocation;
//     request.fields['vFromCity'] = vFromCity;
//     request.fields['vToCity'] = vToCity;
//     request.fields['dFromLocationLat'] = dFromLocationLat;
//     request.fields['dFromLocationLong'] = dFromLocationLong;
//     request.fields['dToLocationLat'] = dToLocationLat;
//     request.fields['dToLocationLong'] = dToLocationLong;
//     request.fields['tItemName'] = tItemName;
//     request.fields['dItemValue'] = dItemValue;
//     request.fields['dItemWeight'] = dItemWeight;
//     request.fields['eItemSize'] = eItemSize;
//     request.fields['eWhoWillMeetDriverAtPickupLocation'] = eWhoWillMeetDriverAtPickupLocation;
//     request.fields['vSenderName'] = vSenderName;
//     request.fields['vSenderMobile'] = vSenderMobile;
//     request.fields['eWhoWillMeetDriverAtDeliveryLocation'] = eWhoWillMeetDriverAtDeliveryLocation;
//     request.fields['vReceiverName'] = vReceiverName;
//     request.fields['vReceiverMobile'] = vReceiverMobile;
//     request.fields['ePickupTime'] = ePickupTime;
//     request.fields['ePickupDateTime'] = ePickupDateTime;
//     request.fields['eRecieveTime'] = eRecieveTime;
//     request.fields['eReceiveDateTime'] = eReceiveDateTime;
//     request.fields['tItemDimention'] = tItemDimention;
//     request.fields['dItemLength'] = dItemLength;
//     request.fields['dItemWidth'] = dItemWidth;
//     request.fields['dItemHeight'] = dItemHeight;
//     request.fields['tExtraDetails'] = tExtraDetails;
//     request.fields['iSenderID'] = iSenderID;
//     request.fields['vItemPhoto']=vItemPhoto;
//
//     http.MultipartFile picture = await http.MultipartFile.fromPath('userimage',imagepath,
//         filename: imagepath);
//     request.files.add(picture);
//     var response = await request.send();
//     var responseData = await response.stream.toBytes();
//     var result = String.fromCharCodes(responseData);
//     print(result);
//
//     // var response = await http.post(Uri.parse(url), body: {
//     //   "tFromLocation": tFromLocation,
//     //   "tToLocation": tToLocation,
//     //   "vFromCity": vFromCity,
//     //   "vToCity": vToCity,
//     //   "dFromLocationLat": dFromLocationLat,
//     //   "dFromLocationLong": dFromLocationLong,
//     //   "dToLocationLat": dToLocationLat,
//     //   "dToLocationLong": dToLocationLong,
//     //   "tItemName": tItemName,
//     //   "dItemValue": dItemValue,
//     //   "dItemWeight": dItemWeight,
//     //   "eItemSize": eItemSize,
//     //   "eWhoWillMeetDriverAtPickupLocation": eWhoWillMeetDriverAtPickupLocation,
//     //   "vSenderName": vSenderName,
//     //   "vSenderMobile": vSenderMobile,
//     //   "eWhoWillMeetDriverAtDeliveryLocation":
//     //       eWhoWillMeetDriverAtDeliveryLocation,
//     //   "vReceiverName": vReceiverName,
//     //   "vReceiverMobile": vReceiverMobile,
//     //   "ePickupTime": ePickupTime,
//     //   "ePickupDateTime": ePickupDateTime,
//     //   "eRecieveTime": eRecieveTime,
//     //   "eReceiveDateTime": eReceiveDateTime,
//     //   "tItemDimention": tItemDimention,
//     //   "dItemLength": dItemLength,
//     //   "dItemWidth": dItemWidth,
//     //   "dItemHeight": dItemHeight,
//     //   "tExtraDetails": tExtraDetails,
//     //   "vItemPhoto": vItemPhoto,
//     //   "iSenderID": iSenderID,
//     // });
//
//     var data = jsonDecode(result);
//     //print("Response: " + response.body);
//     return Sendparcelmodel.fromJson(data);
//   }
// }
//
// class Updatesendparceldetails {
//   Future<Editparcelrmodel> updatesendparceldetails(
//       tFromLocation,
//       tToLocation,
//       vFromCity,
//       vToCity,
//       dFromLocationLat,
//       dFromLocationLong,
//       dToLocationLat,
//       dToLocationLong,
//       tItemName,
//       dItemValue,
//       dItemWeight,
//       eItemSize,
//       eWhoWillMeetDriverAtPickupLocation,
//       vSenderName,
//       vSenderMobile,
//       eWhoWillMeetDriverAtDeliveryLocation,
//       vReceiverName,
//       vReceiverMobile,
//       ePickupTime,
//       ePickupDateTime,
//       eRecieveTime,
//       eReceiveDateTime,
//       tItemDimention,
//       dItemLength,
//       dItemWidth,
//       dItemHeight,
//       tExtraDetails,
//       vItemPhoto,
//       iSenderID,
//       iSendParcelID) async {
//     var url = apiUrl + "/updatesendparceldetails";
//     var response = await http.post(Uri.parse(url), body: {
//       "tFromLocation": tFromLocation,
//       "tToLocation": tToLocation,
//       "vFromCity": vFromCity,
//       "vToCity": vToCity,
//       "dFromLocationLat": dFromLocationLat,
//       "dFromLocationLong": dFromLocationLong,
//       "dToLocationLat": dToLocationLat,
//       "dToLocationLong": dToLocationLong,
//       "tItemName": tItemName,
//       "dItemValue": dItemValue,
//       "dItemWeight": dItemWeight,
//       "eItemSize": eItemSize,
//       "eWhoWillMeetDriverAtPickupLocation": eWhoWillMeetDriverAtPickupLocation,
//       "vSenderName": vSenderName,
//       "vSenderMobile": vSenderMobile,
//       "eWhoWillMeetDriverAtDeliveryLocation":
//           eWhoWillMeetDriverAtDeliveryLocation,
//       "vReceiverName": vReceiverName,
//       "vReceiverMobile": vReceiverMobile,
//       "ePickupTime": ePickupTime,
//       "ePickupDateTime": ePickupDateTime,
//       "eRecieveTime": eRecieveTime,
//       "eReceiveDateTime": eReceiveDateTime,
//       "tItemDimention": tItemDimention,
//       "dItemLength": dItemLength,
//       "dItemWidth": dItemWidth,
//       "dItemHeight": dItemHeight,
//       "tExtraDetails": tExtraDetails,
//       "vItemPhoto": vItemPhoto,
//       "iSenderID": iSenderID,
//       "iSendParcelID": iSendParcelID,
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Editparcelrmodel.fromJson(data);
//   }
// }
//
// class Booking {
//   Future<Bookingmodel> booking(userid, offerid, bookseats,totalfare,tid,contact) async {
//     var url = apiUrl + "/booking";
//     http.Response response = await http.post(Uri.parse(url), body: {
//       "userid": userid,
//       "offerid": offerid,
//       "bookseats": bookseats,
//       "totalfare":totalfare,
//       "tid":tid,
//       "contact":contact,
//     });
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Bookingmodel.fromJson(data!);
//   }
// }
// class Publicprofile {
//   Future<PubLicprofilemodel> publicprofile(userId) async {
//     var url = apiUrl + "/getpublicprofile";
//     http.Response response = await http
//         .post(Uri.parse(url), body: {"userid": userId});
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return PubLicprofilemodel.fromJson(data!);
//   }
// }
//
// class android_vertion {
//   android_vertion();
//   Future<android_vertion_model> getvertion(ePlatform,vVersion) async {
//     var url = "http://lechalo.co.in/api/checkversion";
//     http.Response response = await http.post(Uri.parse(url),
//
//         body: {
//       "ePlatform": ePlatform,
//       "vVersion": vVersion,
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return android_vertion_model.fromJson(data!);
//   }
// }
//
//
// class parcels_schedule {
//   parcels_schedule();
//   Future<parcelscheduleride_model> parcels_schedulelist(LeaveCity,DestCity,goDate) async {
//     var url = "http://lechalo.co.in/api/parcelscheduleride";
//     http.Response response = await http.post(Uri.parse(url),
//
//         body: {
//           "LeaveCity": LeaveCity,
//           "DestCity": DestCity,
//           "goDate": goDate,
//         });
//
//     var data = jsonDecode(response.body);
//     print("parcels_schedule " + response.body);
//     return parcelscheduleride_model.fromJson(data!);
//   }
// }
//

import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:lechalo/models/acceptorrejectbookingrequestmodel.dart';
import 'package:lechalo/models/acceptorrejecthirevehiclerequest.dart';
import 'package:lechalo/models/acceptrejectsendparcelmodel.dart';
import 'package:lechalo/models/addaccountmodel.dart';
import 'package:lechalo/models/addtruckvehiclemodel.dart';
import 'package:lechalo/models/addvehicledocmodel.dart';
import 'package:lechalo/models/addvehiclemodel.dart';
import 'package:lechalo/models/allhirevehicles.dart';
import 'package:lechalo/models/allrequestedride.dart';
import 'package:lechalo/models/allride.dart';
import 'package:lechalo/models/allsendparcelmodel.dart';
import 'package:lechalo/models/bookinglist.dart';
import 'package:lechalo/models/bookingmodel.dart';
import 'package:lechalo/models/cancelbookingmodel.dart';
import 'package:lechalo/models/canceloffermodel.dart';
import 'package:lechalo/models/cancelreasonlistmodel.dart';
import 'package:lechalo/models/cartypemodel.dart';
import 'package:lechalo/models/checkotpmodel.dart';
import 'package:lechalo/models/checkotppassmodel.dart';
import 'package:lechalo/models/currentallsendparcelmodel.dart';
import 'package:lechalo/models/driverhirevehiclebookingbiddinglistmodel.dart';
import 'package:lechalo/models/editparcelrmodel.dart';
import 'package:lechalo/models/errormodel.dart';
import 'package:lechalo/models/findrequestofferbyusermodel.dart';
import 'package:lechalo/models/findridemodel.dart';
import 'package:lechalo/models/forfotpasswordModel.dart';
import 'package:lechalo/models/getProfile.dart';
import 'package:lechalo/models/getaccountmodel.dart';
import 'package:lechalo/models/getaddressmodel.dart';
import 'package:lechalo/models/getbookingconfirmbyoffermodel.dart';
import 'package:lechalo/models/getbookingrequestbyoffer.dart';
import 'package:lechalo/models/getdocmodel.dart';
import 'package:lechalo/models/getnotification1.dart';
import 'package:lechalo/models/getpickparceldetailmodel.dart';
import 'package:lechalo/models/getpreferencemodel.dart';
import 'package:lechalo/models/getvehicleoffermodel.dart';
import 'package:lechalo/models/getvehicles.dart';
import 'package:lechalo/models/getwalletmodel.dart';
import 'package:lechalo/models/givedriverratemodel.dart';
import 'package:lechalo/models/hirevehicleaddbidrateModel.dart';
import 'package:lechalo/models/hirevehiclecreaterequestmodel.dart';
import 'package:lechalo/models/hirevehiclesearchridemodel.dart';
import 'package:lechalo/models/myoffer.dart';
import 'package:lechalo/models/myschedule.dart';
import 'package:lechalo/models/newoffermodel.dart';
import 'package:lechalo/models/otpgenerationmodel.dart';
import 'package:lechalo/models/otpgenerationpassmodel.dart';
import 'package:lechalo/models/passengerconfirmhirevehiclerequestModel.dart';
import 'package:lechalo/models/pickparceldetailsmodel.dart';
import 'package:lechalo/models/preferencemodel.dart';
import 'package:lechalo/models/publicprofilemodel.dart';
import 'package:lechalo/models/removeschedulemodel.dart';
import 'package:lechalo/models/removeuservehiclemodel.dart';
import 'package:lechalo/models/requestoffermodel.dart';
import 'package:lechalo/models/sendnotificationtopickparcelmodel.dart';
import 'package:lechalo/models/sendparcelmodel.dart';
import 'package:lechalo/models/setaddressmodel.dart';
import 'package:lechalo/models/sharestatusmodel.dart';
import 'package:lechalo/models/singleoffer1model.dart';
import 'package:lechalo/models/updatepasswordmodel.dart';
import 'package:lechalo/models/updateprofilemodel.dart';
import 'package:lechalo/models/updatevehiclemodel.dart';
import 'package:lechalo/models/walletreqModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lechalo/constant.dart';
import 'package:lechalo/models/loginmodel.dart';
import 'package:http/http.dart' as http;
import 'package:lechalo/models/userregmodel.dart';

import '../models/android_vertion_model.dart';
import '../models/parcelscheduleride_model.dart';

//import '../models/incorrectpassword.dart';

class Login {
  Future<LoginModel> login(mobilenumber, password, type) async {
    var url = apiUrl + "/login";
    var response = await http.post(Uri.parse(url), body: {
      "mobile": mobilenumber,
      "password": password,
      "type": type,
    });

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return LoginModel.fromJson(data);
  }
}

class creataccount {
  creataccount();
  Future<Userregmodel> createaccount(
      email,
      Fullname,
      birthyear,
      gender,
      userimage,
      type,
      password,
      mobile,
      imagepath
      ) async {
    var url = apiUrl + "/userreg";
    var request = http.MultipartRequest("POST",Uri.parse(url));
    request.fields['email'] = email;
    request.fields['name'] = Fullname;
    request.fields['birthyear'] = birthyear;
    request.fields['gender'] = gender;
    request.fields['type'] = type;
    request.fields['password'] = password;
    request.fields['mobile'] = mobile;

    http.MultipartFile picture = await http.MultipartFile.fromPath('userimage',imagepath, filename: imagepath);
    request.files.add(picture);
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var result = String.fromCharCodes(responseData);
    print(result);
    // var response = await http.post(Uri.parse(url), body: {
    //   "email": email,
    //   "name": Fullname,
    //   "birthyear": birthyear,
    //   "gender": gender,
    //   "userimage": userimage,
    //   "type": type,
    //   "password": password,
    //   "mobile": mobile,
    // });

    var data = jsonDecode(result);
    // print("Response: " + response.body);
    return Userregmodel.fromJson(data);
  }
}

class otpgenerationPass {
  Future<Otpgenerationpassmodel> otpgenerationpass(mobilenumber, type) async {
    var url = apiUrl + "/otpgenerationpass";
    var response = await http.post(Uri.parse(url), body: {
      "type": type,
      "mobile": mobilenumber,
    });

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Otpgenerationpassmodel.fromJson(data);
  }
}

// class incorrectPassword {
//   Future<incorredctpasswordmodel> incorrectpassword(status , msg) async{
//     var url = apiUrl + "/login";
//     var response = await http.post(Uri.parse(url), body: {
//       "status": status,
//       "msg": msg,
//     });
//
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return incorredctpasswordmodel.fromJson(data);
//   }
// }


class otpGeneration {
  Future<Otpgenerationmodel> otpgeneration(mobilenumber, id) async {
    var url = apiUrl + "/otpgeneration";
    var response = await http.post(Uri.parse(url), body: {
      "id": id,
      "mobile": mobilenumber,
    });

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Otpgenerationmodel.fromJson(data);
  }
}

class checkotpPass {
  Future<Checkotppassmodel> checkotppass(mobilenumber, otp, type) async {
    var url = apiUrl + "/checkotppass";
    var response = await http.post(Uri.parse(url), body: {
      "otp": otp,
      "mobile": mobilenumber,
      "type": type,
    });

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Checkotppassmodel.fromJson(data);
  }
}

class resetPassword {
  Future<Forfotpassword> resetpassword(mobile, type, password) async {
    var url = apiUrl + "/resetpassword";
    var response = await http.post(Uri.parse(url), body: {
      "mobile": mobile,
      "type": type,
      "password": password,
    });
    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Forfotpassword.fromJson(data);
  }
}

class updatePassword {
  Future<Updatepasswordmodel> updatepassword(
      userid, oldpassword, password) async {
    var url = apiUrl + "/updatepassword";
    var response = await http.post(Uri.parse(url), body: {
      "userid": userid,
      "oldpassword": oldpassword,
      "password": password,
    });

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Updatepasswordmodel.fromJson(data);
  }
}

class getWallet {
  Future<Getwalletmodel> getwallet(userId) async {
    var url = apiUrl + "/getwallet";
    http.Response response = await http.post(Uri.parse(url), body: {
      "userid": userId,
    });

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Getwalletmodel.fromJson(data!);
  }
}

class addAccount {
  Future<Addaccountmodel> addaccount(
      userid,
      country,
      account,
      bankname,
      ifsc,
      ) async {
    var url = apiUrl + "/addaccount";
    var response = await http.post(Uri.parse(url), body: {
      "userid": userid,
      "country": country,
      "account": account,
      "bankname": bankname,
      "ifsc": ifsc,
    });

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Addaccountmodel.fromJson(data);
  }
}

class getAccount {
  Future<Getaccountmodel> getaccount(userid) async {
    var url = apiUrl + "/getaccount";
    var response = await http.post(Uri.parse(url), body: {
      "userid": userid,
    });

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Getaccountmodel.fromJson(data);
  }
}
// class creataccount {
//   Future<Userreg> createaccount(
//     email,
//      Fullname,
//      birthyear,
//      gender,
//      userimage,
//      type,
//      password,
//      mobile,
//   ) async {
//     final response = await http.post(
//       Uri.parse(apiUrl + "/userreg"),
//       body: {
//         "email": email,
//         "name": Fullname,
//         "birthyear": birthyear,
//         "gender": gender,
//         "userimage": userimage,
//         "type": type,
//         "password": password,
//         "mobile": mobile,
//       },
//     );
//     var data = jsonDecode(response.body);
//     print("Response: " + response.body);
//     return Userreg.fromJson(data);
//
//
//       // var data=jsonDecode(response.body);
//       // print("data:$data");
//       // return data;
//
//
//   }
// }

class getProfile {
  getProfile();
  Future<Getprofile> getprofile(userId) async {
    print("deep${userId.toString()}");
    var url = apiUrl + "/getprofile";
    //id,name,email,password,rememberMe,createdAt,updatedAt,statuschangeat,type,mobile,status,birthyear,age,gender,userimage,request,otp,roleid,bio,chat,smoke,pet,aC,wallet,redeemReq,devicetype,devicetoken,deviceid,ratestatus,driverrate,offeridrate,fname,lname
    http.Response response = await http.post(Uri.parse(url),
        body: {
          "userid": userId,
          //     "id":id,
          //     "name":name,
          //     "email":email,
          //     "password":password,
          //     "rememberMe":rememberMe,
          //     "createdAt":createdAt,
          //     "updatedAt":updatedAt,
          //     "statuschangeat":statuschangeat,
          //     "type":type,
          //     "mobile":mobile,
          //     "status":status,
          //     "birthyear":birthyear,
          //     "age":age,
          //     "gender":gender,
          //     "userimage":userimage,
          //     "request":request,
          //     "otp":otp,
          //     "roleid":roleid,
          //     "bio":bio,
          //     "chat":chat,
          //     "smoke":smoke,
          //     "music":smoke,
          //     "pet":pet,
          //     "aC":aC,
          //     "wallet":wallet,
          //     "address":wallet,
          //     "redeemReq":redeemReq,
          //     "devicetype":devicetype,
          //     "devicetoken":devicetoken,
          //     "deviceid":deviceid,
          //     "ratestatus":ratestatus,
          //     "driverrate":driverrate,
          //     "offeridrate":offeridrate,
          //     "fname":fname,
          //     "lname":lname,



        });
    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    print("ankit");
    return Getprofile.fromJson(data);
  }
}

class getVehicles {
  Future<Getvehicles> getvehicles(userId) async {
    var url = apiUrl + "/getvehicles";
    http.Response response = await http.post(Uri.parse(url), body: {
      "id": userId,
    });

    var data = jsonDecode(response.body);
    print("getVehicles: " + response.body);
    print("After get Vehicles : "+data.toString());
    return Getvehicles.fromJson(data!);
  }

  Future<Getvehicles> deletevehicles() async {
    var url = apiUrl + "/getvehicles";
    http.Response response = await http.delete(
      Uri.parse(url),
    );

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Getvehicles.fromJson(data!);
  }
}

class getNotification1 {
  Future<Getnotification1> getnotification1(user_Id) async {
    var url = apiUrl + "/getnotification1";
    http.Response response = await http.post(Uri.parse(url), body: {
      "userid": user_Id,
    });

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Getnotification1.fromJson(data!);
  }
}

class acceptorrejectBookingrequest {
  Future<Acceptorrejectbookingrequestmodel> acceptorrejectbookingrequest(
      bookingrequestid, cancelreason, type) async {
    var url = apiUrl + "/acceptorrejectbookingrequest";
    http.Response response = await http.post(Uri.parse(url), body: {
      "bookingrequestid": bookingrequestid,
      "cancelreason": cancelreason,
      "type": type
    });

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Acceptorrejectbookingrequestmodel.fromJson(data!);
  }
}

class allRequestedride {
  Future<Allrequestedride> allrequestedride(user_Id) async {
    var url = apiUrl + "/allrequestedride";
    http.Response response = await http.post(Uri.parse(url), body: {
      "userid": user_Id,
    });

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Allrequestedride.fromJson(data);
  }
}

class allRide {
  Future<Allride> allride(user_Id,vehicle_type) async {
    var url = apiUrl + "/allride";
    http.Response response = await http.post(Uri.parse(url), body: {
      "userid": user_Id,
      "vehicle_type":vehicle_type
    });

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Allride.fromJson(data!);
  }
}

class allHirevehicles {
  Future<Allhirevehicles> allhirevehicles(user_Id) async {
    var url = apiUrl +"/allhirevehicles";
    http.Response response = await http.post(Uri.parse(url), body: {
      "userid": user_Id,
    });
    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Allhirevehicles.fromJson(data!);
  }
}

class myOffer {
  Future<Myoffer> myoffer(user_Id) async {
    var url = apiUrl + "/myoffer";
    http.Response response = await http.post(Uri.parse(url), body: {
      "userid": user_Id,
    });

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Myoffer.fromJson(data!);
  }
}

class getBookingrequestbyoffer {
  Future<Getbookingrequestbyoffer> getbookingrequestbyoffer(offer_Id) async {
    var url = apiUrl + "/getbookingrequestbyoffer";
    http.Response response = await http.post(Uri.parse(url), body: {
      "offerid": offer_Id,
    });

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Getbookingrequestbyoffer.fromJson(data!);
  }
}

class getBookingconfirmbyoffer {
  Future<Getbookingconfirmbyoffermodel> getbookingconfirmbyoffer(
      offer_Id) async {
    var url = apiUrl + "/getbookingconfirmbyoffer";
    http.Response response = await http.post(Uri.parse(url), body: {
      "offerid": offer_Id,
    });

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Getbookingconfirmbyoffermodel.fromJson(data!);
  }
}

class cancelOffer {
  Future<Canceloffermodel> canceloffer(offer_Id) async {
    var url = apiUrl + "/canceloffer";
    http.Response response = await http.post(Uri.parse(url), body: {
      "offerid": offer_Id,
    });

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Canceloffermodel.fromJson(data!);
  }
}

class bookingList {
  Future<Bookinglist> bookinglist(user_Id) async {
    var url = apiUrl + "/bookinglist";
    http.Response response = await http.post(Uri.parse(url), body: {
      "userid": user_Id,
    });

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Bookinglist.fromJson(data!);
  }
}

class mySchedule {
  Future<Myschedule> myschedule(user_Id) async {
    var url = apiUrl + "/myschedule";
    http.Response response = await http.post(Uri.parse(url), body: {
      "userid": user_Id,
    });

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Myschedule.fromJson(data!);
  }
}

class addVehicle {
  Future<Addvehiclemodel> addvehicle(
      id,
      vid,
      vehocletype,
      vehiclemodel,
      vehicleno,
      ac,
      isCommercial,
      ePlaceType,
      vCity_1,
      vCity_2,
      vCity_3,
      isParcel,
      ) async {
    var url = apiUrl + "/addvehicle";
    var response = await http.post(Uri.parse(url), body: {
      "userid": id,
      "vehicleid": vid,
      "vehiclemodel": vehocletype,
      "vehiclemodel": vehiclemodel,
      "vehicleno": vehicleno,
      "ac": ac,
      "isCommercial": isCommercial,
      "ePlaceType": ePlaceType,
      "vCity_1": vCity_1,
      "vCity_2": vCity_2,
      "vCity_3": vCity_3,
      "isParcel": isParcel
    });

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Addvehiclemodel.fromJson(data);
  }
}

class addVehicledoc {
  Future<Addvehicledocmodel> addvehicledoc(
      id,
      vehicleid,
      key,
      document,
      documentno,
      ) async {
    var url = apiUrl + "/addvehicledoc";
    http.Response response = await http.post(Uri.parse(url), body: {
      "id": id,
      "vehicleid": vehicleid,
      "key": key,
      "document": document,
      "documentno": documentno
    });

    var data = jsonDecode(response.body);
    print("Response:" + response.body);
    return Addvehicledocmodel.fromJson(data!);
  }
}

class setPreference {
  Future<Preferencemodel> setpreference(
      user_Id, chat, smoke, music, pet, ac) async {
    var url = apiUrl + "/preference";
    http.Response response = await http.post(Uri.parse(url), body: {
      "userid": user_Id,
      "chat": chat,
      "smoke": smoke,
      "music": music,
      "pet": pet,
      "AC": ac,
    });

    var data = jsonDecode(response.body);
    print("Response:" + response.body);
    return Preferencemodel.fromJson(data!);
  }
}

class getPreference {
  Future<Getpreferencemodel> getpreference(userId) async {
    var url = apiUrl + "/getpreference";
    http.Response response = await http.post(Uri.parse(url), body: {
      "userid": userId,
    });
    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Getpreferencemodel.fromJson(data!);
  }
}

class updateProfile {
  updateprofile(
      userid,
      email,
      Fullname,
      birthyear,
      gender,
      userimage,
      bio,
      imagepath,
      ) async {
    var url = apiUrl + "/updateprofile";
    var request = http.MultipartRequest("POST",Uri.parse(url));
    request.fields['userid'] = userid;
    request.fields['name'] = Fullname;
    request.fields['email'] = email;
    request.fields['birthyear'] = birthyear;
    request.fields['gender'] = gender;


    http.MultipartFile picture = await http.MultipartFile.fromPath('userimage',imagepath,
        filename:imagepath);
    request.files.add(picture);
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var result = String.fromCharCodes(responseData);
    print(result);
    // var response = await http.post(Uri.parse(url), body: {
    //   "userid": userid,
    //   "name": Fullname,
    //   "email": email,
    //   "birthyear": birthyear,
    //   "gender": gender,
    //   "userimage": userimage,
    //   "bio": bio
    // });
    //
    var data = jsonDecode(result);
    // print("Response: " + response.body);
    return Updateprofilemodel.fromJson(data);
  }
}

class singleOffer1 {
  Future<Singleoffer1Model> singleoffer1(userid, offerid) async {
    var url = apiUrl + "/singleoffer1";
    http.Response response = await http.post(Uri.parse(url), body: {
      "userid": userid,
      "offerid": offerid,
    });
    var data = jsonDecode(response.body);
    print("****Response: " + response.body);
    print(data);

    return Singleoffer1Model.fromJson(data!);
  }
}

class setAddress {
  Future<Setaddressmodel> setaddress(userId, address) async {
    var url = apiUrl + "/setaddress";
    http.Response response = await http
        .post(Uri.parse(url), body: {"userid": userId, "address": address});
    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Setaddressmodel.fromJson(data!);
  }
}

class getAddress {
  Future<Getaddressmodel> getaddress(userId) async {
    var url = apiUrl + "/getaddress";
    http.Response response = await http.post(Uri.parse(url), body: {
      "userid": userId,
    });
    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Getaddressmodel.fromJson(data!);
  }
}

class currentAllsendparcel {
  Future<Currentallsendparcelmodel> currentallsendparcel() async {
    var url = apiUrl + "/currentallsendparcel";
    http.Response response = await http.post(
      Uri.parse(url),
    );

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Currentallsendparcelmodel.fromJson(data!);
  }
}

class removeUservehicle {
  Future<Removeuservehiclemodel> removeuservehicle(uservehicleid) async {
    var url = apiUrl + "/removeuservehicle";
    http.Response response =
    await http.post(Uri.parse(url), body: {"uservehicleid": uservehicleid});

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Removeuservehiclemodel.fromJson(data!);
  }
}

class removeSchedule {
  Future<Removeschedulemodel> removeschedule(id) async {
    var url = apiUrl + "/removeschedule";
    http.Response response = await http.post(Uri.parse(url), body: {"id": id});

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Removeschedulemodel.fromJson(data!);
  }
}

class cancelReasonlist {
  Future<Cancelreasonlistmodel> cancelreasonlist() async {
    var url = apiUrl + "/cancelreasonlist";
    http.Response response = await http.post(
      Uri.parse(url),
    );

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Cancelreasonlistmodel.fromJson(data!);
  }
}

class cancelBooking {
  Future<Cancelbookingmodel> cancelbooking(bookid) async {
    var url = apiUrl + "/cancelbooking";
    http.Response response =
    await http.post(Uri.parse(url), body: {"bookid": bookid});

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Cancelbookingmodel.fromJson(data!);
  }
}

class allSendparcel {
  Future<Allsendparcelmodel> allsendparcel(iSenderID) async {
    var url = apiUrl + "/allsendparcel";
    http.Response response =
    await http.post(Uri.parse(url), body: {"iSenderID": iSenderID});

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Allsendparcelmodel.fromJson(data!);
  }
}

class hireVehiclesearchride {
  Future<Hirevehiclesearchridemodel> hirevehiclesearchride(type, city) async {
    var url = apiUrl + "/hirevehiclesearchride";
    http.Response response =
    await http.post(Uri.parse(url), body: {"type": type, "city": city});
    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Hirevehiclesearchridemodel.fromJson(data!);
  }
}

class getPickparceldetail {
  Future<Getpickparceldetailmodel> getpickparceldetail(iNotificationID) async {
    var url = apiUrl + "/getpickparceldetail";
    http.Response response = await http
        .post(Uri.parse(url), body: {"iNotificationID": iNotificationID});

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Getpickparceldetailmodel.fromJson(data!);
  }
}

class acceptrejectSendparcel {
  Future<Acceptrejectsendparcelmodel> acceptrejectsendparcel(
      iNotificationID, cancelreason, type) async {
    var url = apiUrl + "/acceptrejectsendparcel";
    http.Response response = await http.post(Uri.parse(url), body: {
      "iNotificationID": iNotificationID,
      "cancelreason": cancelreason,
      "type": type
    });

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Acceptrejectsendparcelmodel.fromJson(data!);
  }
}

class sendnotificationtoPickparcel {
  Future<Sendnotificationtopickparcelmodel> sendnotificationtopickparcel(
      iDriverID, iSendParcelID) async {
    var url = apiUrl + "/sendnotificationtopickparcel";
    http.Response response = await http.post(Uri.parse(url),
        body: {"iDriverID": iDriverID, "iSendParcelID": iSendParcelID});
    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Sendnotificationtopickparcelmodel.fromJson(data!);
  }
}

class hirevehiclereateRequest {
  Future<Hirevehiclecreaterequestmodel> hirevehiclecreaterequest(
      iBookUserID,
      vPickupLocation,
      vDropLocation,
      eVehicleType,
      vCity,
      dtRequestBooking,
      tmRequestBooking) async {
    var url = apiUrl + "/hirevehiclecreaterequest";
    http.Response response = await http.post(Uri.parse(url), body: {
      "iBookUserID": iBookUserID,
      "vPickupLocation": vPickupLocation,
      "vDropLocation": vDropLocation,
      "eVehicleType": eVehicleType,
      "vCity": vCity,
      "dtRequestBooking": dtRequestBooking,
      "tmRequestBooking": tmRequestBooking,
    });
    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Hirevehiclecreaterequestmodel.fromJson(data!);
  }
}

class driverhirevehiclebookingBiddinglist {
  Future<DriverhirevehiclebookingbiddinglistModel>
  driverhirevehiclebookingbiddinglist(iDriverID) async {
    var url = apiUrl + "/driverhirevehiclebookingbiddinglist";
    http.Response response =
    await http.post(Uri.parse(url), body: {"iDriverID": iDriverID});

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return DriverhirevehiclebookingbiddinglistModel.fromJson(data!);
  }
}

class shareStatus {
  Future<Sharestatusmodel> sharestatus(userid, contact) async {
    var url = apiUrl + "/sharestatus";
    http.Response response = await http.post(Uri.parse(url), body: {
      "userid": userid,
      "contact": contact,
    });

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Sharestatusmodel.fromJson(data!);
  }
}

class findRide {
  Future<Findridemodel> findride(
      leavecity, destcity, userid, vehicle_type) async {
    var url = apiUrl + "/findride";
    http.Response response = await http.post(Uri.parse(url), body: {
      "leavecity": leavecity,
      "destcity": destcity,
      "userid": userid,
      "vehicle_type": vehicle_type
    });

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Findridemodel.fromJson(data!);
  }
}

class findRequestofferbyuser {
  Future<Findrequestofferbyusermodel> findrequestofferbyuser(userId) async {
    var url = apiUrl + "/findrequestofferbyuser";
    http.Response response = await http.post(Uri.parse(url), body: {
      "userid": userId,
    });
    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Findrequestofferbyusermodel.fromJson(data!);
  }
}

class addTruckvehicle {
  Future<Addtruckvehiclemodel> addtruckvehicle(id, vehicletypeid, model, vehicleno) async {
    var url = apiUrl + "/addtruckvehicle";

    http.Response response = await http.post(Uri.parse(url),
        headers: {
          "content-type": "application/json",
        },

        body: {
          "id": id,
          "vehicletypeid": vehicletypeid,
          "model": model,
          "vehicleno": vehicleno,
        });

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Addtruckvehiclemodel.fromJson(data!);
  }
}

class giveDriverrate {
  Future<Givedriverratemodel> givedriverrate(
      user_Id, offerid, rating, rateby, review) async {
    var url = apiUrl + "/givedriverrate";
    http.Response response = await http.post(Uri.parse(url), body: {
      "userid": user_Id,
      "offerid": offerid,
      "rating": rating,
      "rateby": rateby,
      "review": review,
    });

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Givedriverratemodel.fromJson(data!);
  }
}

class getDoc {
  Future<Getdocmodel> getdoc(id, uservehicleid, document) async {
    var url = apiUrl + "/getdoc";
    http.Response response = await http.post(Uri.parse(url),
        body: {"id": id, "uservehicleid": uservehicleid, "document": document});

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Getdocmodel.fromJson(data!);
  }
}

class requestOffer {
  Future<Requestoffermodel> requestoffer(
      userid,
      leave_long,
      leave_lat,
      dest_long,
      dest_lat,
      godate,
      seats,
      distance,
      leavecity,
      destination,
      destaddress,
      leaveaddress,
      vehicle_type,
      ) async {
    var url = apiUrl + "/requestoffer";
    var response = await http.post(Uri.parse(url), body: {
      "userid": userid,
      "leave_long": leave_long,
      "leave_lat": leave_lat,
      "dest_long": dest_long,
      "dest_lat": dest_lat,
      "godate": godate,
      "seats": seats,
      "distance": distance,
      "leavecity": leavecity,
      "destination": destination,
      "destaddress": destaddress,
      "leaveaddress": leaveaddress,
      "vehicle_type": vehicle_type
    });

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Requestoffermodel.fromJson(data);
  }
}

class pickParceldetails {
  Future<Pickparceldetailsmodel> pickparceldetails(
      iDriverID,
      iVehicleID,
      dLeaveLong,
      dLeaveLat,
      dDestLong,
      dDestLat,
      vLeaveAddress,
      vDestAddress,
      vLeaveCity,
      vDestCity,
      eOfferPriceType,
      dOfferRate,
      vVehicleLoadCapacity,
      vVehicleDimention,
      eTermCondition,
      dtGo,
      tmGo,
      schedule_ride_by,
      schedule_ride_data) async {
    var url = apiUrl + "/pickparceldetails";
    var response = await http.post(Uri.parse(url), body: {
      "iDriverID": iDriverID,
      "iVehicleID": iVehicleID,
      "dLeaveLong": dLeaveLong,
      "dLeaveLat": dLeaveLat,
      "dDestLong": dDestLong,
      "dDestLat": dDestLat,
      "vLeaveAddress": vLeaveAddress,
      "vDestAddress": vDestAddress,
      "vLeaveCity": vLeaveCity,
      "vDestCity": vDestCity,
      "eOfferPriceType": eOfferPriceType,
      "dOfferRate": dOfferRate,
      "vVehicleLoadCapacity": vVehicleLoadCapacity,
      "vVehicleDimention": vVehicleDimention,
      "eTermCondition": eTermCondition,
      "dtGo": dtGo,
      "tmGo": tmGo,
      "schedule_ride_by": schedule_ride_by,
      "schedule_ride_data": schedule_ride_data,
    });

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Pickparceldetailsmodel.fromJson(data);
  }
}

class getvehicleOffer {
  Future<Getvehicleoffermodel> getvehicleoffer(id, type) async {
    var url = apiUrl + "/getvehicleoffer";
    http.Response response = await http.post(Uri.parse(url), body: {
      "id": id,
      "type": type,
    });

    var data = jsonDecode(response.body);
    print("Response: getVehicleOffer  " + response.body);
    return Getvehicleoffermodel.fromJson(data!);
  }
}

class updateVehicle {
  Future<Updatevehiclemodel> updatevehicle(
      uservehicleid,
      model,
      vehicleno,
      vehicletypeid,
      ac,
      isCommercial,
      ePlaceType,
      vCity_1,
      vCity_2,
      vCity_3,
      isParcel) async {
    var url = apiUrl + "/updatevehicle";
    http.Response response = await http.post(Uri.parse(url), body: {
      "uservehicleid": uservehicleid,
      "model": model,
      "vehicleno": vehicleno,
      "vehicletypeid": vehicletypeid,
      "ac": ac,
      "isCommercial": isCommercial,
      "ePlaceType": ePlaceType,
      "vCity_1": vCity_1,
      "vCity_2": vCity_2,
      "vCity_3": vCity_3,
      "isParcel": isParcel,
    });

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Updatevehiclemodel.fromJson(data!);
  }
}

class checkOtp {
  Future<Checkotpmodel> checkotp(mobilenumber, otp, id) async {
    var url = apiUrl + "/checkotp";
    var response = await http.post(Uri.parse(url), body: {
      "otp": otp,
      "mobile": mobilenumber,
      "id": id,
    });

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Checkotpmodel.fromJson(data);
  }
}

class hirevehicleAddbidrate {
  Future<HirevehicleaddbidrateModel> hirevehicleaddbidrate(
      dBiddingRate, iNotificationID) async {
    var url = apiUrl + "/hirevehicleaddbidrate";
    http.Response response = await http.post(Uri.parse(url), body: {
      "dBiddingRate": dBiddingRate,
      "iNotificationID": iNotificationID,
    });
    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return HirevehicleaddbidrateModel.fromJson(data!);
  }
}

class acceptOrrejecthirevehiclerequest {
  Future<Acceptorrejecthirevehiclerequest> acceptorrejecthirevehiclerequest(
      iNotificationID, iCancelReasonID, type) async {
    var url = apiUrl + "/acceptorrejecthirevehiclerequest";
    http.Response response = await http.post(Uri.parse(url), body: {
      "iNotificationID": iNotificationID,
      "iCancelReasonID": iCancelReasonID,
      "type": type,
    });
    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Acceptorrejecthirevehiclerequest.fromJson(data!);
  }
}

class passengerConfirmhirevehiclerequest {
  Future<PassengerconfirmhirevehiclerequestModel>
  passengerconfirmhirevehiclerequest(iPassengerID) async {
    var url = apiUrl + "/passengerconfirmhirevehiclerequest";
    http.Response response =
    await http.post(Uri.parse(url), body: {"iPassengerID": iPassengerID});

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return PassengerconfirmhirevehiclerequestModel.fromJson(data!);
  }
}

class Walletreq {
  Future<WalletreqModel> walletreq(userid, redeem_req, redeem_amt) async {
    var url = apiUrl + "/walletreq";
    http.Response response = await http.post(Uri.parse(url), body: {
      "userid": userid,
      "redeem_req": redeem_req,
      "redeem_amt": redeem_amt,
    });
    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return WalletreqModel.fromJson(data!);
  }
}

class Newoffer {
  Future<Newoffermodel> newoffer(
      uservehicleid,
      userid,
      leave_long,
      leave_lat,
      dest_long,
      dest_lat,
      stop_long1,
      stop_lat1,
      godate,
      gotime,
      seats,
      distance,
      leavetostop,
      stoptodestination,
      offertype,
      leave,
      destination,
      stop1,
      destaddress,
      leaveaddress,
      stopaddress,
      offerprice,
      offerprice_type,
      schedule_ride_by,
      schedule_ride_data) async {
    var url = apiUrl + "/newoffer";
    var response = await http.post(Uri.parse(url), body: {
      "uservehicleid": uservehicleid,
      "userid": userid,
      "leave_long": leave_long,
      "leave_lat": leave_lat,
      "dest_long": dest_long,
      "dest_lat": dest_lat,
      "stop_long1": stop_long1,
      "stop_lat1": stop_lat1,
      "godate": godate,
      "gotime": gotime,
      "seats": seats,
      "distance": distance,
      "leavetostop": leavetostop,
      "stoptodestination": stoptodestination,
      "offertype": offertype,
      "leave": leave,
      "destination": destination,
      "stop1": stop1,
      "destaddress": destaddress,
      "leaveaddress": leaveaddress,
      "stopaddress": stopaddress,
      "offerprice": offerprice,
      "offerprice_type": offerprice_type,
      "schedule_ride_by": schedule_ride_by,
      "schedule_ride_data": schedule_ride_data
    });

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Newoffermodel.fromJson(data);
  }
}

class Sendparcel {
  Future<Sendparcelmodel> sendparcel(
      tFromLocation,
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
      vItemPhoto,
      iSenderID,
      imagepath) async {
    var url = apiUrl + "/sendparcel";
    var request = http.MultipartRequest("POST",Uri.parse(url));
    request.fields['tFromLocation'] = tFromLocation;
    request.fields['tToLocation'] = tToLocation;
    request.fields['vFromCity'] = vFromCity;
    request.fields['vToCity'] = vToCity;
    request.fields['dFromLocationLat'] = dFromLocationLat;
    request.fields['dFromLocationLong'] = dFromLocationLong;
    request.fields['dToLocationLat'] = dToLocationLat;
    request.fields['dToLocationLong'] = dToLocationLong;
    request.fields['tItemName'] = tItemName;
    request.fields['dItemValue'] = dItemValue;
    request.fields['dItemWeight'] = dItemWeight;
    request.fields['eItemSize'] = eItemSize;
    request.fields['eWhoWillMeetDriverAtPickupLocation'] = eWhoWillMeetDriverAtPickupLocation;
    request.fields['vSenderName'] = vSenderName;
    request.fields['vSenderMobile'] = vSenderMobile;
    request.fields['eWhoWillMeetDriverAtDeliveryLocation'] = eWhoWillMeetDriverAtDeliveryLocation;
    request.fields['vReceiverName'] = vReceiverName;
    request.fields['vReceiverMobile'] = vReceiverMobile;
    request.fields['ePickupTime'] = ePickupTime;
    request.fields['ePickupDateTime'] = ePickupDateTime;
    request.fields['eRecieveTime'] = eRecieveTime;
    request.fields['eReceiveDateTime'] = eReceiveDateTime;
    request.fields['tItemDimention'] = tItemDimention;
    request.fields['dItemLength'] = dItemLength;
    request.fields['dItemWidth'] = dItemWidth;
    request.fields['dItemHeight'] = dItemHeight;
    request.fields['tExtraDetails'] = tExtraDetails;
    request.fields['iSenderID'] = iSenderID;
    request.fields['vItemPhoto']=vItemPhoto;

    http.MultipartFile picture = await http.MultipartFile.fromPath('userimage',imagepath,
        filename: imagepath);
    request.files.add(picture);
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var result = String.fromCharCodes(responseData);
    print(result);

    // var response = await http.post(Uri.parse(url), body: {
    //   "tFromLocation": tFromLocation,
    //   "tToLocation": tToLocation,
    //   "vFromCity": vFromCity,
    //   "vToCity": vToCity,
    //   "dFromLocationLat": dFromLocationLat,
    //   "dFromLocationLong": dFromLocationLong,
    //   "dToLocationLat": dToLocationLat,
    //   "dToLocationLong": dToLocationLong,
    //   "tItemName": tItemName,
    //   "dItemValue": dItemValue,
    //   "dItemWeight": dItemWeight,
    //   "eItemSize": eItemSize,
    //   "eWhoWillMeetDriverAtPickupLocation": eWhoWillMeetDriverAtPickupLocation,
    //   "vSenderName": vSenderName,
    //   "vSenderMobile": vSenderMobile,
    //   "eWhoWillMeetDriverAtDeliveryLocation":
    //       eWhoWillMeetDriverAtDeliveryLocation,
    //   "vReceiverName": vReceiverName,
    //   "vReceiverMobile": vReceiverMobile,
    //   "ePickupTime": ePickupTime,
    //   "ePickupDateTime": ePickupDateTime,
    //   "eRecieveTime": eRecieveTime,
    //   "eReceiveDateTime": eReceiveDateTime,
    //   "tItemDimention": tItemDimention,
    //   "dItemLength": dItemLength,
    //   "dItemWidth": dItemWidth,
    //   "dItemHeight": dItemHeight,
    //   "tExtraDetails": tExtraDetails,
    //   "vItemPhoto": vItemPhoto,
    //   "iSenderID": iSenderID,
    // });

    var data = jsonDecode(result);
    //print("Response: " + response.body);
    return Sendparcelmodel.fromJson(data);
  }
}

class Updatesendparceldetails {
  Future<Editparcelrmodel> updatesendparceldetails(
      tFromLocation,
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
      vItemPhoto,
      iSenderID,
      iSendParcelID) async {
    var url = apiUrl + "/updatesendparceldetails";
    var response = await http.post(Uri.parse(url), body: {
      "tFromLocation": tFromLocation,
      "tToLocation": tToLocation,
      "vFromCity": vFromCity,
      "vToCity": vToCity,
      "dFromLocationLat": dFromLocationLat,
      "dFromLocationLong": dFromLocationLong,
      "dToLocationLat": dToLocationLat,
      "dToLocationLong": dToLocationLong,
      "tItemName": tItemName,
      "dItemValue": dItemValue,
      "dItemWeight": dItemWeight,
      "eItemSize": eItemSize,
      "eWhoWillMeetDriverAtPickupLocation": eWhoWillMeetDriverAtPickupLocation,
      "vSenderName": vSenderName,
      "vSenderMobile": vSenderMobile,
      "eWhoWillMeetDriverAtDeliveryLocation":
      eWhoWillMeetDriverAtDeliveryLocation,
      "vReceiverName": vReceiverName,
      "vReceiverMobile": vReceiverMobile,
      "ePickupTime": ePickupTime,
      "ePickupDateTime": ePickupDateTime,
      "eRecieveTime": eRecieveTime,
      "eReceiveDateTime": eReceiveDateTime,
      "tItemDimention": tItemDimention,
      "dItemLength": dItemLength,
      "dItemWidth": dItemWidth,
      "dItemHeight": dItemHeight,
      "tExtraDetails": tExtraDetails,
      "vItemPhoto": vItemPhoto,
      "iSenderID": iSenderID,
      "iSendParcelID": iSendParcelID,
    });

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Editparcelrmodel.fromJson(data);
  }
}

class Booking {
  Future<Bookingmodel> booking(userid, offerid, bookseats,totalfare,tid,contact) async {
    var url = apiUrl + "/booking";
    http.Response response = await http.post(Uri.parse(url), body: {
      "userid": userid,
      "offerid": offerid,
      "bookseats": bookseats,
      "totalfare":totalfare,
      "tid":tid,
      "contact":contact,
    });
    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return Bookingmodel.fromJson(data!);
  }
}
class Publicprofile {
  Future<PubLicprofilemodel> publicprofile(userId) async {
    var url = apiUrl + "/getpublicprofile";
    http.Response response = await http
        .post(Uri.parse(url), body: {"userid": userId});
    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return PubLicprofilemodel.fromJson(data!);
  }
}

 class android_vertion {
  android_vertion();
  Future<android_vertion_model> getvertion(ePlatform,vVersion) async {
    var url = "http://lechalo.co.in/api/checkversion";
    http.Response response = await http.post(Uri.parse(url),

        body: {
      "ePlatform": ePlatform,
      "vVersion": vVersion,
    });

    var data = jsonDecode(response.body);
    print("Response: " + response.body);
    return android_vertion_model.fromJson(data!);
  }
}


class parcels_schedule {
  parcels_schedule();
  Future<parcelscheduleride_model> parcels_schedulelist(LeaveCity,DestCity,goDate) async {
    var url = "http://lechalo.co.in/api/parcelscheduleride";
    http.Response response = await http.post(Uri.parse(url),

        body: {
          "LeaveCity": LeaveCity,
          "DestCity": DestCity,
          "goDate": goDate,
        });

    var data = jsonDecode(response.body);
    print("parcels_schedule " + response.body);
    return parcelscheduleride_model.fromJson(data!);
  }
}

