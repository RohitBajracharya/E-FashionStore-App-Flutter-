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
    apiKey: 'AIzaSyAfCxXfg2eKKJZr7bV4aCzw2KDYQyr1jU8',
    appId: '1:515815860191:web:7f58d94a4d7e605d1bc66a',
    messagingSenderId: '515815860191',
    projectId: 'emart-5f2f7',
    authDomain: 'emart-5f2f7.firebaseapp.com',
    storageBucket: 'emart-5f2f7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBqnVqAIWENCOWOSb1dUx-oc5b2KMgCnAI',
    appId: '1:515815860191:android:c3bd8ab00ddba0361bc66a',
    messagingSenderId: '515815860191',
    projectId: 'emart-5f2f7',
    storageBucket: 'emart-5f2f7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBTvTi_NzD1zY3VHWlRlyM8vD0Ecd4x6fA',
    appId: '1:515815860191:ios:6a4d3021969cbb791bc66a',
    messagingSenderId: '515815860191',
    projectId: 'emart-5f2f7',
    storageBucket: 'emart-5f2f7.appspot.com',
    iosBundleId: 'com.example.ecommerceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBTvTi_NzD1zY3VHWlRlyM8vD0Ecd4x6fA',
    appId: '1:515815860191:ios:22753d21fc7179221bc66a',
    messagingSenderId: '515815860191',
    projectId: 'emart-5f2f7',
    storageBucket: 'emart-5f2f7.appspot.com',
    iosBundleId: 'com.example.ecommerceApp.RunnerTests',
  );
}