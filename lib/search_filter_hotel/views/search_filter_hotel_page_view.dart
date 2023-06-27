
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:hotels_app/components/text_field_widget.dart';
import 'package:hotels_app/components/text_widget.dart';
import 'package:hotels_app/core/values/app_colors.dart';
import 'package:hotels_app/core/values/app_strings.dart';
import 'package:hotels_app/routes/app_pages.dart';
import '../controllers/search_filter_hotel_page_controller.dart';


class RoomSearchFilterHotelPageView extends GetView<RoomSearchFilterHotelPageController> {
  const RoomSearchFilterHotelPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    Size size =MediaQuery.of(context).size;

    DateTime selectedDate = DateTime.now();
    DateTime selectedDatetwo = DateTime.now();
    _selectDate(BuildContext context) async {
      final DateTime? selected = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2025),
      );
      // if (selected != null && selected != selectedDate)
        // setState(() {
        //   selectedDate = selected;
        // });
    }

    return Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            toolbarHeight: size.height * .16,
            backgroundColor: AppColors.appHallsRedDark,
            title: SizedBox(width: size.width,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                  child: GestureDetector(
                    onTap: () {},
                    child: TextWidget(AppStrings.search,size:size.width * 0.075 ,weight: FontWeight.w900 ,textColor:AppColors.white
                    ),
                  ),
                ),
                ],),
            )


        ),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            // color: AppColors.appGreyLight,
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.fromLTRB(size.width*.1, 15, 0, 0),
                      child: SizedBox(
                          width: size.width * .8,

                          child:

                              TextFieldWidget(
                                controller: controller.searchController,
                                label: AppStrings.search,
                                suffixIcon: Icons.search,
                                // onChange: (value) =>
                                // controller.requestDto.password = value,

                                ltr: true,
                              )
                          // TextFieldWidget(
                          //   controller: controller.searchController,
                          //   enabled: false,
                          //   hint: AppStrings.search,
                          //   suffixIcon: Icons.search,
                          //   ltr: true,
                          //
                          //
                          // )


                      ),
                    ),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Container(
                    width: size.width * .81, height: size.height * .15,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        // color: Colors.white
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: size.width * .4,
                          height: size.height * .15,
                          child: Center(
                            child: GestureDetector(onTap: () {
                              controller.selectEndDate(context);
                            },
                              child: Obx(() {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const TextWidget(
                                      AppStrings.arrivalTime, weight: FontWeight.bold,),
                                    TextWidget(
                                      "${controller.selectedDatetwo.value
                                          .day}/${controller.selectedDatetwo
                                          .value
                                          .month}/${controller.selectedDatetwo
                                          .value
                                          .year}", textAlign: TextAlign.center,
                                      weight: FontWeight.bold,),

                                  ],
                                );
                              }),
                            ),
                          ),
                        )
                        , Container(
                          width: size.width * .005,
                          height: size.height * .13,
                          color: Colors.black,

                        ), SizedBox(width: size.width * .4,
                          height: size.height * 15,
                          child: Center(
                            child: GestureDetector(onTap: () {
                              controller.selectDate(context);
                            },
                              child: Obx(() {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const TextWidget(AppStrings.leavingTime,
                                      weight: FontWeight.bold,),
                                    TextWidget("${controller.selectedDate.value
                                        .day}/${controller.selectedDate.value
                                        .month}/${controller.selectedDate.value
                                        .year}", textAlign: TextAlign.center,
                                      weight: FontWeight.bold,),

                                  ],
                                );
                              }),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Obx(() {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(0, size.height * .1, 0, 0),
                    child: SizedBox(
                      height: size.height * .31, width: size.width * .8,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  height: size.height * .07,

                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 10, 0, 0),
                                    child: SizedBox(width: size.width * .3,
                                        child: const TextWidget(AppStrings.children,
                                          weight: FontWeight.bold,size: 20,)),
                                  )),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5)),
                                    border: Border.all(
                                        color: AppColors.appGreyDark),
                                    // color: AppColors.appGreyDark
                                ),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        controller.children.value++;
                                      },
                                      child: const TextWidget(
                                        '+', weight: FontWeight.bold,size: 25,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 0),
                                      child: TextWidget(
                                        '${controller.children.value}',weight: FontWeight.bold,size: 25,),
                                    ),
                                    GestureDetector(onTap: () {
                                      controller.children.value--;
                                    },
                                      child: const TextWidget(
                                        '-', weight: FontWeight.bold,size: 25,),
                                    )
                                  ],
                                ),
                              )

                            ],
                          ),
                          Container(
                            width: size.width * .8,
                            height: size.height * .003,
                            color: Colors.grey[400],
                          ),
                          SizedBox(
                            height: size.height * .07,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: size.width * .3,
                                    child: const TextWidget(AppStrings.adults,
                                      weight: FontWeight.bold,size: 20,)),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      border: Border.all(
                                          color: AppColors.appGreyDark),
                                      // color: AppColors.appGreyDark
                                  ),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          controller.adults.value++;
                                        },
                                        child: const TextWidget(
                                          '+', weight: FontWeight.bold,size: 25,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: TextWidget(
                                          '${controller.adults.value}',
                                          weight: FontWeight.bold,size: 25,),
                                      ),
                                      GestureDetector(onTap: () {
                                        controller.adults.value--;
                                      },
                                        child: const TextWidget(
                                          '-', weight: FontWeight.bold,size: 25,),
                                      )
                                    ],
                                  ),
                                )

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }), GestureDetector(onTap: () {
                  Get.toNamed(Routes.HOTEL_ROOMS,arguments: [controller.searchController.text,controller.children.value,controller.adults.value,controller.selectedDate.value,controller.selectedDatetwo.value]);
                },
                  child: Container(
                    alignment: Alignment.centerRight,

                    height: size.height * .05,
                    width: size.width * .6,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6.00)),
                      color: AppColors.appHallsRedDark,
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const TextWidget(AppStrings.reserve,weight: FontWeight.bold,textColor: Colors.white,),
                      ],
                    ),

                  ),
                ),

              ],
            ),
          ),
        )
    );
  }

}
