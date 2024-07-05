// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/controller/home_controller.dart';
import 'package:admin/core/constant/color.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardHome extends GetView<HomeController> {
  final String title;
  final String body;


  const CustomCardHome({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: 150,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              title: Text(
                title,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              subtitle: Text(
                body,
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
          Positioned(
            top: -20,
         //   right: controller.lang == "en"?-20:null,
          //  left: controller.lang == "ar"?-20:null,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                  color: AppColor.secondColor,
                  borderRadius: BorderRadius.circular(160)),
            ),
          )
        ],
      ),
    );
  }
}
