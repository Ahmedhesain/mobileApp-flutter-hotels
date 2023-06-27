import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RoomDetailController extends GetxController {
  final List args = Get.arguments;
  RxInt index = 1.obs;
  RxInt serviceIndex = 0.obs;
  RxInt selectedType = 1.obs;
  // RoomResponse? room;
  final isLoading = false.obs;
  final servicesSelected = <int>[].obs;
  final Rxn selectedImage = Rxn();
  final isFavourite = false.obs;
   Map<String, dynamic> room={};
  @override
  void onInit()  {
    super.onInit();
    getRoomDetail();
    print(args);
    print(args[0]);
    // await getRoomDetail();
  }
  // await FirebaseFirestore.instance.collection("offers/Qjo7ts0XJLs1iCMrvSx0").get().then((querySnapshot){
  // final searchList = querySnapshot.docs.map((doc) => doc.data()).toList();
  //
  // searchResults.assignAll(searchList);
  // print(searchResults);
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
        //Now use fetchDoc?['KEY_names'], to access the data from firestore, to perform operations , for eg
        // controllerName.text = fetchDoc?['userName']
        print(room['name']);
        isLoading(false);

    }
    }catch(e){print(e);}

  }

  Future saveOrder() async {
    isLoading(true);
    try{var myData = {'name': "name", 'price': 222};

    var collection = FirebaseFirestore.instance.collection('orders');
      collection
          .add(myData) // <-- Your data
          .then((_) => print('Added'))
          .catchError((error) => print('Add failed: $error'));

        isLoading(false);


    }catch(e){print(e);}

  }

  // Firestore.instance.collection('COLLECTION').document('ID')
  //     .get().then((DocumentSnapshot) =>
  // print(DocumentSnapshot.data['key'].toString());
  // );
  //
  // favourite() async {
  //   await AppStorage.addRoomToFavorite(room!);
  //   isFavourite(!isFavourite.value);
  //   isFavourite.value == true ? showPopupText("تم اضافة الغرفة الي المفضلة") :
  //   showPopupText("تم حذف الغرفة من المفضلة");
  //
  //   isFavourite.refresh();
  // }
  //
  // Future getRoomDetail() async {
  //   isLoading(true);
  //   final request = RoomDetailRequest(
  //     id: id,
  //   );
  //   RoomsRepository().getRoomDetail(request,
  //       onSuccess: (data) async {
  //         room = data.data;
  //         selectedImage(room!.image);
  //         if (room!.itemImages != null && room!.image != null) {
  //           room!.itemImages!.add(ItemImageResponse(image: room!.image));
  //         }
  //         await AppStorage.isFavRoom(room?.id ?? -1)
  //             .then((value) => isFavourite(value));
  //         isFavourite.refresh();
  //       },
  //       onError: (e) => showPopupText(e.toString()),
  //       onComplete: () => isLoading(false));
  // }

  setSelectedImage(String? image) {
    selectedImage(image);
  }
  // final favouriteProducts = <RoomResponse>[].obs;
  // Future addProduct(RoomResponse product , BuildContext context) async{
  //   int index = favouriteProducts.indexWhere((element) => element.id == product.id);
  //   if(index != -1){
  //   }else{
  //     favouriteProducts.add(product);
  //   }
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString(AppConstants.favKey, jsonEncode(favouriteProducts));
  //   showPopupText( "Product added to favourites successfully");

  // }
  // Future getFavProducts() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   favouriteProducts.value = [];
  //   if(prefs.getString(AppConstants.favKey) != null) {
  //     List products = jsonDecode(prefs.getString(AppConstants.favKey)!);
  //     favouriteProducts.value =
  //     List<RoomResponse>.from(products.map((e) => RoomResponse.fromJson(e)));
  //     for(int i = 0 ; i < favouriteProducts.length ; i ++){
  //       favouriteProducts[i].fav = true ;
  //     }
  //   }
  // }

  // Future remove(id , BuildContext context) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   favouriteProducts.removeWhere((product) => product.id == id);
  //   prefs.setString(AppConstants.favKey, jsonEncode(favouriteProducts));
  //   showPopupText( "Product removed from favourites successfully");
  // }

  //  isFav(id) async {
  //   await getFavProducts();
  //   int index = favouriteProducts.indexWhere((product) => product.id == id);
  //   if(index == -1 ){
  //     return false ;
  //   }else{
  //     return true ;
  //   }
  // }
}
