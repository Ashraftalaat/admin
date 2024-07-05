// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/core/class/crud.dart';
import 'package:admin/linkapi.dart';



class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);

  getData() async {
    //لاستقبال وعرض البيانات فقط
    var response =
        await crud.postdata(AppLinkApi.viewarchiveorders, {});
    //fold بترجع 2 parmeter l & r
    return response.fold((l) => l, (r) => r);
  }

// ratingData(String ordersid,String comment,double rating) async {
//     //لاستقبال وعرض البيانات فقط
//     var response =
//         await crud.postdata(AppLinkApi.rating, {"id": ordersid,"rating":rating.toString(),"comment":comment});
//     //fold بترجع 2 parmeter l & r
//     return response.fold((l) => l, (r) => r);
//   }

 
}
