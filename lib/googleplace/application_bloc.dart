import 'package:flutter/material.dart';
import 'package:lechalo/googleplace/place_search.dart';
import 'package:lechalo/googleplace/place_services.dart';
class ApplicationBlock with  ChangeNotifier{
  final placesService=PlacesService();
  late List<PlaceSearch> searchResult;

  searchPlaces(String SearchTerm) async{
    searchResult = await placesService.getAutoComplate(SearchTerm);

    notifyListeners();
  }

}