import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hotels_app/core/values/app_colors.dart';
import 'package:hotels_app/core/values/app_strings.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final pageIndex = controller.pageIndex.value;
      return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              // BottomNavigationBarItem(icon: Icon(Icons.home,), label: '' ,  tooltip: AppStrings.home),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home' , tooltip: AppStrings.allServices),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,), label: "Trips" , tooltip: AppStrings.myAccount),
              BottomNavigationBarItem(icon: Icon(Icons.person,), label: "Profile" , tooltip: AppStrings.myAccount),
            ],
            onTap: (index) => controller.changeView(index),
            currentIndex:pageIndex ,
            iconSize: 24,
            selectedFontSize: 0.0,
            unselectedFontSize: 0.0,
            selectedItemColor: AppColors.appHallsRedDark,
          ),
          body: controller.pages[pageIndex]
    ,
    );
  });
  }
}
