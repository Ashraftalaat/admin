import 'dart:async';

import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/function/getdecodepolyline.dart';
import 'package:admin/data/model/orders/orders.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingController extends GetxController {
  StreamSubscription<Position>? positionStream;
  GoogleMapController? gmc;
//  GoogleMapController? gmc;
  List<Marker> markers = [];
  CameraPosition? cameraPosition;
  double? destlat;
  double? destlong;
  double? currentlat;
  double? currenlong;

  Set<Polyline> polylineset = {};

  late OrdersModel ordersModel;
  StatusRequest statusRequest = StatusRequest.success;
  getCurrentLocation() {
    cameraPosition = CameraPosition(
      target: LatLng(double.parse(ordersModel.addressLat.toString()),
          double.parse(ordersModel.addressLong.toString())),
      zoom: 12.4746,
    );
    // اضافة نقطة موقع العميل
    markers.add(
      Marker(
          markerId: const MarkerId("dest"),
          position: LatLng(double.parse(ordersModel.addressLat!.toString()),
              double.parse(ordersModel.addressLong!.toString()))),
    );
    positionStream = Geolocator.getPositionStream().listen(
      (Position? position) {
        print("=============== position ===============");
        currentlat = position!.latitude;
        currentlat = position.longitude;
        print(position!.latitude);
        print(position.longitude);
        // لتحريك الكاميرا علي مكان نقطة الموقع
        if (gmc != null) {
          gmc!.animateCamera(CameraUpdate.newLatLng(
              LatLng(position.latitude, position.longitude)));
        }

        markers.removeWhere((element) => element.markerId.value == "current");
        // اضافة نقطة موقع مندوب التوصيل
        markers.add(
          Marker(
            markerId: const MarkerId("current"),
            position: LatLng(
              position.latitude,
              position.longitude,
            ),
          ),
        );
        update();
      },
    );
  }

  initPolyline() async {
    destlat = double.parse(ordersModel.addressLat!.toString());
    destlong = double.parse(ordersModel.addressLong!.toString());
    await Future.delayed(const Duration(seconds: 1));
    polylineset = await getPolyLine(currentlat, currenlong, destlat, destlong);
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordermodel'];
    getCurrentLocation();
    initPolyline();
    super.onInit();
  }

  // حتي لايحدث خطاء اثناء الرجوع مثل dispose
  @override
  void onClose() {
    positionStream!.cancel();
    gmc!.dispose();
    super.onClose();
  }
}
