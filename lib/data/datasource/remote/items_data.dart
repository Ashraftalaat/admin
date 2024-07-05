// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:admin/core/class/crud.dart';
import 'package:admin/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  get() async {
    //لاستقبال وعرض البيانات فقط
    var response = await crud.postdata(AppLinkApi.itemsview, {});
    //fold بترجع 2 parmeter l & r
    return response.fold((l) => l, (r) => r);
  }

  add(Map data, File file) async {
    //لاستقبال وعرض البيانات فقط
    var response =
        await crud.addRequestWithImageOne(AppLinkApi.itemsadd, data, file);
    //fold بترجع 2 parmeter l & r
    return response.fold((l) => l, (r) => r);
  }

  delete(Map data) async {
    //لاستقبال وعرض البيانات فقط
    var response = await crud.postdata(AppLinkApi.itemsdelete, data);
    //fold بترجع 2 parmeter l & r
    return response.fold((l) => l, (r) => r);
  }

  edit(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postdata(AppLinkApi.itemsedit, data);
    }else {
      response =await crud.addRequestWithImageOne(AppLinkApi.itemsedit, data, file);
    }
    //لاستقبال وعرض البيانات فقط
   
    //fold بترجع 2 parmeter l & r
    return response.fold((l) => l, (r) => r);
  }
}
