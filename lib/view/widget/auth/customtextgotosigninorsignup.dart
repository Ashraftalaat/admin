// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/core/constant/color.dart';

import 'package:flutter/material.dart';



class CustomTextGoToSigninOrSignup extends StatelessWidget {
  final String textone;
  final String texttwo;
 final void Function() onTap;

  const CustomTextGoToSigninOrSignup({
    super.key,
    required this.textone,
    required this.texttwo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            textone,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            texttwo,
            style: const TextStyle(color: AppColor.primaryColor),
          ),
        ),
      ],
    );
  }
}
