import 'dart:convert';
import 'dart:io';

import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/function/checkinternet.dart';
import 'package:dartz/dartz.dart';
import 'package:path/path.dart';


import 'package:http/http.dart ' as http;


// للدخول الي api لانه محمي بال يوسر و الباص
// يوضع كدة بدون فهم في كل مشروع
// حتي لايستطيع اي احد الاتصال بال api
// ويجب اضافتها في postRequest
String _basicAuth = 'Basic  ${base64Encode(utf8.encode('ats:ats2024'))}';

Map<String, String> _myheaders = {'authorization': _basicAuth};


// للتعامل مع request اللي هنرسلهاو نستقبلها من Backend
//c : create  & r : read & u : Update & d : delete
class Crud {
  //function للارسال والاستقبال من Backend
  // Either نستخدمها لجعل الفينكشن تقبل نوعين ترجعهم
  //"left" => StatusRequest & "Right"=> Map
  // لذلك هنستخدم package: dartz اللي هتستخدم البرمجة الوظيفية في dart
  // StatusRequest مهمتهاالتأكد من  نجاح او فشل الاتصال بقاعدة البيانات والنت او اي سبب اخر
  Future<Either<StatusRequest, Map>> postdata(String linkurl, Map data) async {
    //   try {
    if (await checkInternet()) {
      //Uri.parse نوع من التشفير
      var response = await http.post(Uri.parse(linkurl),
          body: data, headers: {"accept": "application/json"});
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        //النتيجة اللي هترجع json من نوع map
        Map responsebody = jsonDecode(response.body);
        print(responsebody);
        // النوع الثاني "Map" اللي هترجعه
        return Right(responsebody);
      } else {
        // النوع الاول "StatusRequest" اللي هترجعه
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
    // } catch (_) {
    //   return const Left(StatusRequest.serverException);
    // }
  }

  Future<Either<StatusRequest, Map>> addRequestWithImageOne(
  //File بنستدعي مكتبة 'dart:io' وليس html
      url, data, File? image,
      [String? namerequest]) async {
    namerequest ??= "files";

    var uri = Uri.parse(url);
    //هذه الطريقة من اجل رفع الملف
    //لتحديد طريقة الارسال "POST" اولا
    // تحديد اللينك من نوع Uri  ثانيا
    var request = http.MultipartRequest("POST", uri);
    //الحماية
    request.headers.addAll(_myheaders);

    if (image != null) {
      // length الخاص بالملف
      var length = await image.length();
      // stream  الخاصة بتدفق البيانات
      var stream = http.ByteStream(image.openRead());
      stream.cast();
          // للتعامل مع الصورة
    //"file" نفس المكتوبة في php namerequest
      var multipartFile = http.MultipartFile(namerequest, stream, length,
         //import 'package:path/path.dart';استدعيناها عشان basename
        //وهو اخر اسم في path مثل path/to/"foo.dart" هتقطع الاسم فقط
          filename: basename(image.path));
    // تحميل الملف علي request اللي رايح للسرفير
      request.files.add(multipartFile);
    }
    // لارساب البيانات مع الملف
    // add Data to request
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    // ارسال الريكوست
    // add Data to request
    // Send Request
    var myrequest = await request.send();
    // For get Response Body 
     // للحصول علي الريسبونس
    var response = await http.Response.fromStream(myrequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverfailure);
    }
  }

}


