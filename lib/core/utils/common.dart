
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hotels_app/components/text_widget.dart';
import 'package:hotels_app/core/values/app_colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


abstract class Common {

  static showSnackBar(String title, String message, {Color? backgroundColor}) {
    Get.snackbar(
      title,
      message,
      borderRadius: 8.0,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: backgroundColor ?? AppColors.primary,
      margin: const EdgeInsets.all(10),
      colorText: AppColors.white,
    );
  }

  static showToast(String message){
    // FToast fToast;
    // fToast = FToast();
    // fToast.removeQueuedCustomToasts();
    // fToast.init(Get.overlayContext!);
    Widget toast = GestureDetector(
      // onTap: () => fToast.removeQueuedCustomToasts(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: AppColors.primary,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset.zero,
                  spreadRadius: 1,
                  blurRadius: 5
              )
            ]
        ),
        child: TextWidget(message.tr,textColor: Colors.white,textAlign: TextAlign.center),
      ),
    );

    // fToast.showToast(
    //   child: toast,
    //   gravity: ToastGravity.BOTTOM,
    //   toastDuration: const Duration(seconds: 3),
    // );

  }

  static hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Widget getSpin({double size = 50.0,double? lineWidth}) {
    return SpinKitThreeBounce(
      color: Get.isDarkMode?AppColors.white:AppColors.primary,
      size: size,
    );
  }

  static TextDirection getFieldDirection(String value) {
    if (value.codeUnitAt(1) >= 1536 && value.codeUnitAt(1) <= 1791) {
      return TextDirection.rtl;
    } else {
      return TextDirection.ltr;
    }
  }

  static bool isVersionABiggerThanVersionB({required String a,required  String b}){
    final aList = a.split(".").map((e) => int.tryParse(e)??0).toList();
    final bList = b.split(".").map((e) => int.tryParse(e)??0).toList();
    for(var i=0; i<aList.length; i++){
      if(aList[i] > bList[i]){
        return true;
      } else if(aList[i] < bList[i]){
        return false;
      }
    }
    return false;
  }
}
