class AppLinkApi {
  // في حالة الشغل علي localhost
  // هندخل علي CMD
  // ونكتب ipconfig
  // وننسخ IPv4 Address
  // ونضعها بدل localhost
  //http بدل https
  static const String server = "http://192.168.1.4/ecommerce/admin";
  //في حالة host
  //static const String server = "https://ashraftalaat.infinityfreeapp.com/ecommerce";

  static const String test = "$server/test.php";

  //======================= Svg Image ==================
  static const String imagestatic = "http://192.168.1.4/ecommerce/upload";
  static const String imagestcategories = "$imagestatic/categories";
  static const String imagestitems = "$imagestatic/items";

//++++++++++++++++++++++  Admin  ++++++++++++++++++++++++++++++
  //======================  Auth  ========================
  static const String login = "$server/auth/login.php";
  static const String signup = "$server/auth/signup.php";
  static const String verfiycodesignup = "$server/auth/verfiycode.php";
  static const String resend = "$server/auth/resend.php";

  //======================  Orders  ========================
  // نضع view قبل العرض وليس قبل الحدث
  static const String approveorders = "$server/orders/approve.php";
  static const String prepareorders = "$server/orders/prepare.php";

  static const String viewpendingorders = "$server/orders/viewpending.php";
  static const String viewacceptedorders = "$server/orders/viewaccepted.php";
  static const String detailsorders = "$server/orders/details.php";
  static const String viewarchiveorders = "$server/orders/archive.php";


 // static const String doneorders = "$server/orders/done.php";

  //======================  ForgetPassword  ========================
  static const String checkemail = "$server/forgetpassword/checkemail.php";
  static const String resetpassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword =
      "$server/forgetpassword/verifycode.php";

  //======================  Home  ========================
  static const String home = "$server/home.php";

  //======================  Categories  ========================
  static const String categoriesview = "$server/categories/view.php";
  static const String categoriesadd = "$server/categories/add.php";
  static const String categoriesedit = "$server/categories/edit.php";
  static const String categoriesdelete = "$server/categories/delete.php";

  //======================  Items  ========================
  static const String itemsview = "$server/items/view.php";
  static const String itemsadd = "$server/items/add.php";
  static const String itemsedit = "$server/items/edit.php";
  static const String itemsdelete = "$server/items/delete.php";

  //======================  favorite  ========================
  static const String addfavorite = "$server/favorite/add.php";
  static const String removefavorite = "$server/favorite/remove.php";
  static const String myfavoriteview = "$server/favorite/view.php";
  static const String deletefromfav = "$server/favorite/deletefromfavorite.php";

  //======================  Cart  ========================
  static const String addcart = "$server/cart/add.php";
  static const String deletecart = "$server/cart/delete.php";
  static const String cartview = "$server/cart/view.php";
  static const String cartgetcountitems = "$server/cart/getcountitems.php";

  //======================  Address  ========================
  static const String addressview = "$server/address/view.php";
  static const String addressadd = "$server/address/add.php";
  static const String addressedit = "$server/address/edit.php";
  static const String addressdelete = "$server/address/delete.php";

//======================  Coupon  ========================
  static const String checkcoupon = "$server/coupon/checkcoupon.php";

//======================  Notification  ========================
  static const String notification = "$server/notification.php";

  //======================  Offers  ========================
  static const String offers = "$server/offers.php";
  static const String rating = "$server/rating.php";
}
