// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBtcrxqm3imeWL02c9MFvAeJzrbcMs1QaU',
    appId: '1:606369813335:web:ee9f126204065466de2412',
    messagingSenderId: '606369813335',
    projectId: 'hotelmanagement-cb6a6',
    authDomain: 'hotelmanagement-cb6a6.firebaseapp.com',
    storageBucket: 'hotelmanagement-cb6a6.appspot.com',
    measurementId: 'G-GZ6MXNX22V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAWfzYTm88jl2sqhl0R2LReUlfwSqWbNbA',
    appId: '1:606369813335:android:eb3f93f3d3ee2ec7de2412',
    messagingSenderId: '606369813335',
    projectId: 'hotelmanagement-cb6a6',
    storageBucket: 'hotelmanagement-cb6a6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBfyb14XK0nv322bjNPpcY2aZi3bwcOUAU',
    appId: '1:606369813335:ios:02d0224f8b89e16dde2412',
    messagingSenderId: '606369813335',
    projectId: 'hotelmanagement-cb6a6',
    storageBucket: 'hotelmanagement-cb6a6.appspot.com',
    iosBundleId: 'com.example.hotelmanagement',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBfyb14XK0nv322bjNPpcY2aZi3bwcOUAU',
    appId: '1:606369813335:ios:02d0224f8b89e16dde2412',
    messagingSenderId: '606369813335',
    projectId: 'hotelmanagement-cb6a6',
    storageBucket: 'hotelmanagement-cb6a6.appspot.com',
    iosBundleId: 'com.example.hotelmanagement',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBtcrxqm3imeWL02c9MFvAeJzrbcMs1QaU',
    appId: '1:606369813335:web:f48cc036a2bfe8aade2412',
    messagingSenderId: '606369813335',
    projectId: 'hotelmanagement-cb6a6',
    authDomain: 'hotelmanagement-cb6a6.firebaseapp.com',
    storageBucket: 'hotelmanagement-cb6a6.appspot.com',
    measurementId: 'G-8V0FM32DZD',
  );
}
