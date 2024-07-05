import 'package:admin/controller/items/add_controller.dart';
import 'package:admin/core/class/handingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/function/vaildinput.dart';
import 'package:admin/core/shared/custombutton.dart';
import 'package:admin/core/shared/customdropdownsearch.dart';
import 'package:admin/core/shared/customtextformglobal.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ItemsAdd extends StatelessWidget {
  const ItemsAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsAddController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Items"),
        ),
        body: GetBuilder<ItemsAddController>(
            builder: (controller) => HandingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Form(
                    key: controller.formstate,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: ListView(
                        children: [
                          CustomTextFormGlobal(
                              texthint: "item name",
                              textlabel: "item name",
                              iconData: Icons.category,
                              mycontroller: controller.name,
                              vaild: (val) {
                                return vaildInput(val!, 1, 50, "");
                              },
                              isNumber: false),
                          CustomTextFormGlobal(
                              texthint: "item name (Arabic)",
                              textlabel: "item name (Arabic)",
                              iconData: Icons.category,
                              mycontroller: controller.namear,
                              vaild: (val) {
                                return vaildInput(val!, 1, 50, "");
                              },
                              isNumber: false),
                          CustomTextFormGlobal(
                              texthint: "description",
                              textlabel: "description",
                              iconData: Icons.category,
                              mycontroller: controller.desc,
                              vaild: (val) {
                                return vaildInput(val!, 1, 50, "");
                              },
                              isNumber: false),
                          CustomTextFormGlobal(
                              texthint: "description (Arabic)",
                              textlabel: "description (Arabic)",
                              iconData: Icons.category,
                              mycontroller: controller.descar,
                              vaild: (val) {
                                return vaildInput(val!, 1, 50, "");
                              },
                              isNumber: false),
                          CustomTextFormGlobal(
                              texthint: "count",
                              textlabel: "count",
                              iconData: Icons.category,
                              mycontroller: controller.count,
                              vaild: (val) {
                                return vaildInput(val!, 1, 50, "");
                              },
                              isNumber: true),
                          CustomTextFormGlobal(
                              texthint: "price",
                              textlabel: "price",
                              iconData: Icons.category,
                              mycontroller: controller.price,
                              vaild: (val) {
                                return vaildInput(val!, 1, 50, "");
                              },
                              isNumber: true),
                          CustomTextFormGlobal(
                              texthint: "discount",
                              textlabel: "discount",
                              iconData: Icons.category,
                              mycontroller: controller.discount,
                              vaild: (val) {
                                return vaildInput(val!, 1, 50, "");
                              },
                              isNumber: true),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          CustomDropDownSearch(
                              title: "Choose Category",
                              listdata:controller.dropdownlist,
                              dropdownselectedName: controller.catname,
                              dropdownselectedId: controller.catid),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 35),
                            color: AppColor.thirdColor,
                            child: MaterialButton(
                              onPressed: () {
                                // لاختيار صورSvgفقط
                                controller.showOptionImage();
                              },
                              child: const Text(
                                "Choose item image",
                                style: TextStyle(color: AppColor.darkblue),
                              ),
                            ),
                          ),

                          if (controller.file != null)
                            Image.file(height: 100, controller.file!),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                            text: "اضافة",
                            onPressed: () {
                              controller.addData();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
