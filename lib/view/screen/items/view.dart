import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/core/class/handingdataview.dart';
import 'package:admin/core/constant/routs.dart';
import 'package:admin/linkapi.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsViewController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Items"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppNamesRouts.itemsadd);
          },
          child: const Icon(Icons.add),
        ),
        body: GetBuilder<ItemsViewController>(
            builder: ((controller) => HandingDataView(
                statusRequest: controller.statusRequest,
                widget: PopScope(
                  canPop: false,
                  onPopInvoked: (didPop) {
                    controller.myBack();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: ListView.builder(
                        itemCount: controller.data.length,
                        itemBuilder: ((context, index) {
                          // لاتنسي return
                          return InkWell(
                            onTap: () {
                              controller.gotoPageEdit(controller.data[index]);
                            },
                            child: Card(
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      child: CachedNetworkImage(
                                          height: 100,
                                          imageUrl:
                                              "${AppLinkApi.imagestitems}/${controller.data[index].itemsImage}"),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: ListTile(
                                      title: Text(
                                          "${controller.data[index].itemsName}"),
                                      subtitle: Text(
                                          "${controller.data[index].categoriesName}"),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                Get.defaultDialog(
                                                    title: "تحذير",
                                                    middleText:
                                                        "هل انت متأكد من حذف المنتج؟",
                                                    onCancel: () {},
                                                    onConfirm: () {
                                                      controller.deleteItems(
                                                        controller
                                                            .data[index].itemsId
                                                            .toString(),
                                                        controller.data[index]
                                                            .itemsImage
                                                            .toString(),
                                                      );
                                                      Get.back();
                                                    });
                                              },
                                              icon: const Icon(
                                                  Icons.delete_outline)),
                                          // IconButton(
                                          //     onPressed: () {
                                          //       controller.gotoPageEdit(
                                          //           controller.data[index]);
                                          //     },
                                          //     icon: const Icon(Icons.edit)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        })),
                  ),
                )))));
  }
}
