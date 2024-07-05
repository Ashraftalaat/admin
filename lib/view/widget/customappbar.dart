import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleAppBar;
  final Function()? onPressedSearch;
 // final Function()? onPressedIcon;
  final Function()? onPressedIconFav;
 final void Function(String)? onChanged;
final TextEditingController? myController;
  const CustomAppBar({
    super.key,
    required this.titleAppBar,
    required this.onPressedSearch,
   // required this.onPressedIcon,
    required this.onPressedIconFav,required this.onChanged,required this.myController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 40),
              child: TextFormField(
                controller: myController,
                onChanged:onChanged ,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                  hintText: titleAppBar,
                  hintStyle: TextStyle(color: Colors.grey[500], fontSize: 18),
                  prefixIcon: IconButton(
                    onPressed: onPressedSearch,
                    icon: const Icon(
                      Icons.search,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          // Container(
          //   margin: const EdgeInsets.only(top: 40),
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //   height: 65,
          //   decoration: BoxDecoration(
          //       color: Colors.grey[200],
          //       borderRadius: BorderRadius.circular(15)),
          //   child: IconButton(
          //     onPressed: onPressedIcon,
          //     icon: const Icon(
          //       Icons.notifications_active_outlined,
          //       size: 40,
          //     ),
          //   ),
          // ),
          // const SizedBox(
          //   width: 10,
          // ),
          Container(
            margin: const EdgeInsets.only(top: 40),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 65,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15)),
            child: IconButton(
              onPressed: onPressedIconFav,
              icon: const Icon(
                Icons.favorite_border_outlined,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
