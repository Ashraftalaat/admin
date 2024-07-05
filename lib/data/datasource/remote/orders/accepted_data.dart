// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/core/class/crud.dart';
import 'package:admin/linkapi.dart';


class OrdersAcceptedData {
  Crud crud;
  OrdersAcceptedData(this.crud);

  getData() async {
    //لاستقبال وعرض البيانات فقط
    var response =
        await crud.postdata(AppLinkApi.viewacceptedorders, {});
    //fold بترجع 2 parmeter l & r
    return response.fold((l) => l, (r) => r);
  }

  donePrepare(String ordersid, String usersid,String orderstype) async {
    //لاستقبال وعرض البيانات فقط
    var response = await crud.postdata(
        AppLinkApi.prepareorders, {"ordersid": ordersid, "usersid": usersid,"orderstype":orderstype});
    //fold بترجع 2 parmeter l & r
    return response.fold((l) => l, (r) => r);
  }
}
