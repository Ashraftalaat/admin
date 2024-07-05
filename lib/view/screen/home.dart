// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/controller/home_controller.dart';
import 'package:admin/core/constant/imageasset.dart';
import 'package:admin/core/constant/routs.dart';
import 'package:admin/view/widget/home/cardadmin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  get colorsgr => null;

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: ListView(
        children: [
          // لعمل responsive
         ScreenTypeLayout.builder(
  mobile: (BuildContext context) => Container(color:Colors.blue,height: 50,),
  tablet: (BuildContext context) => Container(color:Colors.yellow,height: 50,),
  desktop: (BuildContext context) => Container(color:Colors.red),
  watch: (BuildContext context) => Container(color:Colors.purple),
),
          GridView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                // لعمل responsive
                crossAxisCount: getValueForScreenType<int>(
                  context: context,
                  mobile: 3,
                  tablet: 5,
                  desktop: 5,
                ),
                mainAxisExtent: 150),
            children: [
              CardAdminHome(
                  url: AppImageAsset.categories,
                  onClick: () {
                    Get.toNamed(AppNamesRouts.categoriesview);
                  },
                  title: "Categories"),
              CardAdminHome(
                  url: AppImageAsset.item,
                  onClick: () {
                    Get.toNamed(AppNamesRouts.itemsview);
                  },
                  title: "Items"),
              CardAdminHome(
                  url: AppImageAsset.users, onClick: () {}, title: "Users"),
              CardAdminHome(
                  url: AppImageAsset.orders,
                  onClick: () {
                    Get.toNamed(AppNamesRouts.orderhome);
                  },
                  title: "Orders"),
              CardAdminHome(
                  url: AppImageAsset.report, onClick: () {}, title: "Report"),
              CardAdminHome(
                  url: AppImageAsset.notification,
                  onClick: () {},
                  title: "Notification"),
            ],
          )
        ],
      ),
    );
  }
}
