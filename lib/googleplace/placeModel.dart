import 'package:lechalo/googleplace/geometryModel.dart';

class Place{
  final Geometry geometry;

  Place({required this.geometry,});
  factory Place.fromJson(Map<String,dynamic> parsedJson){
    return Place(geometry: Geometry.fromJson(parsedJson['geometry']));
  }
}