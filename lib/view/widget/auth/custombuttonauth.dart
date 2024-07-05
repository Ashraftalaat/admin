// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:admin/core/constant/color.dart';

import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtonAuth({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      textColor: AppColor.backgroundcolor,
      height: 45,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: AppColor.primaryColor,
      onPressed: onPressed,
      child: Text(text,style: const TextStyle(fontSize: 18),),
    );
  }
}
