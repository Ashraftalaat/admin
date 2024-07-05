import 'package:admin/core/constant/routs.dart';
import 'package:admin/core/services/serviceslocal.dart';


import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();

  logout() {
    String usersid = myServices.sharedPreferences.getString("id").toString();
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$usersid");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppNamesRouts.login);
  }
}
