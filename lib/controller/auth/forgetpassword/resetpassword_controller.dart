import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routs.dart';
import 'package:admin/core/function/handlingdata.dart';
import 'package:admin/data/datasource/remote/forgetpassword/resetpassword_data.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  gotoSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey();

  late TextEditingController password;
  late TextEditingController rePassword;

  StatusRequest statusRequest = StatusRequest.none;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  String? email;
  @override
  resetPassword() {}

  @override
  gotoSuccessResetPassword() async {
    if (password.text != rePassword.text) {
      return Get.defaultDialog(
          title: "Warning", middleText: "Password Not Match");
    }
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      // اولا التحميل بياخد وقت
      statusRequest = StatusRequest.loading;
      update();
      //postData() الموجودة في مجلد data
      var response = await resetPasswordData.postData(email!, password.text);
      print("==================== controllr $response");
      // handlingData هتحدد نتيجة StatusRequest
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppNamesRouts.successresetpassword);
        } else {
          Get.defaultDialog(title: "Warning", middleText: "Try Agian");
          // لو مفيش بيانات
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }
}
