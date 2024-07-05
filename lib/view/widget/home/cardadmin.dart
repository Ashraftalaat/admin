import 'package:flutter/material.dart';

class CardAdminHome extends StatelessWidget {
  final String url;
  final void Function()? onClick;
  final String title;
  const CardAdminHome(
      {super.key,
      required this.url,
      required this.onClick,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: Image.asset(
              url,
              width: 80,
            ),
          ),
          Text(title)
        ],
      ),
    );
  }
}
