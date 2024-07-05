// ignore_for_file: avoid_print

import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class CustomDropDownSearch extends StatefulWidget {
  final String? title;
  final List<SelectedListItem> listdata;
  final TextEditingController dropdownselectedName;
  final TextEditingController dropdownselectedId;
  const CustomDropDownSearch(
      {super.key,
      this.title,
      required this.listdata,
      required this.dropdownselectedName,
      required this.dropdownselectedId});

  @override
  State<CustomDropDownSearch> createState() => _CustomDropDownSearchState();
}

class _CustomDropDownSearchState extends State<CustomDropDownSearch> {
  void showDropDownSearch() {
    DropDownState(
      DropDown(
        isDismissible: true,
        bottomSheetTitle: Text(
          widget.title!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        clearButtonChild: const Text(
          'Clear',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.listdata ?? [],
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];

          widget.dropdownselectedName.text = selectedListItem.name;
          widget.dropdownselectedId.text = selectedListItem.value!;
          print("==========================");
          print(widget.dropdownselectedName.text);
          print( widget.dropdownselectedId.text);
          print("==========================");
        },
        //اختيار من متعدد
        //  enableMultipleSelection: true,
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.dropdownselectedName,
      cursorColor: Colors.black,
      onTap: () {
        FocusScope.of(context).unfocus();
        showDropDownSearch();
      },

        decoration: InputDecoration(
          hintText:  widget.dropdownselectedName.text == ""
            ? widget.title
            : widget.dropdownselectedName.text,
          hintStyle: const TextStyle(fontSize: 12),
          contentPadding: const EdgeInsets.symmetric(horizontal: 30),
          suffixIcon: InkWell(
            onTap: (){},
             child: Icon(Icons.arrow_drop_down),
          ),
          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 9),
              child: Text(widget.dropdownselectedName.text == ""
            ? widget.title!
            : widget.dropdownselectedName.text)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),

      // decoration: InputDecoration(
      //   filled: true,
      //   fillColor: Colors.black12,
      //   contentPadding:
      //       const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
      //   hintText: widget.dropdownselectedName.text == ""
      //       ? widget.title
      //       : widget.dropdownselectedName.text,
      //   border: const OutlineInputBorder(
      //     borderSide: BorderSide(
      //       width: 0,
      //       style: BorderStyle.none,
      //     ),
      //     borderRadius: BorderRadius.all(
      //       Radius.circular(8.0),
      //     ),
      //   ),
      // ),
    );
  }
}
