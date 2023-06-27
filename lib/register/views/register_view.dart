import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotels_app/components/button_widget.dart';
import 'package:hotels_app/components/image_widget.dart';
import 'package:hotels_app/components/text_field_widget.dart';
import 'package:hotels_app/components/text_widget.dart';
import 'package:hotels_app/core/utils/validator.dart';
import 'package:hotels_app/core/values/app_assets.dart';
import 'package:hotels_app/core/values/app_colors.dart';
import 'package:hotels_app/core/values/app_strings.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    void myAlert() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              title: const TextWidget('Please choose media to select'),
              content: SizedBox(
                height: MediaQuery.of(context).size.height / 6,
                child: Column(
                  children: [
                    ElevatedButton(
                      //if user click this button, user can upload image from gallery
                      onPressed: () {
                        Navigator.pop(context);
                       // controller.getImage(ImageSource.gallery);
                      },
                      child: Row(
                        children: const [
                          Icon(Icons.image),
                          Text('From Gallery'),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      //if user click this button. user can upload image from camera
                      onPressed: () {
                        Navigator.pop(context);
                        // controller.getImage(ImageSource.camera);
                      },
                      child: Row(
                        children: const [
                          Icon(Icons.camera),
                          Text('From Camera'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    }

    const space = SizedBox(height: 20);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(

                  margin: EdgeInsets.only(top: 40.h),
                  child: ImageWidget(path: AppAssets.logoImg,width: 100,height:110,),),
              Padding(
                padding:  EdgeInsets.only(top: 0.h),
                child: TextWidget(AppStrings.Welcome,textColor: AppColors.appHallsRedDark,weight:FontWeight.bold,size: size.height*.05,),
              ),
              Container(
                // margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: controller.registerForm,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFieldWidget(

                        controller:controller.userNameController,
                        label: AppStrings.userName,
                        suffixIcon: Icons.pin,
                        textInputAction: TextInputAction.next,
                        // onChange: (value) => controller.requestDto.userName = value,
                        validator: AppValidator.forceValue,
                      ),
                      space,
                      TextFieldWidget(
                        controller:controller.nameController,
                        label: AppStrings.name,
                        suffixIcon: Icons.pin,
                        textInputAction: TextInputAction.next,
                        // onChange: (value) => controller.requestDto.name = value,
                        validator: AppValidator.forceValue,
                      ),
                      space,
                      // TextFieldWidget(
                      //   controller:controller.emailController,
                      //   label: AppStrings.email,
                      //   suffixIcon: Icons.email,
                      //   textInputAction: TextInputAction.next,
                      //   onChange: (value) => controller.requestDto.email = value,
                      //   validator: AppValidator.forceValue,
                      // ),
                      // space,
                      TextFieldWidget(
                        controller:controller.phoneController,
                        label: AppStrings.email,
                        suffixIcon: Icons.email,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.emailAddress,
                        // onChange: (value) => controller.requestDto.phone = value,

                        validator: AppValidator.forceValue,
                      ),
                      space,
                      TextFieldWidget(
                        controller:controller.passwordController,
                        label: AppStrings.password,
                        suffixIcon: Icons.password,
                        // onChange: (value) => controller.requestDto.password = value,
                        validator: AppValidator.forceValue,
                        obscure: true,
                      ),
                      space,
                      TextFieldWidget(
                        controller:controller.passwordConfirmController,
                        label: AppStrings.passwordConfirm,
                        suffixIcon: Icons.password,
                        validator:(val) => AppValidator.checkIfTheSame(value: val , checkWith: controller.passwordController.text),
                        obscure: true,
                      ),
                      // space,
                      // const TextWidget(AppStrings.language,weight: FontWeight.bold,),
                      // Obx(() => Directionality(
                      //   textDirection: TextDirection.rtl,
                      //   child: DropdownSearch<LanguageResponse>(
                      //     // showSearchBox: true,
                      //     items: controller.language,
                      //     itemAsString: (e) => e.name!,
                      //     dropdownDecoratorProps: const DropDownDecoratorProps(
                      //       textAlign: TextAlign.center,
                      //       textAlignVertical: TextAlignVertical.center,
                      //     ),
                      //     onChanged: (value) => controller.changeSelectedLanguage(value!),
                      //     selectedItem: controller.selectedLanguage.value,
                      //   ),
                      // )),
                      // space,
                      // const TextWidget(AppStrings.currency,weight: FontWeight.bold,),
                      // Obx(() => Directionality(
                      //   textDirection: TextDirection.rtl,
                      //   child: DropdownSearch<CurrencyResponse>(
                      //     // showSearchBox: true,
                      //     items: controller.currency,
                      //     itemAsString: (e) => e.name!,
                      //     dropdownDecoratorProps: const DropDownDecoratorProps(
                      //       textAlign: TextAlign.center,
                      //       textAlignVertical: TextAlignVertical.center,
                      //
                      //     ),
                      //     onChanged: (value) => controller.changeSelectedCurrency(value!),
                      //     selectedItem: controller.selectedCurrency.value,
                      //   ),
                      // )),

                      // space,
                      // const TextWidget(AppStrings.city,weight: FontWeight.bold,),
                      // Obx(() => Directionality(
                      //   textDirection: TextDirection.rtl,
                      //   child: DropdownSearch<CityResponse>(
                      //     // showSearchBox: true,
                      //     items: controller.city,
                      //     itemAsString: (e) => e.name!,
                      //     dropdownDecoratorProps: const DropDownDecoratorProps(
                      //       textAlign: TextAlign.center,
                      //       textAlignVertical: TextAlignVertical.center,
                      //     ),
                      //     onChanged: (value) => controller.changeSelectedCity(value!),
                      //     selectedItem: controller.selectedCity.value,
                      //   ),
                      // )),

                      //
                      // ElevatedButton(
                      //   onPressed: () {
                      //     myAlert();
                      //   },
                      //   child: const TextWidget('Upload Photo'),
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      //if image not null show the image
                      //if image null show text
                      // controller.image != null
                      //     ? Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 20),
                      //   child: ClipRRect(
                      //     borderRadius: BorderRadius.circular(8),
                      //     child: Image.file(
                      //       //to show image, you type like this.
                      //       File(controller.image!.path),
                      //       fit: BoxFit.cover,
                      //       width: MediaQuery.of(context).size.width,
                      //       height: 500,
                      //     ),
                      //   ),
                      // )
                      //     : const TextWidget(
                      //   "No Image",
                      //   size: 20,
                      // ),
                      space,

                      ButtonWidget(
                        text: AppStrings.register,
                        onPressed: () => controller.register(),
                        expanded: true,
                        fontColor: Colors.white,
                        fontSize: size.height*.026,
                        buttonColor: Theme.of(context).primaryColor,
                        contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
