import 'package:admin/controller/orders/archive_controller.dart';
import 'package:admin/core/class/handingdataview.dart';
import 'package:admin/view/widget/orders/orderlistcardarchive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersArchiveView extends StatelessWidget {
  const OrdersArchiveView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersArchiveController());
    return Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<OrdersArchiveController>(
            builder: (controller) => HandingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) => OrdersLisrtCardArchive(
                      listData: controller.data[index],
                    ),
                  ),
                )));
  }
}
