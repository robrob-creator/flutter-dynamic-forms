// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
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
    apiKey: 'AIzaSyCm3x0xYWCtyuQW2tyfY9lsLNPX9zucdos',
    appId: '1:815092555544:web:b9977742306bbffd75086d',
    messagingSenderId: '815092555544',
    projectId: 'issac-6bb65',
    authDomain: 'issac-6bb65.firebaseapp.com',
    databaseURL: 'https://issac-6bb65-default-rtdb.firebaseio.com',
    storageBucket: 'issac-6bb65.appspot.com',
    measurementId: 'G-5XG4CWFVXY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCpoHoUjMZHSdsk8leFRyhZXTF4X9XUfKo',
    appId: '1:815092555544:android:454f67e6b5057d4e75086d',
    messagingSenderId: '815092555544',
    projectId: 'issac-6bb65',
    databaseURL: 'https://issac-6bb65-default-rtdb.firebaseio.com',
    storageBucket: 'issac-6bb65.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDdmMKUk6fYf3ACia37vveTORtXCT9yRcE',
    appId: '1:815092555544:ios:c83d7659c1fb4b8975086d',
    messagingSenderId: '815092555544',
    projectId: 'issac-6bb65',
    databaseURL: 'https://issac-6bb65-default-rtdb.firebaseio.com',
    storageBucket: 'issac-6bb65.appspot.com',
    iosBundleId: 'com.example.dynamicForm',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDdmMKUk6fYf3ACia37vveTORtXCT9yRcE',
    appId: '1:815092555544:ios:0da0996228f0550b75086d',
    messagingSenderId: '815092555544',
    projectId: 'issac-6bb65',
    databaseURL: 'https://issac-6bb65-default-rtdb.firebaseio.com',
    storageBucket: 'issac-6bb65.appspot.com',
    iosBundleId: 'com.example.dynamicForm.RunnerTests',
  );
}
