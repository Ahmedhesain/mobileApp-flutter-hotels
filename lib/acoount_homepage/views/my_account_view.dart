
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotels_app/acoount_homepage/controllers/my_account_controller.dart';
import 'package:hotels_app/acoount_homepage/views/widgets/setting_tab_widget.dart';
import 'package:hotels_app/components/text_widget.dart';
import 'package:hotels_app/core/values/app_colors.dart';
import 'package:hotels_app/core/values/app_strings.dart';
import 'package:hotels_app/routes/app_pages.dart';


class MyAccountView extends GetView<MyAccountController> {
  const MyAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var  space= Container(height: 2,width: size.width,color: AppColors.colorLogo,);

    return Scaffold(
            // bottomNavigationBar: const AppBottomNavBar(index: 5),
      appBar: AppBar(
        backgroundColor: AppColors.colorLogo,
        elevation: 0,
        // leading:
        // GestureDetector(
        //     onTap: (){
        //       Get.back();
        //     },
        //     child: const Icon(Icons.arrow_back_ios)),
        title:
        const TextWidget(
          AppStrings.myProfile, weight: FontWeight.bold, size: 25,),
        actions: [
          // UnconstrainedBox(
          //   child: IconButtonWidget(
          //     icon:  Icons.notifications,
          //     onPressed: () {
          //       // FavProductsManager().addProduct(controller.room!, context);
          //     },
          //   ),
          // ),
          const SizedBox(width: 10),
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              const Align(
                alignment: Alignment.topCenter,
                child:Icon(Icons.person,color: AppColors.appHallsRedDark,size: 120,)
                // CircleAvatar(
                //   backgroundImage: NetworkImage("ApiProvider.imageUrl}image"),
                //   radius: 33.00,
                // ),
              ),
              TextWidget(controller.user!.email??"",weight: FontWeight.bold , size: 15,),
              space,
              const TextWidget(AppStrings.mange,weight: FontWeight.bold , size: 20,),

              GestureDetector(
                  onTap: (){
                    // Get.toNamed(Routes.CONTACT_US);
                  },
                  child: const SettingTabWidget(Icons.contact_support,AppStrings.contactUs)),
              space,
              GestureDetector(
                  onTap: (){
                    FirebaseAuth.instance.signOut();
                    Get.toNamed(Routes.LOGIN);
                    },
                  child: const SettingTabWidget(Icons.logout,AppStrings.logout)),







            ],
          ),
        ),
      )
      ,
    );

  }
}
