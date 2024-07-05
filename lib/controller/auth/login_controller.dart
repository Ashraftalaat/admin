import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routs.dart';
import 'package:admin/core/function/handlingdata.dart';
import 'package:admin/core/services/serviceslocal.dart';
import 'package:admin/data/datasource/remote/auth/login_data.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  gotoSignUp();
  gotoforgetpassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  LoginData loginData = LoginData(Get.find());

  late TextEditingController email;
  late TextEditingController password;
  late bool isShowpassword = true;

  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();

  showPassword() {
    isShowpassword = isShowpassword == true ? false : true;
    update();
  }

  @override
  gotoSignUp() {
    Get.toNamed(AppNamesRouts.signUp);
  }

  @override
  login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      // اولا التحميل بياخد وقت
      statusRequest = StatusRequest.loading;
      update();
      //postData() الموجودة في مجلد data
      var response = await loginData.postData(email.text, password.text);
      print("==================== controllr $response");
      // handlingData هتحدد نتيجة StatusRequest
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['admin_approve'] == 1) {
            myServices.sharedPreferences
                .setString("id", response['data']['admin_id'].toString());
            String usersid =
                myServices.sharedPreferences.getString("id").toString();
            myServices.sharedPreferences.setString(
                "username", response['data']['admin_name'].toString());
            myServices.sharedPreferences
                .setString("email", response['data']['admin_email'].toString());
            myServices.sharedPreferences
                .setString("phone", response['data']['admin_phone'].toString());
            myServices.sharedPreferences.setString("step", "2");

            // اشعار لمستخدم واحد
            FirebaseMessaging.instance.subscribeToTopic("admin$usersid");
            // اشعار لكل المستخدمين
            FirebaseMessaging.instance.subscribeToTopic("admin");

            Get.offNamed(AppNamesRouts.home);
          } else {
            Get.toNamed(AppNamesRouts.verifycodesignup,
                arguments: {"email": email.text});
          }
        } else {
          Get.defaultDialog(
              title: "Warning", middleText: "Password Or Email Not Correct");
          // لو مفيش بيانات
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  gotoforgetpassword() {
    Get.toNamed(AppNamesRouts.forgetpassword);
  }
}
