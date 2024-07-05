import 'dart:io';

import 'package:admin/core/constant/color.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

imageUploadCamera() async {
  final XFile? file = await ImagePicker()
      .pickImage(source: ImageSource.camera, imageQuality: 90);
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

//file_picker جيدة في التعامل مع Svg
// في حالة isSvg =true هنختار الامتدادات الاخري
fileUploadGallery([isSvg = false]) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      //النوع اختياري
      type: FileType.custom,
      allowedExtensions:
          isSvg ? ["svg", "SVG"] : ["png", "PNG", "jpg", "jpeg", "gif"]);
  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}

showbottomMenu(imageUploadCamera(), fileUploadGallery()) {
  Get.bottomSheet(
      Directionality(
        // الاتجاه من اليمين الي اليسار
        textDirection: TextDirection.rtl,
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: const Text(
                  "اختيار الصورة",
                  style: TextStyle(
                      fontSize: 22,
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              ListTile(
                onTap: () {
                  imageUploadCamera();
                  Get.back();
                },
                leading: const Icon(
                  Icons.camera_alt,
                  size: 40,
                ),
                title: const Text(
                  "صورة من الكامير",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                onTap: () {
                  fileUploadGallery();
                  Get.back();
                },
                leading: const Icon(
                  Icons.camera_alt,
                  size: 40,
                ),
                title: const Text(
                  "صورة من الاستديو",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white);
}
