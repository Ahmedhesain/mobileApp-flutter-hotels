

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hotels_app/routes/app_pages.dart';


class SplashController extends GetxController {
  final showLogo = false.obs;

  @override
  void onInit() {
    super.onInit();
    // SizeConfig();

  }
  void onReady() async{
    super.onReady();
    await Future.delayed(const Duration(seconds: 1));
    showLogo(true);
    await Future.delayed(const Duration(seconds: 2));

    // if(UserManager().isLoggedIn){
      // if(UserManager().selectedBranch != null){
      //   Get.offNamed(Routes.ALLSERVICES);
      // }else{
      // Get.offAndToNamed(Routes.HOME);
      // }
    // } else {
      Get.offAndToNamed(Routes.LOGIN);
    // }
  }
  // Define SizeConfig class


}
class SizeConfig {
  static late double screenWidth; // Define late field screenWidth
  static late double screenHeight; // Define late field screenHeight
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  static void init(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}