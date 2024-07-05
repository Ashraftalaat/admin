import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routs.dart';
import 'package:admin/core/function/handlingdata.dart';
import 'package:admin/data/datasource/remote/categories_data.dart';
import 'package:admin/data/datasource/remote/items_data.dart';
import 'package:admin/data/model/categories.dart';
import 'package:admin/data/model/items.dart';
import 'package:get/get.dart';

class ItemsViewController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());
  // لتخزين الداتا اللي هتيجي من Backend
  List<Itemsmodel> data = [];
  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    // اولا التحميل بياخد وقت
    statusRequest = StatusRequest.loading;

    update();
    //getData() الموجودة في مجلد data
    var response = await itemsData.get();
    print("==================== controllr $response");
    // handlingData هتحدد نتيجة StatusRequest
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        // لو نجح ضيف كل البيانات اللي رجعت
        data.addAll(listdata.map((e) => Itemsmodel.fromJson(e)));
      } else {
        // لو مفيش بيانات
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteItems(String id, String imagename) {
    itemsData.delete({"id": id, "imagename": imagename});
    data.removeWhere((element) => element.itemsId == id);
    getData();
    update();
  }

  gotoPageEdit(Itemsmodel itemsmodel) {
    Get.toNamed(AppNamesRouts.itemsedit,arguments: {"itemsmodel":itemsmodel});
  }

// onInit مثل inistate
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  myBack() {
    Get.offAllNamed(AppNamesRouts.home);
    return Future.value(false);
  }
}
