
import 'package:admin/controller/auth/forgetpassword/forgetpassword_controller.dart';
import 'package:admin/core/class/handingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/function/vaildinput.dart';
import 'package:admin/view/widget/auth/custombuttonauth.dart';
import 'package:admin/view/widget/auth/customtextbodyauth.dart';
import 'package:admin/view/widget/auth/customtextformauth.dart';
import 'package:admin/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          margin: const EdgeInsets.only(top: 25),
          child: Text(
            "14".tr,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColor.grey),
          ),
        ),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
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
                  CustomTextTitleAuth(texttitle: "27".tr),
                  const SizedBox(height: 30),
                  CustomTextBodyAuth(textbody: "29".tr),
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
                  const SizedBox(height: 45),
                  CustomButtonAuth(
                    text: "30".tr,
                    onPressed: () {
                      controller.checkemail();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
