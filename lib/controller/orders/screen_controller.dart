import 'package:admin/view/screen/orders/accepted.dart';
import 'package:admin/view/screen/orders/archive.dart';
import 'package:admin/view/screen/orders/pending.dart';
import 'package:admin/view/screen/test_view.dart';
import 'package:admin/view/widget/orders/orderlistcardarchive.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrderScreenController extends GetxController {
  changePage(int i);
}

class OrderScreenControllerImp extends OrderScreenController {
  int currentpage = 0;
  List<Widget> listPage = [
    const OrdersPending(),
    const OrdersAccepted(),
    const OrdersArchiveView()
    // // const OffersView(),
    // const TestView(),
  ];

  List bottonAppBar = [
    {"title": "Pending", "icon": Icons.home},
    {"title": "Accepted", "icon": Icons.add_road_sharp},
    {"title": "Archive", "icon": Icons.archive_outlined},
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
