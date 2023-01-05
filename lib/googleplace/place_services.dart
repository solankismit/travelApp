import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:lechalo/googleplace/placeModel.dart';
import 'dart:convert' as convert;
import 'package:lechalo/googleplace/place_search.dart';
class PlacesService{
  var data;
  final key ='AIzaSyAVK-Gg1P-Z--LlvIiH5zS4i34eOql4ulk';

  Future<List<PlaceSearch>> getAutoComplate (String search) async{
    var url ='https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=(cities)&key=$key&language=en';
    var response = await http.post(Uri.parse(url));
    var json = convert.jsonDecode(response.body);

    var jsonResult =json['predictions'] as List;

    return jsonResult.map((place) =>PlaceSearch.fromJson(place)).toList();


  }

  Future<Place> getlatlong (String placeid) async{
    var url ='https://maps.googleapis.com/maps/api/place/details/json?key=$key&place_id=$placeid';
    var response = await http.post(Uri.parse(url));
    var json = convert.jsonDecode(response.body);

    var jsonResult =json['result'] as Map<String,dynamic>;

    return Place.fromJson(jsonResult);


  }

}