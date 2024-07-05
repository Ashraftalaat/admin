

import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routs.dart';
import 'package:admin/core/function/handlingdata.dart';
import 'package:admin/data/datasource/remote/auth/signup_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();
  gotoSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  StatusRequest statusRequest = StatusRequest.none;

  SignUpData signupdata = SignUpData(Get.find());
  // لتخزين الداتا اللي هتيجي من Backend
  List data = [];

  @override
  gotoSignIn() {
    Get.offNamed(AppNamesRouts.login);
  }

  @override
  signUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      // اولا التحميل بياخد وقت
      statusRequest = StatusRequest.loading;
      update();
      //postData() الموجودة في مجلد data
      var response = await signupdata.postData(
          username.text, password.text, email.text, phone.text);
      print("==================== controllr $response");
      // handlingData هتحدد نتيجة StatusRequest
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // لو نجح ضيف كل البيانات اللي رجعت
          //لاكن ليس لدينا بيانات لاننا بنسجل حساب جديد فهنحذفها
          // data.addAll(response['data']);
          Get.offNamed(AppNamesRouts.verifycodesignup,
              arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: "Warning",
              middleText: "Phone Number Or Email already Exists ");
          // لو مفيش بيانات
          statusRequest = StatusRequest.failure;
        }
      }
      update();

      //لحذف البيانات وهذا الكلاس من الميموري
      //عن طريق هذا الكود "وهذا في التحديث الجديد  فقط"
      //package GetX
      // Get.delete<SignUpControllerImp>();
      //يوجد طريقة اخري من خلال Get.LazyPut(()=> )
    } else {}
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();

    super.dispose();
  }
}
