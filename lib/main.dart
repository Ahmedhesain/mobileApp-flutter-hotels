import 'package:flutter/material.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:get/get.dart';

// Future<void> _firebaseMessagingBackgroundHandler() async {}
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await Firebase.initializeApp(options: const FirebaseOptions(
  //     apiKey: 'AIzaSyBrBEab0jI1gdFQfH_pHyQO6PwWjkyl32A',
  //     appId: "1:636909098075:android:26a05c9f82ab2f369d5b7e",
  //     messagingSenderId: "636909098075",
  //     projectId: "easyhotel-76224"));
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()!.createNotificationChannel(channel);
  // Get.put<FoodCartController>(FoodCartController());
  runApp(const App());
}


// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//   'high_importance_channel', // id
//   'High Importance Notifications', // title
//   description: 'This channel is used for important notifications',
//   // description
//   importance: Importance.max,
//   playSound: true,
//   showBadge: true,
// );