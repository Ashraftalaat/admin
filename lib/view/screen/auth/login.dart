
import 'package:admin/controller/auth/login_controller.dart';
import 'package:admin/core/class/handingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/function/alertexitapp.dart';
import 'package:admin/core/function/vaildinput.dart';
import 'package:admin/view/widget/auth/custombuttonauth.dart';
import 'package:admin/view/widget/auth/customtextbodyauth.dart';
import 'package:admin/view/widget/auth/customtextformauth.dart';
import 'package:admin/view/widget/auth/customtextgotosigninorsignup.dart';
import 'package:admin/view/widget/auth/customtexttitleauth.dart';
import 'package:admin/view/widget/auth/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          margin: const EdgeInsets.only(top: 25),
          child: Text(
            "9".tr,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColor.grey),
          ),
        ),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          alertExitApp();
        },
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => HandingDataRequest(
            statusRequest: controller.statusRequest,
            //controller.statusRequest ==
            //         StatusRequest.loading
            //     ? const Center(
            //         child: Text("loading........."),
            //       )
            widget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              //  margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
              child: Form(
                key: controller.formstate,
                child: ListView(
                  children: [
                    const LogoAuth(),
                    CustomTextTitleAuth(texttitle: "10".tr),
                    const SizedBox(height: 30),
                    CustomTextBodyAuth(textbody: "11".tr),
                    const SizedBox(height: 25),
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
                    GetBuilder<LoginControllerImp>(
                      builder: (controller) => CustomTextFormAuth(
                          obscuretext: controller.isShowpassword,
                          onTapicon: () {
                            controller.showPassword();
                          },
                          isNumber: false,
                          vaild: (val) {
                            return vaildInput(val!, 5, 30, "password");
                          },
                          mycontroller: controller.password,
                          texthint: "13".tr,
                          textlabel: "19".tr,
                          iconData: Icons.lock_outline),
                    ),
                    const SizedBox(height: 45),
                    InkWell(
                      onTap: () {
                        controller.gotoforgetpassword();
                      },
                      child: Text(
                        "14".tr,
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomButtonAuth(
                      text: "9".tr,
                      onPressed: () {
                        controller.login();
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomTextGoToSigninOrSignup(
                      textone: "16".tr,
                      texttwo: "17".tr,
                      onTap: () {
                        controller.gotoSignUp();
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
