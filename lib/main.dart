import 'package:admin/bindings/binding.dart';
import 'package:admin/core/localization/changelocale.dart';
import 'package:admin/core/localization/translation.dart';
import 'package:admin/core/services/serviceslocal.dart';
import 'package:admin/routs.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      locale: controller.language,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      //  title: 'Flutter Demo',
        theme: controller.appTheme,
      //وضعناها في routes كقيمة افتراضية تظهر في اول البرنامج "/"
      // home: const Language(),
      // هنستخدم Getpage بدل منها لاننا نستخدم GetX
      // routes: routes,
      getPages: routes,
      //تم حقن  binding في المشروع كله
      initialBinding: MyBinding(),
    );
  }
}
