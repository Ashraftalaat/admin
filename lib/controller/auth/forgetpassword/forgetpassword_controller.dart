import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routs.dart';
import 'package:admin/core/function/handlingdata.dart';
import 'package:admin/data/datasource/remote/forgetpassword/checkemail_data.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  // late TextEditingController phone;

  StatusRequest statusRequest = StatusRequest.none;
  CheckEmailData checkEmailData = CheckEmailData(Get.find());

  @override
  checkemail() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      // اولا التحميل بياخد وقت
      statusRequest = StatusRequest.loading;
      update();
      //postData() الموجودة في مجلد data
      var response = await checkEmailData.postData(email.text);
      print("==================== controllr $response");
      // handlingData هتحدد نتيجة StatusRequest
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppNamesRouts.verifycode,
              arguments: {"email": email.text});
        } else {
          Get.defaultDialog(title: "Warning", middleText: " Email Not Found ");
          // لو مفيش بيانات
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    email = TextEditingController();
    // phone = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    // phone.dispose();

    super.dispose();
  }
}
