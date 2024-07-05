import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/function/handlingdata.dart';
import 'package:admin/core/services/serviceslocal.dart';
import 'package:admin/data/datasource/remote/orders/archive_data.dart';
import 'package:admin/data/model/orders/orders.dart';


import 'package:get/get.dart';

class OrdersArchiveController extends GetxController {
  List<OrdersModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  OrdersArchiveData ordersArchiveData = OrdersArchiveData(Get.find());

  getOrders() async {
    // لعدم اضافة الداتا مرة اخري عند الضغط علي  changeCat(val, catval)
    data.clear();
    // اولا التحميل بياخد وقت
    statusRequest = StatusRequest.loading;
    update();
    //getData() الموجودة في مجلد data
    var response = await ordersArchiveData
        .getData();
    print("==================== controllr $response");
    // handlingData هتحدد نتيجة StatusRequest
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response["data"];
        // لو نجح ضيف كل البيانات اللي رجعت
        data.addAll(listData.map((e) => OrdersModel.fromJson(e)));
      } else {
        // لو مفيش بيانات
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

//  فانكشن لتحديث البيانات
  refreshOrder() {
    getOrders();
  }

  String printOrdersType(String val) {
    if (val == "0") {
      return "delivery";
    } else {
      return "recive";
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash On Delivery";
    } else {
      return "Payment Card";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Pending Approval";
    } else if (val == "1") {
      return "The Order is bening prepared";
    } else if (val == "2") {
      return "Ready to picked up by delivery man";
    } else if (val == "3") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  // submitRating(String ordersid, double rating, String comment) async {
  //   // لعدم اضافة الداتا مرة اخري عند الضغط علي  changeCat(val, catval)
  //   data.clear();
  //   // اولا التحميل بياخد وقت
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   //getData() الموجودة في مجلد data
  //   var response =
  //       await ordersArchiveData.ratingData(ordersid, comment, rating);
  //   print("==================== controllr $response");
  //   // handlingData هتحدد نتيجة StatusRequest
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == "success") {
  //       getOrders();
  //     } else {
  //       // لو مفيش بيانات
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }
  //   update();
  // }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
