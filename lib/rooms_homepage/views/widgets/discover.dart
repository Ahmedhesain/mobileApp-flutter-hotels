import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotels_app/components/image_widget.dart';
import 'package:hotels_app/components/text_widget.dart';
import 'package:hotels_app/routes/app_pages.dart';


class DiscoverCard extends StatelessWidget {
  const DiscoverCard({Key? key, required this.image, required this.name, this.onTap, required this.id}) : super(key: key);
  final String image;
  final String name;
  final String id;
  final Function()? onTap;



  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return GestureDetector(onTap: (){
    Get.toNamed(Routes.HOTEL_ROOMS,arguments: [id]);
    },
      child: Container(
        width: size.width * .45,
        height: size.height * .2,
        decoration:const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(
              10.0)),

        ),

        child: Column(
          children: [
            Container(
              height: size.height * 0.13,
              width: size.width * 0.4,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
              ),
             child: ImageWidget(path : image),
            ), SizedBox(width: size.width*.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextWidget(
                    name,
                    maxLines: 2,
                    weight: FontWeight.bold,
                  ),
                ],),
            )

          ],
        ),
      ),
    );
  }
}
