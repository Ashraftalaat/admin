// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/core/class/crud.dart';
import 'package:admin/linkapi.dart';



class NotificationData {
  Crud crud;
  NotificationData(this.crud);

  getData(String id) async {
    //لاستقبال وعرض البيانات فقط
    var response = await crud.postdata(AppLinkApi.notification, {"id": id});
    //fold بترجع 2 parmeter l & r
    return response.fold((l) => l, (r) => r);
  }
}
