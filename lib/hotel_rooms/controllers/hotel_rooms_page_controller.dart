
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class HotelRoomsPageController extends GetxController {
  final isLoading = false.obs;
  final List args = Get.arguments;
  final selectedStarsNumber = 1.obs;
  RangeValues currentRangeValues = const RangeValues(0, 10000);
  late double from=0.0.obs();
   String ? id;
  late double to=10000.0.obs();

final searchResults=[].obs();


  @override
  void onInit() {
    super.onInit();
    getSearchResults();



  }


  Future getSearchResults() async {
    isLoading(true);
    try{
      await FirebaseFirestore.instance.collection(args[0]).get().then((querySnapshot){
        final searchList = querySnapshot.docs.map((doc) => doc.data()).toList();
         final intialId = querySnapshot.docs.map((doc) => doc.id).toString().substring(1);
         id=intialId.substring(0,intialId.length-1);
        searchResults.assignAll(searchList);
        print(searchResults);
        isLoading(false);

      });
    }catch(e){print(e);}

  }

  changeSelectedStarsNumber(int selected) {
    selectedStarsNumber(selected);
  }
}
