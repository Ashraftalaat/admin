// enum لتحديد قيم محددة وثابتة
enum StatusRequest {
  //الهدف منها ازالة خطاء الnull التي تظهر مع handingdataRequest
  none,
  // وقت التحميل
  loading,
  // النجاح وظهور الداتا
  success,
  // no data في حالة البحث  في عمود عن شئ مش موجود
  failure,
  // كتابة لينك خطأ
  serverfailure,
  // خطأ بالكود
  serverException,
  // لايوجد اتصال بالنت
  offlinefailure

}
