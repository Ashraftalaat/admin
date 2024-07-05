
import 'package:admin/controller/auth/verifycodesignupcontroller.dart';
import 'package:admin/core/class/handingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/view/widget/auth/customtextbodyauth.dart';
import 'package:admin/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifycodeSignUp extends StatelessWidget {
  const VerifycodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          margin: const EdgeInsets.only(top: 25),
          child: Text(
            "Verification code",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColor.grey),
          ),
        ),
      ),
      body: GetBuilder<VerifyCodeSignUpControllerImp>(
        builder: (controller) => HandingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            //  margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
            child: ListView(
              children: [
                const SizedBox(height: 40),
                const CustomTextTitleAuth(texttitle: "Check Code"),
                const SizedBox(height: 30),
                CustomTextBodyAuth(
                    textbody:
                        "Please Enter The Digit Code Sent To ${controller.email}"),
                const SizedBox(height: 45),
                OtpTextField(
                  fieldWidth: 50,
                  borderRadius: BorderRadius.circular(20),
                  numberOfFields: 5,
                  borderColor: const Color(0xFF512DA8),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    controller.gotoSuccessSignUp(verificationCode);
                  }, // end onSubmit
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    controller.reSend();
                  },
                  child: const Center(
                    child: Text(
                      "ReSend",
                      style: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
