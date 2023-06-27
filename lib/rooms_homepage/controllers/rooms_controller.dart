
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RoomsController extends GetxController {

  final isLoading = false.obs;
  final roomsOfferLoading = false.obs;
  final roomsAdsLoading = false.obs;
  final roomsDiscoverLoading = false.obs;
  final citiesLoading = false.obs;
  List offers =[];
  final user= FirebaseAuth.instance.currentUser;

  @override
  void onInit() {
    super.onInit();
    getOffers();

  }
  Future getOffers() async {
    roomsOfferLoading(true);

    try{
      await FirebaseFirestore.instance.collection('offers').get().then((querySnapshot){
        final offersList = querySnapshot.docs.map((doc) => doc.data()).toList();

        offers.assignAll(offersList);
        print(offers);
        roomsOfferLoading(false);


      });
    }catch(e){print(e);}

  }


}
