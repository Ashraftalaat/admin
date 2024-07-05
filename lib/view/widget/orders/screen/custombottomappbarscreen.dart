import 'package:admin/controller/orders/screen_controller.dart';
import 'package:admin/view/widget/orders/screen/custombuttonappbar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBarOrderScreen extends StatelessWidget {
  const CustomBottomAppBarOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderScreenControllerImp>(
        builder: ((controller) => BottomAppBar(
              //  height: 100,
              shape: const CircularNotchedRectangle(),
              notchMargin: 10,
              child: Row(
                children: [
                  ...List.generate(
                    controller.listPage.length,
                    (index) {
                      return Expanded(
                        child: CustomButtonAppBar(
                            onPressed: () {
                              controller.changePage(index);
                            },
                            //عملناه لست ليها
                            textButton: controller.bottonAppBar[index]['title'],
                            //عملناه لست ليها
                            iconData: controller.bottonAppBar[index]['icon'],
                            active:
                                controller.currentpage == index ? true : false),
                      );
                    },
                  ),

                  //=================== تم استبالهم بال ...List.generate =====================

                  // Row(
                  //   children: [
                  //     CustomButtonAppBar(
                  //         onPressed: () {
                  //           controller.changePage(0);
                  //         },
                  //         textButton: "HOME",
                  //         iconData: Icons.home,
                  //         active: controller.currentpage == 0 ? true : false),
                  //     CustomButtonAppBar(
                  //         onPressed: () {
                  //           controller.changePage(1);
                  //         },
                  //         textButton: "Setting",
                  //         iconData: Icons.settings,
                  //         active: controller.currentpage == 1 ? true : false),
                  //   ],
                  // ),
                  // const Spacer(),
                  // Row(
                  //   children: [
                  //     CustomButtonAppBar(
                  //         onPressed: () {
                  //           controller.changePage(2);
                  //         },
                  //         textButton: "Perofile",
                  //         iconData: Icons.person,
                  //         active: controller.currentpage == 2 ? true : false),
                  //     CustomButtonAppBar(
                  //         onPressed: () {
                  //           controller.changePage(3);
                  //         },
                  //         textButton: "Favorite",
                  //         iconData: Icons.favorite,
                  //         active: controller.currentpage == 3 ? true : false),
                  //   ],
                  // ),
                ],
              ),
            )));
  }
}
