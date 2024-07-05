import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routs.dart';
import 'package:admin/core/function/handlingdata.dart';
import 'package:admin/data/datasource/remote/auth/verifycodesignup_data.dart';


import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  gotoSuccessSignUp(String verificationCode);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
 // late String verifycode;
  String? email;
  StatusRequest statusRequest = StatusRequest.none;

  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());

  @override
  checkCode() {}

  @override
  gotoSuccessSignUp(String verificationCode) async {
    // اولا التحميل بياخد وقت
    statusRequest = StatusRequest.loading;
    update();
    //postData() الموجودة في مجلد data
    var response = await verifyCodeSignUpData.postData(email!, verificationCode);
    
    // handlingData هتحدد نتيجة StatusRequest
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppNamesRouts.successsignup);
      } else {
        Get.defaultDialog(
            title: "Warning",
            middleText: "Verify Code Not Correct");
        // لو مفيش بيانات
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  reSend(){
     verifyCodeSignUpData.reSendData(email!);
  }
}
