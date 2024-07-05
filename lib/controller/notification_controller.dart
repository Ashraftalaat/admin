import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/function/handlingdata.dart';
import 'package:admin/core/services/serviceslocal.dart';
import 'package:admin/data/datasource/remote/notification_data.dart';



import 'package:get/get.dart';

class NotificationController extends GetxController {
  NotificationData notificationData = NotificationData(Get.find());
  // لتخزين الداتا اللي هتيجي من Backend
  List data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  getData() async {
    // اولا التحميل بياخد وقت
    statusRequest = StatusRequest.loading;
    //getData() الموجودة في مجلد data
    var response = await notificationData
        .getData(myServices.sharedPreferences.getString("id").toString());
    print("==================== controllr $response");
    // handlingData هتحدد نتيجة StatusRequest
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // لو نجح ضيف كل البيانات اللي رجعت
        data.addAll(response['data']);
      } else {
        // لو مفيش بيانات
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
