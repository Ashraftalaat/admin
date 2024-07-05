import 'dart:io';

import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routs.dart';
import 'package:admin/core/function/handlingdata.dart';
import 'package:admin/core/function/uploadfile.dart';
import 'package:admin/data/datasource/remote/categories_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CategoriesAddController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());
  // لتخزين الداتا اللي هتيجي من Backend
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  //late StatusRequest statusRequest; تم تغييرها ب.none بسبب ظهور خطاء
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController name;
  late TextEditingController namear;
  File? file;

  chooseImage() async {
    file = await fileUploadGallery(true);
    update();
  }

  addData() async {
    if (formstate.currentState!.validate()) {
      if (file == null) Get.snackbar("Warning", "Please Chosse Photo Svg");
      // اولا التحميل بياخد وقت
      statusRequest = StatusRequest.loading;
      update();

      Map data = {
        "name": name.text,
        "namear": namear.text,
      };

      var response = await categoriesData.add(data, file!);
      print("==================== controllr $response");
      // handlingData هتحدد نتيجة StatusRequest
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppNamesRouts.categoriesview);
          //لعمل ريفرش للcategoriesview
          CategoriesViewController c = Get.find();
          c.getData();
          // List listdata = response['data'];
          // // لو نجح ضيف كل البيانات اللي رجعت
          // data.addAll(listdata.map((e) => Categoriesmodel.fromJson(e)));
        } else {
          // لو مفيش بيانات
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

// onInit مثل inistate
  @override
  void onInit() {
    name = TextEditingController();
    namear = TextEditingController();

    super.onInit();
  }
}
