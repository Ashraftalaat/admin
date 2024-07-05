import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/core/constant/routs.dart';
import 'package:admin/core/middleware/mymiddleware.dart';
import 'package:admin/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:admin/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:admin/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:admin/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:admin/view/screen/auth/login.dart';
import 'package:admin/view/screen/auth/signup.dart';
import 'package:admin/view/screen/auth/success_signup.dart';
import 'package:admin/view/screen/auth/verifycodesignup.dart';
import 'package:admin/view/screen/categories/add.dart';
import 'package:admin/view/screen/categories/edit.dart';
import 'package:admin/view/screen/categories/view.dart';
import 'package:admin/view/screen/home.dart';
import 'package:admin/view/screen/items/add.dart';
import 'package:admin/view/screen/items/edit.dart';
import 'package:admin/view/screen/items/view.dart';
import 'package:admin/view/screen/orders/screen.dart';
import 'package:admin/view/screen/language.dart';
import 'package:admin/view/screen/orders/archive.dart';
import 'package:admin/view/screen/orders/details.dart';
import 'package:admin/view/screen/orders/pending.dart';
import 'package:admin/view/screen/orders/tracking.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  // ================ language ===============
  GetPage(
    name: "/",
    page: () => const Language(),
    middlewares: [MyMiddleWare()],
  ),

  //================= OnBoarding ===================
  // GetPage(name: AppNamesRouts.onBoarding, page: () => const OnBoarding()),

  //================= Auth ==================
  GetPage(name: AppNamesRouts.login, page: () => const Login()),
  GetPage(name: AppNamesRouts.signUp, page: () => const SignUp()),
  GetPage(
      name: AppNamesRouts.forgetpassword, page: () => const ForgetPassword()),
  GetPage(name: AppNamesRouts.verifycode, page: () => const Verifycode()),
  GetPage(
      name: AppNamesRouts.resetpasssword, page: () => const ResetPassword()),
  GetPage(
      name: AppNamesRouts.successresetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppNamesRouts.successsignup, page: () => const SuccessSignUp()),
  GetPage(
      name: AppNamesRouts.verifycodesignup,
      page: () => const VerifycodeSignUp()),

  // home
  GetPage(name: AppNamesRouts.home, page: () => const Home()),

    // Categoies
  GetPage(name: AppNamesRouts.categoriesview, page: () => const CategoriesView()),
  GetPage(name: AppNamesRouts.categoriesadd, page: () => const CategoriesAdd()),
  GetPage(name: AppNamesRouts.categoriesedit, page: () => const CategoriesEdit()),

 // Items
  GetPage(name: AppNamesRouts.itemsview, page: () => const ItemsView()),
  GetPage(name: AppNamesRouts.itemsadd, page: () => const ItemsAdd()),
  GetPage(name: AppNamesRouts.itemsedit, page: () => const ItemsEdit()),
  // Orders
  GetPage(name: AppNamesRouts.pendingorder, page: () => const OrdersPending()),
  GetPage(name: AppNamesRouts.detailsorder, page: () => const OrdersDetails()),
  GetPage(
      name: AppNamesRouts.archiveorder, page: () => const OrdersArchiveView()),
  GetPage(name: AppNamesRouts.orderhome, page: () => const OrderScreen()),
  GetPage(name: AppNamesRouts.tracking, page: () => const OrdersTracking()),


  // items
  // GetPage(name: AppNamesRouts.items, page: () => const Items()),
  // GetPage(name: AppNamesRouts.itemsdetails, page: () => const ItemsDetails()),

  // favorite
  // GetPage(name: AppNamesRouts.myfavorite, page: () => const MyFavorite()),

  // Cart
  // GetPage(name: AppNamesRouts.cart, page: () => const Cart()),

  // Check Out
//  GetPage(name: AppNamesRouts.checkout, page: () => const CheckOut()),






  // Address
  // GetPage(name: AppNamesRouts.addressview, page: () => const AddressView()),
  // GetPage(name: AppNamesRouts.addressadd, page: () => const AddressAdd()),
  // GetPage(
  //     name: AppNamesRouts.addressadddetails,
  //     page: () => const AddressAddDetails()),
];


