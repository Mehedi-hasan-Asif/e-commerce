import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/presentation/stateholder/add_to_cart_controller.dart';
import 'package:crafty_bay/presentation/stateholder/auth_controller.dart';
import 'package:crafty_bay/presentation/stateholder/bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/stateholder/category_list_controller.dart';
import 'package:crafty_bay/presentation/stateholder/email_verification_controller.dart';
import 'package:crafty_bay/presentation/stateholder/new_product_list_controller.dart';
import 'package:crafty_bay/presentation/stateholder/otp_verification_controller.dart';
import 'package:crafty_bay/presentation/stateholder/popular_product_list_controller.dart';
import 'package:crafty_bay/presentation/stateholder/product_details_controller.dart';
import 'package:crafty_bay/presentation/stateholder/product_list_by_category_controller.dart';
import 'package:crafty_bay/presentation/stateholder/read_profile_controller.dart';
import 'package:crafty_bay/presentation/stateholder/slider_list_controller.dart';
import 'package:crafty_bay/presentation/stateholder/special_product_list_controller.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavBarController());
    Get.put(Logger());
    Get.put(AuthController());
    Get.put(NetworkCaller(
      logger: Get.find<Logger>(),
      authController: Get.find<AuthController>(),
    ));
    Get.put(SliderListController());
    Get.put(CategoryListController());
    Get.put(NewProductListController());
    Get.put(PopularProductListController());
    Get.put(SpecialProductListController());
    Get.put(ProductListByCategoryController());
    Get.put(ProductDetailsController());
    Get.put(AddToCartController());
    Get.put(EmailVerificationController());
    Get.put(OtpVerificationController());
    Get.put(ReadProfileController());
  }
}
