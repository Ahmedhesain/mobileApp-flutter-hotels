
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotels_app/components/text_widget.dart';
import 'package:hotels_app/core/values/app_colors.dart';
import 'package:hotels_app/core/values/app_strings.dart';
import 'package:hotels_app/routes/app_pages.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class RoomsCardWidget extends StatelessWidget {
  const RoomsCardWidget({Key? key, required this.price,required this.collection, required this.image, required this.title, required this.subtitle, required this.id, this.onTap, required this.rate}) : super(key: key);
  final String price;
  final String id;
  final String collection;
  final String image;
  final String title ;
  final String subtitle ;
  final Function()? onTap;
  final double rate;


  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return GestureDetector(onTap: (){
      Get.toNamed(Routes.ROOM_DETAIL,arguments:[id,collection] );     },
      child: Column(
        children: [


          Padding(
            padding:  EdgeInsets.fromLTRB(size.width*.05, size.height*.01, size.width*.05, size.height*.005),
            child: Container(
              height: size.height*.2,
              width: size.width*.9,
              decoration:const  BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)),
                color: AppColors.appGreyDark,
              ),


              child:Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Row(
                    children: [
                      Container(
                        height:  size.height * 0.2,
                        width: size.width * 0.28,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  image)
                            )
                        ),

                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: SizedBox(width: size.width*.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:   [
                              TextWidget(title,textColor: Colors.black,size: 20,weight: FontWeight.bold),
                              TextWidget(subtitle, textColor: Colors.grey,size: 12,weight: FontWeight.bold,),
                              TextWidget("${price.toString()}"+AppStrings.LE,textColor: Colors.grey,size: 10,weight: FontWeight.bold,),
                              Expanded(
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    RatingBar.builder(
                                        initialRating: rate!,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 20.0,
                                        ignoreGestures: true,
                                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: AppColors.colorLogo,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        }),

                                    GestureDetector(

                                      child: Container(alignment: Alignment.centerRight,

                                        height: size.height*.04,
                                        width: size.width*.19,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all( Radius.circular(20.00)),color: AppColors.appHallsRedDark,
                                        ),
                                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(0, 0, 5, 5),
                                              child: Center(child: TextWidget(AppStrings.reserve,weight: FontWeight.bold,textColor: Colors.white,)),
                                            ),
                                          ],
                                        ),

                                      ),
                                    ),
                                  ],
                                ),
                              )

                            ],
                          ),
                        ),
                      ),
                    ]
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
}