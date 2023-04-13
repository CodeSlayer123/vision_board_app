import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBoBrTJbT2bb60rQKiuck2u9gxab7LWjCY",
            authDomain: "vision-board-dfa55.firebaseapp.com",
            projectId: "vision-board-dfa55",
            storageBucket: "vision-board-dfa55.appspot.com",
            messagingSenderId: "193110635424",
            appId: "1:193110635424:web:1e116194a3257b616aeac5",
            measurementId: "G-FFW53HS7LR"));
  } else {
    await Firebase.initializeApp();
  }
}
