
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

reportCrash(dynamic error, StackTrace stackTrace){
  if(kDebugMode) {
    debugPrint(Exception([error, stackTrace]).toString());
  } else {
    // FirebaseCrashlytics.instance.recordError(error, stackTrace);
  }
}