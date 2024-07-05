import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/function/handlingdata.dart';
import 'package:admin/data/datasource/remote/test_data.dart';


import 'package:get/get.dart';

class TextController extends GetxController {
  TestData textdata = TestData(Get.find());
  // لتخزين الداتا اللي هتيجي من Backend
  List data = [];
  late StatusRequest statusRequest;

  getData() async {
    // اولا التحميل بياخد وقت
    statusRequest = StatusRequest.loading;
    //getData() الموجودة في مجلد data
    var response = await textdata.getData();
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
// onInit مثل inistate
  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
