// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/core/class/crud.dart';
import 'package:admin/linkapi.dart';



class SignUpData {
  Crud crud;
  SignUpData(this.crud);

  postData(String username, String password, String email, String phone) async {
    //لاستقبال او اضافة  وعرض البيانات
    var response = await crud.postdata(AppLinkApi.signup, {
      "username": username,
      "password": password,
      "email": email,
      "phone": phone,
    });
    //fold بترجع 2 parmeter l & r
    return response.fold((l) => l, (r) => r);
  }
}
