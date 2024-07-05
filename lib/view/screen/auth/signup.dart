import 'package:admin/controller/auth/signup_controller.dart';
import 'package:admin/core/class/handingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/function/alertexitapp.dart';
import 'package:admin/core/function/vaildinput.dart';
import 'package:admin/view/widget/auth/custombuttonauth.dart';
import 'package:admin/view/widget/auth/customtextbodyauth.dart';
import 'package:admin/view/widget/auth/customtextformauth.dart';
import 'package:admin/view/widget/auth/customtextgotosigninorsignup.dart';
import 'package:admin/view/widget/auth/customtexttitleauth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    // هنضع هناGet.LazyPut لحذف الميموري
    // ويمكن ازالة Get.lazyPut من هنا وحقنها من خلال binding في main
    // Get.lazyPut(() => SignUpControllerImp());
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          margin: const EdgeInsets.only(top: 25),
          child: Text(
            "17".tr,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColor.grey),
          ),
        ),
      ),
      // استخدمنا GetBuilder عشان نقدر نستخدم controller
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          alertExitApp();
        },
        child: GetBuilder<SignUpControllerImp>(
          builder: (controller) => HandingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              //  margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
              child: Form(
                key: controller.formstate,
                child: ListView(
                  children: [
                    const SizedBox(height: 40),
                    CustomTextTitleAuth(texttitle: "10".tr),
                    const SizedBox(height: 30),
                    CustomTextBodyAuth(textbody: "24".tr),
                    const SizedBox(height: 25),
                    CustomTextFormAuth(
                        isNumber: false,
                        vaild: (val) {
                          return vaildInput(val!, 5, 30, "username");
                        },
                        mycontroller: controller.username,
                        texthint: "23".tr,
                        textlabel: "20".tr,
                        iconData: Icons.person_2_outlined),
                    const SizedBox(height: 30),
                    CustomTextFormAuth(
                        isNumber: false,
                        vaild: (val) {
                          return vaildInput(val!, 5, 100, "email");
                        },
                        mycontroller: controller.email,
                        texthint: "12".tr,
                        textlabel: "18".tr,
                        iconData: Icons.email_outlined),
                    const SizedBox(height: 30),
                    CustomTextFormAuth(
                        isNumber: true,
                        vaild: (val) {
                          return vaildInput(val!, 5, 11, "phone");
                        },
                        mycontroller: controller.phone,
                        texthint: "22".tr,
                        textlabel: "21".tr,
                        iconData: Icons.phone_android),
                    const SizedBox(height: 30),
                    CustomTextFormAuth(
                        isNumber: false,
                        vaild: (val) {
                          return vaildInput(val!, 5, 30, "password");
                        },
                        mycontroller: controller.password,
                        texthint: "13".tr,
                        textlabel: "19".tr,
                        iconData: Icons.lock_outline),
                    const SizedBox(height: 60),
                    CustomButtonAuth(
                      text: "17".tr,
                      onPressed: () {
                        controller.signUp();
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomTextGoToSigninOrSignup(
                      textone: "25".tr,
                      texttwo: "9".tr,
                      onTap: () {
                        controller.gotoSignIn();
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
