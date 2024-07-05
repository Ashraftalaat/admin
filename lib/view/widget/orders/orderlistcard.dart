import 'package:admin/controller/orders/pending_controller.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/constant/routs.dart';
import 'package:admin/data/model/orders/orders.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrderList extends GetView<OrdersPendingController> {
  final OrdersModel listData;
  const CardOrderList({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Order Number : ${listData.ordersId}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppColor.darkblue),
                ),
                const Spacer(),
                Text(
                  Jiffy.parse(listData.ordersDatetime.toString()).fromNow(), //
                  style: const TextStyle(
                      color: AppColor.secondColor, fontWeight: FontWeight.bold),
                ) // 25 years ago)
              ],
            ),
            const Divider(),
            // Text(
            //     "Order Type : ${controller.printOrdersType(listData.ordersType.toString())}"),
            Text("Order Price : ${listData.ordersPrice.toString()} \$"),
            Text(
                "Delivery price :  ${listData.ordersPricedelivery.toString()} \$"),
            Text(
                "Payment Method : ${controller.printPaymentMethod(listData.ordersPaymentmethod.toString())}"),
            // Text(
            //     "Payment Status : ${controller.printOrderStatus(listData.ordersStatus.toString())}"),
            const Divider(),
            Row(
              children: [
                Text(
                  "Total Price : ${listData.ordersTotalprice.toString()} \$", //
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: AppColor.secondColor),
                ),
                const Spacer(),
                MaterialButton(
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: AppColor.thirdColor,
                  onPressed: () {
                    Get.toNamed(AppNamesRouts.detailsorder,
                        arguments: {"ordermodel": listData});
                  },
                  child: const Text(
                    "Details",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: AppColor.darkblue),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                if (listData.ordersStatus == 0)
                  MaterialButton(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: AppColor.thirdColor,
                    onPressed: () {
                      controller.approveOrders(
                          listData.ordersUsersid.toString(),listData.ordersId.toString()
                          );
                    },
                    child: const Text(
                      "Approve",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.darkblue),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
