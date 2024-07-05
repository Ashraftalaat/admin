// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:admin/core/class/crud.dart';
import 'package:admin/linkapi.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

  getData() async {
    //لاستقبال وعرض البيانات فقط
    var response = await crud.postdata(AppLinkApi.home, {});
    //fold بترجع 2 parmeter l & r
    return response.fold((l) => l, (r) => r);
  }

  // searchData(String search) async {
  //   //لاستقبال وعرض البيانات فقط
  //   var response =
  //       await crud.postdata(AppLinkApi.searchitems, {'search': search});
  //   //fold بترجع 2 parmeter l & r
  //   return response.fold((l) => l, (r) => r);
  // }
}
