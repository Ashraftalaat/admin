// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/core/class/crud.dart';
import 'package:admin/linkapi.dart';



class VerifyCodeForgetPasswordData {
  Crud crud;
  VerifyCodeForgetPasswordData(this.crud);

  postData(String email, String verifycode) async {
    //لاستقبال او اضافة  وعرض البيانات
    var response = await crud.postdata(AppLinkApi.verifycodeforgetpassword, {
      "email": email,
      "verifycode": verifycode,
    });
    //fold بترجع 2 parmeter l & r
    return response.fold((l) => l, (r) => r);
  }
}
