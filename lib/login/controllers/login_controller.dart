
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hotels_app/routes/app_pages.dart';

class LoginController extends GetxController {
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  final loginForm = GlobalKey<FormState>();
  final isLoading = false.obs;
  // final requestDto = LoginRequestDto();
  final showPassword = false.obs;



  @override
  void onInit() async {

    // await AppPermissionHandler().requestLocationPermission();
    // Get.isRegistered<FoodCartController>() ? Get.find<FoodCartController>() : Get.put<FoodCartController>(FoodCartController());
    super.onInit();
  }

  Future login() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: phoneController.text.trim(), password: passwordController.text.trim());
    Get.offAndToNamed(Routes.ROOMS);
  }
  // Future login() async {
  //   if (!loginForm.currentState!.validate()) return;
  //   isLoading(true);
  //   AuthRepository().login(requestDto,
  //       onSuccess: (data) {
  //         if (data.data == null) {
  //           Get.offAndToNamed(Routes.REGISTER, arguments: requestDto.phone);
  //           return;
  //         }
  //
  //         UserManager().login(data.data!);
  //
  //         if (data.data?.hotelBooking != null) {
  //           UserManager().saveSelectedBranch(spa.HotelsearchModel(id: data.data?.hotelBooking));
  //           Get.offAndToNamed(Routes.ALLSERVICES);
  //            return;
  //         } else {
  //           Get.offAndToNamed(Routes.HOME);
  //         }
  //       },
  //       onError: (error) => showPopupText(error.toString()),
  //       onComplete: () => isLoading(false));
  // }

  changePasswordVisibility() => showPassword(!showPassword.value);
}
