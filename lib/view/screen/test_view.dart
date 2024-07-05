import 'package:admin/controller/test_controller.dart';
import 'package:admin/core/class/handingdataview.dart';
import 'package:admin/core/constant/color.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TextController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<TextController>(builder: (controller) {
        return HandingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) {
              return Text("${controller.data}");
            },
          ),
        );
      }),
    );
  }
}
