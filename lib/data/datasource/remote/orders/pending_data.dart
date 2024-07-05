// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:admin/core/class/crud.dart';
import 'package:admin/linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);

  getData() async {
    //لاستقبال وعرض البيانات فقط
    var response =
        await crud.postdata(AppLinkApi.viewpendingorders, {});
    //fold بترجع 2 parmeter l & r
    return response.fold((l) => l, (r) => r);
  }
// ملحوظة هامة جدا جدا   ترتيب الريكوست مهم جدا
  approveOrders(String ordersid ,String usersid) async {
    //لاستقبال وعرض البيانات فقط
    var response =
        await crud.postdata(AppLinkApi.approveorders, {"ordersid" : ordersid,"usersid" : usersid});
    //fold بترجع 2 parmeter l & r
    return response.fold((l) => l, (r) => r);
  }
}
