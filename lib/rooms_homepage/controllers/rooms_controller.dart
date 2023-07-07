
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotels_app/rooms_homepage/views/rooms_view.dart';
import 'package:url_launcher/url_launcher.dart';

class RoomsController extends GetxController {

  final isLoading = false.obs;
  final roomsOfferLoading = false.obs;
  final roomsCitiesLoading = false.obs;
  final roomsAdsLoading = false.obs;
  final roomsDiscoverLoading = false.obs;
  final offers=[].obs();
  final offersId=[].obs();
  final cities=[].obs();
  final ads=[].obs();
  final discover=[].obs();

  final user= FirebaseAuth.instance.currentUser;

  @override
  void onInit() {
    super.onInit();
    getOffers();
    getCities();
    getAds();
    getDiscover();

  }
  Future getOffers() async {
    roomsOfferLoading(true);

    try{
      await FirebaseFirestore.instance.collection('cairo').get().then((querySnapshot){
        final offersList = querySnapshot.docs.map((doc) => doc.data()).toList();
        final offersIdList = querySnapshot.docs.map((doc) => doc.id).toList();

        offers.assignAll(offersList);
        offersId.assignAll(offersIdList);
        print(offers);
        roomsOfferLoading(false);


      });
    }catch(e){print(e);}

  }

  Future getCities() async {
    roomsCitiesLoading(true);

    try{
      await FirebaseFirestore.instance.collection('cities').get().then((querySnapshot){
        final citiesList = querySnapshot.docs.map((doc) => doc.data()).toList();
        cities.assignAll(citiesList);
        print(citiesList);
        roomsCitiesLoading(false);


      });
    }catch(e){print(e);}

  }
  Future getAds() async {
    roomsAdsLoading(true);

    try{
      await FirebaseFirestore.instance.collection('ads').get().then((querySnapshot){
        final adsList = querySnapshot.docs.map((doc) => doc.data()).toList();
        ads.assignAll(adsList);
        print(adsList);
        roomsAdsLoading(false);


      });
    }catch(e){print(e);}

  }
  Future getDiscover() async {
    roomsDiscoverLoading(true);

    try{
      await FirebaseFirestore.instance.collection('discover').get().then((querySnapshot){
        final discoverList = querySnapshot.docs.map((doc) => doc.data()).toList();
        discover.assignAll(discoverList);
        print(discoverList);
        roomsDiscoverLoading(false);


      });
    }catch(e){print(e);}

  }
  Future launchURL() async {
    final Uri url = Uri.parse('https://flutter.dev');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
