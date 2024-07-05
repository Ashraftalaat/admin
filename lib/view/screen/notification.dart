
import 'package:admin/controller/notification_controller.dart';
import 'package:admin/core/class/handingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: GetBuilder<NotificationController>(
            builder: (controller) => HandingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    const Center(
                      child: Text(
                        "Notification",
                        style: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    ...List.generate(
                      controller.data.length,
                      (index) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Stack(
                          children: [
                            ListTile(
                              title: Text(
                                "${controller.data[index]['notification_title']}",
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                  "${controller.data[index]['notification_body']}"),
                            ),
                            Positioned(
                              right: 5,
                              child: Text( Jiffy.parse("${controller.data[index]['notification_datetime']}").fromNow(),
                                          style: const TextStyle(
                        color: AppColor.primaryColor, fontWeight: FontWeight.bold),))
                          ],
                        ),
                      ),
                    ),
                  ],
                ))));
  }
}
