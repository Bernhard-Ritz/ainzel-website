import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAQsiRWNn2UA_Y2Y2a6jbSw7icwNdwrhVA",
            authDomain: "ainzel-website-v2-td5vrt.firebaseapp.com",
            projectId: "ainzel-website-v2-td5vrt",
            storageBucket: "ainzel-website-v2-td5vrt.appspot.com",
            messagingSenderId: "395485601218",
            appId: "1:395485601218:web:ee88b7640f24e3af0bca5b"));
  } else {
    await Firebase.initializeApp();
  }
}
