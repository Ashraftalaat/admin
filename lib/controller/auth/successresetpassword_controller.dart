

import 'package:admin/core/constant/routs.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController {
  checkCode();
  gotoIogin();
}

class  SuccessResetPasswordControllerImp extends  SuccessResetPasswordController {
  late String verifycode;

  @override
  checkCode() {}

  @override
  gotoIogin() {
    Get.offAllNamed(AppNamesRouts.login);
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
