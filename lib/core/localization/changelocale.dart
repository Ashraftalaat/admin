import 'package:admin/core/constant/themedata.dart';
import 'package:admin/core/function/fcmconfig.dart';
import 'package:admin/core/services/serviceslocal.dart';


import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();
  ThemeData appTheme = themeEnglish;

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  requestPerLocation() async {
    //نسخ البيرمشن من موقع Geolocator
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return const GetSnackBar(
        title: "تنبية",
        message: "الرجاء تشغيل خدمة تحديد الموقع",
      );
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return const GetSnackBar(
          title: "تنبية",
          message: "الرجاء اعطاء صلاحية الوصول للموقع",
        );
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return const GetSnackBar(
        title: "تنبية",
        message: "لايمكن استخدام التطبيق بدون الموقع",
      );
    }
  }

  @override
  void onInit() {
   
    requestPermitionNotification();
    fcmConfig();

    requestPerLocation();
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      //لغة الجهاز
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
