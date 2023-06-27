import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotels_app/components/image_widget.dart';
import 'package:hotels_app/components/text_widget.dart';
import 'package:hotels_app/core/utils/common.dart';
import 'package:hotels_app/core/utils/show_popup_text.dart';
import 'package:hotels_app/core/values/app_colors.dart';
import 'package:hotels_app/core/values/app_strings.dart';
import 'package:hotels_app/routes/app_pages.dart';
import '../controllers/room_details_controller.dart';

class RoomDetailView extends GetView<RoomDetailController> {
  const RoomDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    bool onshow = true;

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,

        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(
              child: Common.getSpin(),
            );
          }
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: SizedBox(
                  height: 250.h,
                  child: ImageWidget(
                    path:
                        controller.selectedImage.value.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                      height: size.height * .1,
                      child: ListView.builder(
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                            child: GestureDetector(
                              onTap: () {
                                controller.setSelectedImage(
                                   " controller.room!.itemImages![index].image");
                              },
                              child: ImageWidget(
                                path:
                                    "controller.room!.itemImages![index].image",
                                radius: 20.w,
                                width: size.width * .3,
                                height: size.height * .18,
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                      ))
                  ,
              SizedBox(
                width: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                            child: Container(
                              width: size.width * .75,
                              height: size.height * .12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      TextWidget(
                                       controller.room['name'],
                                        weight: FontWeight.bold,
                                        textColor: AppColors.appBlue,
                                        size: 25,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 0, 8, 0),
                                        child: TextWidget(
                                          "3",
                                          weight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  TextWidget(
                                    "controller.room!.branchName!",
                                    weight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          TextWidget(
                            controller.room['price'].toString(),
                            size: 15.0,
                            textColor: Colors.grey[700],
                            weight: FontWeight.bold,
                          ),
                        ],
                      ),

                      SizedBox(
                        width: size.width * .9,
                        child: const TextWidget(
                          "AppStrings.roomDetail",
                          textAlign: TextAlign.start,
                          weight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: size.width * .9,
                        height: size.height * .06,
                        child: GridView.count(
                          crossAxisCount: 3,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0,
                          childAspectRatio: size.aspectRatio * 5,
                          padding: EdgeInsets.zero,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                              child: TextWidget(
                               "4"+
                                    AppStrings.balconies,
                                weight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                              child: TextWidget(
                               "3" +
                                      AppStrings.bathrooms,
                                  weight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                              child: TextWidget(
                                  "4" +
                                      AppStrings.beds,
                                  weight: FontWeight.bold),
                            ),

                            // for(int i = 0; i <= 4; i++)
                            //   const Center(child: TextWidget(
                            //       'قاعة اضافية', weight: FontWeight.bold)
                            //
                            //   )
                          ],
                        ),
                      ),

                      SizedBox(
                        width: size.width * .9,
                        child: const TextWidget(AppStrings.reviews,
                            textAlign: TextAlign.start,
                            weight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * .65,
                            height: size.height * .12,
                            child: SizedBox(
                              width: size.width * .23,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          const TextWidget(
                                            AppStrings.clean,
                                            weight: FontWeight.bold,
                                            textAlign: TextAlign.center,
                                          ),
                                          RatingBar.builder(
                                            initialRating: 3,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: 10.0,
                                            ignoreGestures: true,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 1.0),
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              // print(rating);
                                            },
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const TextWidget(
                                            AppStrings.clientsEvaluation,
                                            weight: FontWeight.bold,
                                            textAlign: TextAlign.center,
                                          ),
                                          RatingBar.builder(
                                            initialRating:4,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: 10.0,
                                            ignoreGestures: true,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 1.0),
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          const TextWidget(
                                            AppStrings.teamWorkEvaluation,
                                            weight: FontWeight.bold,
                                            textAlign: TextAlign.center,
                                          ),
                                          RatingBar.builder(
                                            initialRating: 5,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: 10.0,
                                            ignoreGestures: true,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 1.0),
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const TextWidget(
                                            AppStrings.recipeEvaluation,
                                            weight: FontWeight.bold,
                                            textAlign: TextAlign.center,
                                          ),
                                          RatingBar.builder(
                                            initialRating: 4,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: 10.0,
                                            ignoreGestures: true,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 1.0),
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              // print(rating);
                                            },
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: SizedBox(
                              width: size.width * .35,
                              child: CircleAvatar(
                                backgroundColor: AppColors.appBlue,
                                radius: 40,
                                child: CircleAvatar(
                                  backgroundColor: Colors.blueAccent,
                                  radius: 32,
                                  child: TextWidget(
                                    "4",
                                    weight: FontWeight.bold,
                                    size: 20,
                                    textColor: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: size.width * .9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(AppStrings.location,
                                weight: FontWeight.bold,
                                size: size.width * 0.045),
                            GestureDetector(
                              onTap: () {
                                // if (controller.room!.recipeEvaluation == null ||
                                //     controller.room!.recipeEvaluation == null) {
                                //   showPopupText(
                                //       AppStrings.locationNotAvailable.tr);
                                //   return;
                                // }
                                // Get.toNamed(Routes.MAP, arguments: [
                                //   LatLng(controller.room!.lat!,
                                //       controller.room!.lang!),
                                //   controller.room?.name?.toString() ?? "",
                                //   ApiProvider.imageUrl +
                                //       (controller.room?.image?.toString() ??
                                //           ""),
                                // ]);
                              },
                              child: SizedBox(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.directions,
                                      size: size.width * .1,
                                      color: AppColors.appBlue,
                                    ),
                                    TextWidget(
                                      AppStrings.directions,
                                      weight: FontWeight.w900,
                                      size: size.width * 0.045,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: size.width * .9,
                        height: size.height * .002,
                        color: Colors.grey[500],
                      ),
                      // for(int i  =0 ; i<_rooms!.groupRemarkDTOList!.length ;i++)

                      SizedBox(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextWidget(
                            AppStrings.around,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(
                            height:
                                onshow ? size.height * .3 : size.height * .3,
                            width: size.width * .9,
                            child: SingleChildScrollView(
                              physics: const AlwaysScrollableScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // SizedBox(
                                  //   width: size.width * .9,
                                  //   child: Column(
                                  //     crossAxisAlignment:
                                  //         CrossAxisAlignment.start,
                                  //     children: [
                                  //       for (RemarkGroupModel remark
                                  //           in controller
                                  //               .room!.groupRemarkDTOList!)
                                  //         Column(
                                  //           crossAxisAlignment:
                                  //               CrossAxisAlignment.start,
                                  //           children: [
                                  //             TextWidget(
                                  //               remark.name!,
                                  //               weight: FontWeight.bold,
                                  //             ),
                                  //             for (int x = 0;
                                  //                 x <
                                  //                     remark
                                  //                         .remarkDtoListForGroup!
                                  //                         .length;
                                  //                 x++)
                                  //               Row(
                                  //                 children: [
                                  //                   const Icon(
                                  //                     Icons.home,
                                  //                     color: AppColors.appBlue,
                                  //                   ),
                                  //                   TextWidget(
                                  //                     remark
                                  //                         .remarkDtoListForGroup![
                                  //                             x]
                                  //                         .name!,
                                  //                     weight: FontWeight.bold,
                                  //                   )
                                  //                 ],
                                  //               ),
                                  //           ],
                                  //         ),
                                  //     ],
                                  //     // _rooms!.groupRemarkDTOList![i].remarkDtoListForGroup![i].groupId,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                      Container(
                        width: size.width * .9,
                        height: size.height * .002,
                        color: Colors.grey[500],
                      ),
                      Container(
                        width: size.width,
                        child: Row(
                          children: [
                            SizedBox(
                              width: size.width * .25,
                            ),
                            Container(
                              margin: const EdgeInsets.all(20),
                              child: ElevatedButton.icon(
                                label: const TextWidget(
                                  AppStrings.reserve,
                                  weight: FontWeight.bold,
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: AppColors.appBlue,
                                    textStyle: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  controller.saveOrder();
                                  Get.toNamed(Routes.ROOMS,
                                      // arguments: controller.room
                                  );
                                },
                                icon: const Icon(Icons.mail),
                              ),
                            ),
                            TextWidget(
                            "666" +
                                  AppStrings.LE,
                              weight: FontWeight.bold,
                              size: 20,
                            )
                          ],
                        ),
                      ),

                      // buildbar(size, roomsGroups!)
                    ]),
              )
            ],
          );
        }));
  }
}
