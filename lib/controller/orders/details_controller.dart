import 'dart:async';

import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/function/handlingdata.dart';
import 'package:admin/data/datasource/remote/orders/details_data.dart';
import 'package:admin/data/model/cart.dart';
import 'package:admin/data/model/orders/orders.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetailsController extends GetxController {
  late OrdersModel ordersModel;
  // OrdersDetailsModel ordersDetailsModel =OrdersDetailsModel();

  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());
  // لتخزين الداتا اللي هتيجي من Backend
  List<CartModel> data = [];
  late StatusRequest statusRequest;

   Completer<GoogleMapController>? completercontroller;
  List<Marker> markers = [];
 late CameraPosition cameraPosition;
  double? lat;
  double? long;

  intialData() {
    if (ordersModel.ordersType == 0) {
      cameraPosition = CameraPosition(
        target: LatLng(double.parse(ordersModel.addressLat!.toString()),
            double.parse(ordersModel.addressLong!.toString())),
        zoom: 12.4746,
      );
      markers.add(
        Marker(
            markerId: const MarkerId("1"),
            position: LatLng(double.parse(ordersModel.addressLat!.toString()),
                double.parse(ordersModel.addressLong!.toString()))),
      );
    }
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordermodel'];
    intialData();
    getData();
    super.onInit();
  }

  getData() async {
    // اولا التحميل بياخد وقت
    statusRequest = StatusRequest.loading;
    //getData() الموجودة في مجلد data
    var response =
        await ordersDetailsData.getData(ordersModel.ordersId.toString());
    print("==================== controllr $response");
    // handlingData هتحدد نتيجة StatusRequest
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        // لو مفيش بيانات
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
