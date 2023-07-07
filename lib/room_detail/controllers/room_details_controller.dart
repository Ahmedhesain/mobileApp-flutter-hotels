import 'dart:convert';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotels_app/core/utils/show_popup_text.dart';

class RoomDetailController extends GetxController {
  final List args = Get.arguments;
  RxInt index = 1.obs;
  RxInt serviceIndex = 0.obs;
  RxInt selectedType = 1.obs;
  // RoomResponse? room;
  final isLoading = false.obs;
  final servicesSelected = <int>[].obs;
  final allImages =<String> [].obs;
  final Rxn selectedImage = Rxn();
  final isFavourite = false.obs;
   Map<String, dynamic> room={};
  final user= FirebaseAuth.instance.currentUser;

  @override
  void onInit()  {
    super.onInit();
    getRoomDetail();

  }

  Future getRoomDetail() async {
    isLoading(true);
    try{
      DocumentSnapshot pathData = await FirebaseFirestore.instance
          .collection(args[1])
          .doc(args[0])
          .get();

      if (pathData.exists) {
        Map<String, dynamic>? fetchDoc = pathData.data() as Map<String, dynamic>?;
        room =fetchDoc!;
        allImages.add(room["img2"]);
        allImages.add(room["img3"]);
        allImages.add(room["img4"]);
        allImages.add(room["img5"]);
        print(room['name']);
        isLoading(false);

    }
    }catch(e){print(e);}

  }

  Future saveOrder() async {
    isLoading(true);
    try{var myData = {'name': room['name'], 'price': room['price'],'email':user!.email,'img': room['img1']};

    var collection = FirebaseFirestore.instance.collection('orders');
      collection
          .add(myData) // <-- Your data
          .then((_) => print('Added'))
          .catchError((error) => print('Add failed: $error'));

        isLoading(false);
    showPopupText("تم الحجز بنجاح");


    }catch(e){print(e);}

  }


  setSelectedImage(String? image) {
    selectedImage(image);
  }

}
