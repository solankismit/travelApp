import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GeolocatorService{
  final Geolocator geo = Geolocator();

  Stream<Position> getCurrentLocation(){
    print('Before getStream');
    return Geolocator.getPositionStream();
  }

  Future<Position> getInitialLocation() async{
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();
    if( permission== LocationPermission.denied){
      //Flutter toast here to show user that location permission is denied
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Location Permission Denied')));
      return Future.error('Location permission denied');
    }
    return Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
}