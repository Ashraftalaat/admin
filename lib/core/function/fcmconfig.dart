

import 'package:admin/controller/orders/pending_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

// يجب اعطاء Permission حتي لايحدث مشاكل
requestPermitionNotification() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

// لارسال اشعار من backendللتطبيق عندما يكون مفتوح
fcmConfig() {
  // onMessage هي عبارة عن stream بنستخدم listen
  FirebaseMessaging.onMessage.listen((message) {
    print("++++++++Notification");
    print(message.notification!.title);
    print(message.notification!.body);
    //باكدج لاظهار الصوت
    FlutterRingtonePlayer().playNotification();
// الرسال هيتم استخدام Get.snackbar الموجودة في GetX ....او مكتبة local Notification
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    refreshPageNotification(message.data);
  });
}


//لتحديث صفحة  order في نفس الوقت اللي اتقبل فيه الطلب
refreshPageNotification(data) {
  print("====================== Page id");
  print("${data['pageid']}");
  print("====================== Page Name");
  print("${data['pagename']}");
// نقف في نفس صفحة order لجلب route
  print("====================== Current Route");
  print(Get.currentRoute);

  if (Get.currentRoute == "/pending" &&
      data['pagename'] == "refreshorderpending") {
        //لم نضع Get.put عشان الصفحة محقونة
    OrdersPendingController controller = Get.find();
    //فانكشن لتحديث البيانات
    controller.refreshOrder();
  }
}


//   هناك ثلاثة انواع لل  Stream وال  Real time

// افضل نوعين للشات
// firebase + stream
//Socket io  "Node js"

// للتحديث اسهل طريقة
// Notification refresh
