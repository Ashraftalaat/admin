import 'package:admin/controller/categories/add_controller.dart';
import 'package:admin/core/class/handingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/function/vaildinput.dart';
import 'package:admin/core/shared/custombutton.dart';
import 'package:admin/core/shared/customtextformglobal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoriesAdd extends StatelessWidget {
  const CategoriesAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesAddController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Categories"),
        ),
        body: GetBuilder<CategoriesAddController>(
          builder: (controller) => HandingDataView(statusRequest: controller.statusRequest, widget: Form(
            key: controller.formstate,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  CustomTextFormGlobal(
                      texthint: "category name",
                      textlabel: "category name",
                      iconData: Icons.category,
                      mycontroller: controller.name,
                      vaild: (val) {
                        return vaildInput(val!, 1, 50, "");
                      },
                      isNumber: false),
                  CustomTextFormGlobal(
                      texthint: "category name (Arabic)",
                      textlabel: "category name (Arabic)",
                      iconData: Icons.category,
                      mycontroller: controller.namear,
                      vaild: (val) {
                        return vaildInput(val!, 1, 50, "");
                      },
                      isNumber: false),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 35),
                    color: AppColor.thirdColor,
                    child: MaterialButton(
                      onPressed: () {
                        // لاختيار صورSvgفقط
                       controller.chooseImage();
                      },
                      child: const Text(
                        "Choose category image",
                        style: TextStyle(color: AppColor.darkblue),
                      ),
                    ),
                  ),
                  if(controller.file != null)
                        SvgPicture.file(
                     
                          height: 100,
                          controller.file!),
                  
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
          ),)
        ));
  }
}
