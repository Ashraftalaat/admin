import 'package:admin/core/constant/routs.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {
  gotoPagehomescreen();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  gotoPagehomescreen() {
    Get.offAllNamed(AppNamesRouts.home);
  }
}
