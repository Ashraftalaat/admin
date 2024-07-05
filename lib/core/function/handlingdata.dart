import 'package:admin/core/class/statusrequest.dart';



handlingData(response) {
   if (response is StatusRequest) {
  //   //هتكون Left->failure لانه فشل
    return response;
  } else {
    //  هتكون Right-> map لانه نجح
   return StatusRequest.success;
  }

}
