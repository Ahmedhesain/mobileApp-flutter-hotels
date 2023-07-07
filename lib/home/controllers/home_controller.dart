import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotels_app/acoount_homepage/controllers/my_account_controller.dart';
import 'package:hotels_app/acoount_homepage/views/my_account_view.dart';
import 'package:hotels_app/login/controllers/login_controller.dart';
import 'package:hotels_app/login/views/login_view.dart';
import 'package:hotels_app/my_orders/controllers/my_orders_controller.dart';
import 'package:hotels_app/my_orders/views/my_orders_view.dart';
import 'package:hotels_app/rooms_homepage/controllers/rooms_controller.dart';
import 'package:hotels_app/rooms_homepage/views/rooms_view.dart';



class HomeController extends GetxController {

  final pageIndex = 0.obs;
  List<Widget> pages = const[
    // RoomsView(),
    RoomsView(),
    MyOrdersView(),
    MyAccountView(),
  ];

  @override
  void onInit() {
    Get.put(RoomsController());
    Get.put(MyOrdersController());
    Get.put(MyAccountController());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  void changeView(int index) {pageIndex.value = index;
  MyOrdersController().getOrders();
  MyOrdersController().update();

  }
}
