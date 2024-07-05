import 'dart:io';

import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routs.dart';
import 'package:admin/core/function/handlingdata.dart';
import 'package:admin/core/function/uploadfile.dart';
import 'package:admin/data/datasource/remote/categories_data.dart';
import 'package:admin/data/datasource/remote/items_data.dart';
import 'package:admin/data/model/categories.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


class ItemsAddController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());
  // لتخزين الداتا اللي هتيجي من Backend
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  //late StatusRequest statusRequest; تم تغييرها ب.none بسبب ظهور خطاء
  StatusRequest statusRequest = StatusRequest.none;

  List<SelectedListItem> dropdownlist = [];

  late TextEditingController dropdownname;
  late TextEditingController dropdownid;

  late TextEditingController name;
  late TextEditingController namear;

  late TextEditingController desc;
  late TextEditingController descar;
  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController discount;

  late TextEditingController catname;
  late TextEditingController catid;

  File? file;

  chooseImageCamera() async {
    file = await imageUploadCamera();
    update();
  }

  chooseImageGallery() async {
    file = await fileUploadGallery(false);
    update();
  }

  showOptionImage() {
    showbottomMenu(chooseImageCamera, chooseImageGallery);
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
        "desc": desc.text,
        "descar": descar.text,
        "count": count.text,
        "price": price.text,
        "discount": discount.text,
        "datenow" :DateTime.now().toString(),
        "catid": catid.text,
      };

      var response = await itemsData.add(data, file!);
      print("==================== controllr $response");
      // handlingData هتحدد نتيجة StatusRequest
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppNamesRouts.itemsview);
          //لعمل ريفرش للcategoriesview
          ItemsViewController c = Get.find();
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

  getCategories() async {
    CategoriesData categoriesData = CategoriesData(Get.find());

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
        List<Categoriesmodel> data = [];
        List listdata = response['data'];
        // لو نجح ضيف كل البيانات اللي رجعت
        data.addAll(listdata.map((e) => Categoriesmodel.fromJson(e)));

        for (var i = 0; i < data.length; i++) {
          dropdownlist.add(SelectedListItem(
              name: data[i].categoriesName.toString(),
              value: data[i].categoriesId.toString()));
        }
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
    getCategories();
    dropdownname = TextEditingController();
    dropdownid = TextEditingController();

    name = TextEditingController();
    namear = TextEditingController();

    desc = TextEditingController();
    descar = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();

    catname = TextEditingController();
    catid = TextEditingController();
    super.onInit();
  }
// عملناها في ملف Function
//   showDropDown(context) {
//     DropDownState(
//       DropDown(
//         bottomSheetTitle: const Text(
//           "title",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 20.0,
//           ),
//         ),
//         submitButtonChild: const Text(
//           'Done',
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         data: [SelectedListItem(name: "A"), SelectedListItem(name: "B")],
//         selectedItems: (List<dynamic> selectedList) {
//           // وضعنا القيمة اللي اخترناها
//           SelectedListItem selectedListItem = selectedList[0];
//           dropdownname.text = selectedListItem.name;
//           // showSnackBar(list.toString());
//         },
//         // enableMultipleSelection: true,
//       ),
//     ).showModal(context);
//   }
}
