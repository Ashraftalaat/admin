import 'package:admin/core/constant/routs.dart';
import 'package:admin/core/services/serviceslocal.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// الصلاحيات

class MyMiddleWare extends GetMiddleware {
  MyServices myServices = Get.find();

  @override
// كلما قلت زادت الاولوية
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    //هيدخل على الهوم غلي طول المخزنة بالشيرد
    if (myServices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: AppNamesRouts.home);
    }
    if (myServices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: AppNamesRouts.login);
    }
  }
}
