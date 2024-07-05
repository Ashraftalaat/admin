import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> initial() async {
    //تن اضافة هذه الاكواد لحدوث خطاء null لملف google-services.json
    //ويوجد فيديو توضيحي للحل
    Platform.isAndroid
        ? await Firebase.initializeApp(
            options: const FirebaseOptions(
            apiKey: 'AIzaSyDaEW3iTgu79MsD2fKODK9SipBmmL35rY8',
            appId: '1:494350034894:android:444434b243eac6b5752d9f',
            messagingSenderId: '494350034894',
            projectId: 'ecommerce-1bbff',
          ))
        : await Firebase.initializeApp();

    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().initial());
}
