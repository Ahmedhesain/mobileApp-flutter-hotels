import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hotels_app/core/values/app_strings.dart';

class AppValidator{

  static bool isPhoneValidate(String number){
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(number)) {
      return true;
    }
    return false;
  }

  static String? emailValidator(String? value){
    if(value == null || value.isEmpty){
      return AppStrings.required.tr;
    } else if(!value.isEmail){
      return AppStrings.invalidEmail.tr;
    }
    return null;
  }

  static String? password(dynamic value){
    if(value == null){
      return AppStrings.required.tr;
    }
    if(value is String && value.isEmpty){
      return AppStrings.required.tr;
    }
    return null;
  }

  static String? forceValue(dynamic value){
    if(value == null){
      return AppStrings.required.tr;
    }
    if(value is String && value.isEmpty){
      return AppStrings.required.tr;
    }
    return null;
  }

  static checkIfTheSame({String? value,required String checkWith}) {
    if(value == null || value.isEmpty){
      return AppStrings.required.tr;
    } else if(value != checkWith){
      return AppStrings.passwordsNotTheSame.tr;
    }
    return null;
  }


}