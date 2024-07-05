

import 'package:admin/core/services/serviceslocal.dart';
import 'package:get/get.dart';

translateDataBase(columnar, columnen) {
  MyServices myServices = Get.find();

  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return columnar;
  } else {
    return columnen;
  }
}
