
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hotels_app/components/image_widget.dart';
import 'package:hotels_app/core/values/app_assets.dart';
import 'package:hotels_app/core/values/app_constants.dart';
import 'package:hotels_app/core/values/app_strings.dart';
import 'package:hotels_app/login/views/login_view.dart';
import 'package:hotels_app/rooms_homepage/views/rooms_view.dart';
import 'package:hotels_app/routes/app_pages.dart';
import 'package:sizer/sizer.dart';
import '../controllers/splash_controller.dart';
import 'package:size_config/size_config.dart';
class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      // StreamBuilder<User?>(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: ((context,snapshot) {
      //
      //     if(snapshot.hasData){
      //       return LoginView();
      //       Get.offAndToNamed(Routes.HOME);
      //     }else{
      //       return RoomsView();
      //       Get.offAndToNamed(Routes.LOGIN);
      //
      //     }
      //   }),
      // )
      Stack(
        children: [
          Obx(() {
            return AnimatedPositioned(
              right: 0,
              left: 0,
              top: controller.showLogo.value ? 0 : -(SizeExtention(1000).h),
              bottom: 0,
              duration: AppConstants.ANIMATION_DURATION,
              curve: Curves.easeOutBack,
              child: Center(
                  child: ImageWidget(
                    path: AppAssets.logoImg,
                    tag: AppStrings.logoHeroTag,
                    width: 250,
                  )),
            );
          })
        ],
      ),
    );
  }
}
