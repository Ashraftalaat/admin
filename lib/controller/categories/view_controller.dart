import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routs.dart';
import 'package:admin/core/function/handlingdata.dart';
import 'package:admin/data/datasource/remote/categories_data.dart';
import 'package:admin/data/model/categories.dart';
import 'package:get/get.dart';

class CategoriesViewController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());
  // لتخزين الداتا اللي هتيجي من Backend
  List<Categoriesmodel> data = [];
  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    // اولا التحميل بياخد وقت
    statusRequest = StatusRequest.loading;

    update();
    //getData() الموجودة في مجلد data
    var response = await categoriesData.get();
    print("==================== controllr $response");
    // handlingData هتحدد نتيجة StatusRequest
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        // لو نجح ضيف كل البيانات اللي رجعت
        data.addAll(listdata.map((e) => Categoriesmodel.fromJson(e)));
      } else {
        // لو مفيش بيانات
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteCategories(String id, String imagename) {
    categoriesData.delete({"id": id, "imagename": imagename});
    data.removeWhere((element) => element.categoriesId == id);
    getData();
    update();
  }

  gotoPageEdit(Categoriesmodel categoriesmodel) {
    Get.toNamed(AppNamesRouts.categoriesedit,arguments: {"categoriesmodel":categoriesmodel});
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
