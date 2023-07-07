
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotels_app/components/text_widget.dart';
import 'package:hotels_app/core/utils/common.dart';
import 'package:hotels_app/core/values/app_colors.dart';
import 'package:hotels_app/core/values/app_strings.dart';
import 'package:hotels_app/my_orders/controllers/my_orders_controller.dart';
import 'package:hotels_app/my_orders/views/widgets/order_widget.dart';

class MyOrdersView extends GetView<MyOrdersController> {
  const MyOrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorLogo,
        // leading: GestureDetector(
        //     onTap: () {
        //       Get.back();
        //     },
        //     child: const Icon(Icons.arrow_back_ios)),
        title: const TextWidget(
          AppStrings.ordesr,
          weight: FontWeight.bold,
          size: 20,
        ),
        actions: [
          // UnconstrainedBox(
          //   child: IconButtonWidget(
          //     icon: Icons.notifications,
          //     onPressed: () {
          //       // FavProductsManager().addProduct(controller.room!, context);
          //     },
          //   ),
          // ),
          const SizedBox(width: 10),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: Common.getSpin(),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (var order in controller.orders)
                  OrderWidget(
                    appId:1 ,
                    branchId: 1,
                    cancel:null,
                    id: 1,
                    image: order['img'],
                    itemId: 1,
                    price: 111,
                    rate:1,
                    reviewId: 1,
                    statue: order['name'],
                    subtitle: "",
                    title: order['name'],
                      )
              ],
            ),
          ),
        );
      }),
    );
  }
}
