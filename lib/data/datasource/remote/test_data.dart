// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/core/class/crud.dart';
import 'package:admin/linkapi.dart';



class TestData {
  Crud crud;
  TestData(this.crud);

  getData() async {
   
    //لاستقبال وعرض البيانات فقط
    var response = await crud.postdata(AppLinkApi.test, {});
     //fold بترجع 2 parmeter l & r
    return response.fold((l) => l , (r) => r);
  }
} 
