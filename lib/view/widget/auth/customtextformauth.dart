import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String texthint;
  final String textlabel;
  final IconData iconData;
  final TextEditingController mycontroller;
  final String? Function(String?) vaild;
  final bool isNumber;
  final bool? obscuretext;
  final void Function()? onTapicon;
  const CustomTextFormAuth(
      {super.key,
      required this.texthint,
      required this.textlabel,
      required this.iconData,
      required this.mycontroller,
      required this.vaild,
      required this.isNumber,
      this.obscuretext, this.onTapicon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscuretext == null || obscuretext == false ? false : true,
      keyboardType: isNumber
          // decimal: true لاستخدام الفواصل العشرية
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      validator: vaild,
      controller: mycontroller,
      decoration: InputDecoration(
        hintText: texthint,
        hintStyle: const TextStyle(fontSize: 12),
        contentPadding: const EdgeInsets.symmetric(horizontal: 30),
        suffixIcon: InkWell(
          onTap: onTapicon,
           child: Icon(iconData),
        ),
        label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 9),
            child: Text(textlabel)),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
