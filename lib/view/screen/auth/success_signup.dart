import 'package:admin/controller/auth/successsignup_controller.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/view/widget/auth/custombuttonauth.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUp extends StatefulWidget {
  const SuccessSignUp({super.key});

  @override
  State<SuccessSignUp> createState() => _SuccessSignUpState();
}

class _SuccessSignUpState extends State<SuccessSignUp> {
  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          margin: const EdgeInsets.only(top: 25),
          child: Text(
            "32".tr,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColor.grey),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          const Center(
            child: Icon(
              Icons.check_circle_outline,
              size: 200,
              color: AppColor.primaryColor,
            ),
          ),
          const SizedBox(height: 50),
          Text(
            "37".tr,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 50),
          Text(
            "28".tr,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 200),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            width: double.infinity,
            child: CustomButtonAuth(
              text: "31".tr,
              onPressed: () {
                controller.gotoPagehomescreen();
              },
            ),
          ),
        ],
      ),
    );
  }
}
