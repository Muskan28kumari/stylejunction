import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylejunction/provide/auth_provider.dart';
import 'package:stylejunction/signinpage.dart';

//import 'package:stylejunction/signuppage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await MongoDatabase.ensureConnection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        color: Colors.white,
        home: SigninScreen(),
      ),
      // Set the SignupScreen as the initial page
    );
  }
}

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      /*case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;*/
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
      apiKey: "AIzaSyDhLScUcA-3dy3WkprbK3ahzq_LqqPtRRk",
      authDomain: "phone-firebase-70ea2.firebaseapp.com",
      projectId: "phone-firebase-70ea2",
      storageBucket: "phone-firebase-70ea2.appspot.com",
      messagingSenderId: "1032734429286",
      appId: "1:1032734429286:web:e98c23508b6f20dc7fdda7",
      measurementId: "G-T3YWZR207J");

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC9ZQJzhPb6dS6-nb_ie5ext4Qp5ZqiAEU',
    appId: '1:1032734429286:android:f4b4ae6f40420a767fdda7',
    messagingSenderId: '1032734429286',
    projectId: 'phone-firebase-70ea2',
    storageBucket: 'phone-firebase-70ea2.appspot.com',
  );

  /*static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDVL2Ny1_XfOkGa9qDGzRalcZA1CY5jNkw',
    appId: '1:428886003775:ios:2a9854bdcf9959bc85288a',
    messagingSenderId: '428886003775',
    projectId: 'littleimmune',
    storageBucket: 'littleimmune.appspot.com',
    iosClientId:
        '428886003775-pmmcu22gcvt4opog4jrb4gcn1o2nheha.apps.googleusercontent.com',
    iosBundleId: 'com.example.littleImmune',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDVL2Ny1_XfOkGa9qDGzRalcZA1CY5jNkw',
    appId: '1:428886003775:ios:2a9854bdcf9959bc85288a',
    messagingSenderId: '428886003775',
    projectId: 'littleimmune',
    storageBucket: 'littleimmune.appspot.com',
    iosClientId:
        '428886003775-pmmcu22gcvt4opog4jrb4gcn1o2nheha.apps.googleusercontent.com',
    iosBundleId: 'com.example.littleImmune',
  );*/
}



/*// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyDhLScUcA-3dy3WkprbK3ahzq_LqqPtRRk",
  authDomain: "phone-firebase-70ea2.firebaseapp.com",
  projectId: "phone-firebase-70ea2",
  storageBucket: "phone-firebase-70ea2.appspot.com",
  messagingSenderId: "1032734429286",
  appId: "1:1032734429286:web:e98c23508b6f20dc7fdda7",
  measurementId: "G-T3YWZR207J"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);*/ 
