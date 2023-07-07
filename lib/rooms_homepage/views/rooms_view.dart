
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:hotels_app/components/text_field_widget.dart';
import 'package:hotels_app/components/text_widget.dart';
import 'package:hotels_app/core/utils/common.dart';
import 'package:hotels_app/core/values/app_assets.dart';
import 'package:hotels_app/core/values/app_strings.dart';
import 'package:hotels_app/rooms_homepage/views/widgets/discover.dart';
import 'package:hotels_app/rooms_homepage/views/widgets/offer_card.dart';
import 'package:hotels_app/rooms_homepage/views/widgets/towns.dart';
import 'package:hotels_app/routes/app_pages.dart';

import '../controllers/rooms_controller.dart';
import 'widgets/advertisment_card.dart';

class RoomsView extends GetView<RoomsController> {
  const RoomsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(

        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          leading: GestureDetector(
              onTap: (){
                FirebaseAuth.instance.signOut();
                Get.toNamed(Routes.LOGIN);
              },
              child: Container(

                  child: Icon(Icons.logout))),
          title: TextWidget(
            AppStrings.home, size: 30.h, textColor: Colors.white,),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.black87,
                      Colors.black87,
                      Colors.black.withOpacity(.7),
                      Colors.black.withOpacity(.6),
                      Colors.transparent
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                )
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.zero,
          children: [

            Container(
              height: 300.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppAssets.rooms), fit: BoxFit.cover)),

              padding: EdgeInsets.fromLTRB(
                  size.width * .1, 175.h, size.width * .1, 0),
              child: Column(
                children: [
                  Center(
                      child: TextWidget(
                        AppStrings.searchlabel, textColor: Colors.white,
                        size: 20.h,
                        weight: FontWeight.bold,)),
                  Row(
                    children: [
                      SizedBox(
                          width: size.width * .8,

                          child:
                          GestureDetector(
                            onTap: () {
                            },
                            child: TextFieldWidget(
                              enabled: false,
                              hint: AppStrings.search,
                              suffixIcon: Icons.search,
                              ltr: true,
                              onTap: () {
                                Get.toNamed(Routes.HOTEL_ROOM_SEARCH_FILTER);
                              },

                            ),
                          )


                      ),

                    ],
                  )
                ],
              ),


            ),

              // if(controller.isLoading.value){
              //   return Center(
              //     child: Common.getSpin(),
              //   );
              // }
               Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() {
                      if (controller.roomsOfferLoading.value) {
                        return Center(
                          child: Common.getSpin(),
                        );
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Padding(
                            padding: EdgeInsets.fromLTRB(20.h, 0, 20.h, 0),
                            child: TextWidget(
                              AppStrings.offers, textAlign: TextAlign.left,
                              weight: FontWeight.bold,
                              size: 20.h,),
                          ),
                          SizedBox(
                              height: size.height * .25,
                              child:
                              ListView.builder(
                                itemCount: controller.offers.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return RoomCard(
                                    name: controller.offers[index]["name"]!,
                                    price:
                                    controller.offers[index]["price"],
                                    stars:3,
                                    percentage:0,
                                    id:  controller.offersId[index],
                                    image:  controller.offers[index]["img1"],
                                    sale: 1,);
                                },

                              )
                          ),
                        ],
                      );
                    }),
                    Obx(() {
                      if (controller.roomsCitiesLoading.value) {
                        return Center(
                          child: Common.getSpin(),
                        );
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(20.h, 0, 20.h, 0),
                            child: TextWidget(
                              AppStrings.towns, textAlign: TextAlign.left,
                              weight: FontWeight.bold,
                              size: 20.h,),
                          ),
                          SizedBox(
                              height: size.height * .18,
                              child:
                              ListView.builder(
                                itemCount: controller.cities.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return TownCard(image:controller.cities[index]["img"], name: controller.cities[index]["name"],
                                    id:controller.cities[index]['name'],);
                                },

                              )
                          ),
                        ],
                      );
                    }),

                    Obx(() {
                      if (controller.roomsAdsLoading.value) {
                        return Center(
                          child: Common.getSpin(),
                        );
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(20.h, 0, 20.h, 0),
                            child: TextWidget(
                              AppStrings.advertisement, textAlign: TextAlign.left,
                              weight: FontWeight.bold,
                              size: 20.h,),
                          ),
                          SizedBox(
                              height: size.height * .25,
                              child:
                              ListView.builder(
                                itemCount: controller.ads.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return AdCard(
                                    id:1,
                                    name: controller.ads[index]["name"],
                                    hotel: "hotels.com",
                                    image:controller.ads[index]["img"],
                                  onTap: controller.launchURL,);
                                },

                              )
                          ),
                        ],
                      );
                    }),

                    Obx(() {
                      if(controller.roomsDiscoverLoading.value){
                        return Center(
                          child: Common.getSpin(),
                        );
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Padding(
                            padding: EdgeInsets.fromLTRB(20.h, 0, 20.h, 0),
                            child: TextWidget(
                              AppStrings.discover, textAlign: TextAlign.left,
                              weight: FontWeight.bold,
                              size: 20.h,),
                          ),
                          SizedBox(
                              height: size.height * .18,
                              child:
                              ListView.builder(
                                itemCount:controller.discover.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return DiscoverCard(
                                      id: controller.discover[index]["name"],
                                      image: controller.discover[index]["img"],
                                      name:  controller.discover[index]["name"]);
                                },

                              )
                          ),
                        ],
                      );
                    }),


                  ])
          ],
        )
    );
  }
}
