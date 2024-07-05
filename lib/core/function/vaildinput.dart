import 'package:get/get.dart';

vaildInput(String val, int min, int max, String type) {
  if (type == "email") {
    // بدون!: يعني القيمة بتساوي الايميل 
    //بال !:يعني القيمة لاتساوي الايميل 
    if (!GetUtils.isEmail(val)) {
      return "not valid email";
    }
  }

  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "not valid username";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not valid phone";
    }
  }

  if (val.isEmpty) {
    return "can't be impty";
  }

  if (val.length < min) {
    return "can't be less than $min";
  }

  if (val.length > max) {
    return "can't be larger than $max";
  }
}
