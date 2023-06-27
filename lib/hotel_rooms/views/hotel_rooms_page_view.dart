
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:hotels_app/components/text_widget.dart';
import 'package:hotels_app/core/utils/common.dart';
import 'package:hotels_app/core/values/app_colors.dart';
import 'package:hotels_app/core/values/app_strings.dart';
import 'package:hotels_app/hotel_rooms/views/widgets/rooms_search_card.dart';
import '../controllers/hotel_rooms_page_controller.dart';


class HotelRoomsPageView extends GetView<HotelRoomsPageController> {
  const HotelRoomsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;


    RangeValues _currentRangeValues = const RangeValues(40, 80);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.appHallsRedDark,
        foregroundColor: Colors.white,
        title: const TextWidget(
          AppStrings.cityRooms, size: 25,
          weight: FontWeight.bold,
          textColor: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if(controller.isLoading.value){
          return Center(
            child: Common.getSpin(),
          );
        }
        return
          ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20.h, 0, 20.h, 0),
                  child: TextWidget(AppStrings.rooms, textAlign: TextAlign.left,
                    weight: FontWeight.bold,
                    size: 20.h,),
                ),
                SizedBox(
                  height: size.height * .8,
                  child:
                  ListView.builder(
                    itemCount: controller.searchResults.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return  RoomsCardWidget( price: controller.searchResults[index]["price"], image:"", title:controller.searchResults[index]["name"], subtitle:controller.searchResults[index]["city"],id:controller.id!,collection: controller.args[0],onTap:(){},);
                    },

                  ),),
              ],
            ),


          ],
        );
      }),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        backgroundColor: AppColors.appBlue,
        closeButtonHeroTag: UniqueKey(),
        openButtonHeroTag: UniqueKey(),
        child: const Icon(Icons.filter_list_rounded, color: Colors.white,),
        children: [
          FloatingActionButton.small(
            backgroundColor: AppColors.appBlue,
            child: const Icon(Icons.filter, color: Colors.white,),
            onPressed: () {
              Widget okButton = TextButton(
                child: const Center(child: TextWidget(
                  AppStrings.search,
                  textColor: Colors.white,
                  size: 15,
                  weight: FontWeight.bold,)),
                onPressed: () {
                  // controller.getRoomsHotel();
                  Get.back();
                },
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return StatefulBuilder(
                      builder: (context, setState) {
                        return AlertDialog(
                          title: const Center(child: TextWidget(
                            "Filter", weight: FontWeight.bold,)),
                          content: SizedBox(
                            height: size.height,
                            width: size.width,

                            child: SingleChildScrollView(
                              physics: const AlwaysScrollableScrollPhysics(),
                              child: Obx(() {
                                return Column(
                                  children: [

                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 15, 0, 0),
                                      child: Container(width: size.width * .82,
                                        height: size.height * .2,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          // color: Colors.white
                                        ),
                                        child: Row(
                                          children: [
                                            Container(width: size.width * .3,
                                              height: size.height * .2,
                                              child: Center(
                                                child: GestureDetector(
                                                  onTap: () {},
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      const TextWidget(
                                                          AppStrings.priceFrom),
                                                      TextWidget(
                                                          controller
                                                              .currentRangeValues
                                                              .start
                                                              .round()
                                                              .toString()),
                                                      const TextWidget(
                                                          AppStrings.LE),

                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                            , Container(
                                              width: size.width * .005,
                                              height: size.height * .18,
                                              color: Colors.black,

                                            ),
                                            SizedBox(width: size.width * .3,
                                              height: size.height * 2,
                                              child: Center(
                                                child: GestureDetector(
                                                  onTap: () {},
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      const TextWidget(
                                                          AppStrings.priceTo),
                                                      Text(controller
                                                          .currentRangeValues
                                                          .end
                                                          .round().toString(),),
                                                      const TextWidget(
                                                          AppStrings.LE),

                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    RangeSlider(
                                      values: controller.currentRangeValues,
                                      max: 10000,
                                      divisions: 10000,
                                      labels: RangeLabels(
                                        controller.currentRangeValues.start
                                            .round()
                                            .toString(),
                                        controller.currentRangeValues.end
                                            .round().toString(),
                                      ),
                                      onChanged: (RangeValues values) {
                                        setState(() {
                                          controller.currentRangeValues =
                                              values;
                                        });
                                      },
                                    ),
                                    Obx(() =>
                                        Container(
                                          width: size.width * 0.8,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius
                                                .circular(size.width * 0.03),
                                            // color: AppColors.appRedLight
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Center(
                                              child: Column(
                                                children: [
                                                  RatingBar.builder(
                                                    initialRating: 0,
                                                    minRating: 1,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: false,
                                                    itemCount: 5,
                                                    itemSize: size.width * 0.1,
                                                    itemPadding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 0.0),
                                                    itemBuilder: (context, _) =>
                                                    const Icon(
                                                      Icons.star,
                                                      color: AppColors
                                                          .appHallsRedDark,
                                                    ),
                                                    onRatingUpdate: (value) =>
                                                        controller
                                                            .changeSelectedStarsNumber(
                                                            value.toInt()),
                                                  ),
                                                  TextWidget(
                                                    "${controller
                                                        .selectedStarsNumber
                                                        .value}${AppStrings.stars}",
                                                    textColor: Colors.grey,
                                                    size: 16,
                                                    weight: FontWeight.w600,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                    ),


                                  ],
                                );
                              }),
                            ),
                          ),
                          actions: [
                            Center(
                              child: Container(
                                  height: size.height * .06,
                                  width: size.width * .4,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(6.00)),
                                    color: Colors.blueAccent,
                                  ),
                                  child: okButton),
                            ),
                          ],
                        );
                      });
                },
              );
            },
          ),
          FloatingActionButton.small(
            backgroundColor: AppColors.appBlue,
            child: const Icon(Icons.sort, color: Colors.white,),
            onPressed: () {


            },
          ),
        ],
      ),
    );
  }
}
