import 'package:flutter/material.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String textbody;
  const CustomTextBodyAuth({super.key, required this.textbody});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        textbody,
        style: Theme.of(context).textTheme.headlineLarge,
        textAlign: TextAlign.center,
      ),
    );
  }
}
