// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/controller/home_controller.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemsHome extends GetView<HomeController> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: 10),
      height: 140,
      // width: 100,
      // child: ListView.builder(
      //   scrollDirection: Axis.horizontal,
      //   itemCount: controller.items.length,
      //   itemBuilder: (context, index) {
      //     return Container();
       
      //   },
      // ),
    );
  }
}


