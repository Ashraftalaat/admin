// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/core/constant/color.dart';

import 'package:flutter/material.dart';



class CustomTitleHome extends StatelessWidget {
  final String title;
  const CustomTitleHome({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Text(
        title,
        style: const TextStyle(color: AppColor.secondColor),
      ),
    );
  }
}
