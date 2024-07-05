import 'package:admin/controller/orders/screen_controller.dart';
import 'package:admin/view/widget/orders/screen/custombottomappbarscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderScreenControllerImp());
    return GetBuilder<OrderScreenControllerImp>(
        builder: (controller) => Scaffold(
            appBar: AppBar(
              title: const Text("Order"),
            ),
            bottomNavigationBar: const CustomBottomAppBarOrderScreen(),
            body: controller.listPage.elementAt(controller.currentpage)));
  }
}
