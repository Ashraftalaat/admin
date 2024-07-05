import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import "package:http/http.dart" as http;

//لرسم خط بين نقطتين علي الخريطة
 String keyGoogleMap = "AIzaSyDCBLFSe6DSsO4jW8PX0caS1MJMrPgm_zY";


Future getPolyLine(lat, long, destlat, destlong) async {
 
//Coordinates = co الاحداثيات
  List<LatLng> polylineco = [];

  PolylinePoints polylinePoints = PolylinePoints();

  Set<Polyline> polylineset = {};


  String url =
      "https://maps.googleapis.com/maps/api/directions/json?origin=$lat,$long&destination=$destlat,$destlong&key=AIzaSyDCBLFSe6DSsO4jW8PX0caS1MJMrPgm_zY";

//هنرسل url ونستقبل الرد في المتغيرresponse
  var response = await http.post(Uri.parse(url));

//هنفك body المشفر
  var responsebody = jsonDecode(response.body);

// الحصول علي points
  var point = responsebody['routes'][0]['overview_polyline']['points'];

// هنخزن point في لاستة result من نوعPointLatLng
  List<PointLatLng> result = polylinePoints.decodePolyline(point);

  if (result.isNotEmpty) {
    result.forEach((PointLatLng pointLatLng) {
      //polylinecoهي عبارة عن لاستة من الاحداثيات بين العميل ومندوب التوصيل
      polylineco.add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
    });
  }

//  بعد منعرفpolyline
  Polyline polyline = Polyline(
      polylineId: PolylineId("ashraf"),
      color: Colors.blue,
      width: 5,
      points: polylineco);

  // هنضيفه هنا
  polylineset.add(polyline);

  return polylineset;
}
//  "https://maps.googleapis.com/maps/api/directions/json?origin=30.058464,31.282220&destination=30.046949,31.272859&key=AIzaSyDCBLFSe6DSsO4jW8PX0caS1MJMrPgm_zY"