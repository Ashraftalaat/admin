import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/core/class/handingdataview.dart';
import 'package:admin/core/constant/routs.dart';
import 'package:admin/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesViewController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Categories"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppNamesRouts.categoriesadd);
          },
          child: Icon(Icons.add),
        ),
        body: GetBuilder<CategoriesViewController>(
            builder: ((controller) => HandingDataView(
                statusRequest: controller.statusRequest,
                widget: PopScope(
                  canPop: false,
                  onPopInvoked: (didPop) {
                    controller.myBack();
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
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
                                      padding: EdgeInsets.all(4),
                                      child: SvgPicture.network(
                                          height: 100,
                                          "${AppLinkApi.imagestcategories}/${controller.data[index].categoriesImage}"),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: ListTile(
                                      title: Text(
                                          "${controller.data[index].categoriesName}"),
                                      subtitle: Text(
                                          "${controller.data[index].categoriesDatetime}"),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                Get.defaultDialog(
                                                    title: "تحذير",
                                                    middleText:
                                                        "هل انت متأكد من حذف القسم؟",
                                                    onCancel: () {},
                                                    onConfirm: () {
                                                      controller
                                                          .deleteCategories(
                                                        controller.data[index]
                                                            .categoriesId
                                                            .toString(),
                                                        controller.data[index]
                                                            .categoriesImage
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
                                          //     icon: const Icon(
                                          //         Icons.edit)),
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
