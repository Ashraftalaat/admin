// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:admin/core/constant/color.dart';

import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String textButton;
  final IconData iconData;
  final bool? active;
  const CustomButtonAppBar(
      {super.key,
    required this.onPressed,
    required this.textButton,
    required this.iconData,
    required this.active,
    });


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: 
        onPressed,
      
      child: Column(
        //يجب نعطيه اقل مساحة ممكنة علشان لا يسبب مشاكل
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData,
              color: active == true ? AppColor.fourdColor : AppColor.grey2,size: 30,),
          Text(
            textButton,
            style: TextStyle(
                color: active == true ? AppColor.fourdColor: AppColor.grey2),
          ),
        ],
      ),
    );
  }
}
