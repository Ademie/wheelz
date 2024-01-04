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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDksvMhA4_p6QKdA_Kyu8LiOmrPdx3b8tE',
    appId: '1:547102469282:web:1b5bfaef07da400360bbfb',
    messagingSenderId: '547102469282',
    projectId: 'wheelz-dce67',
    authDomain: 'wheelz-dce67.firebaseapp.com',
    storageBucket: 'wheelz-dce67.appspot.com',
    measurementId: 'G-H6K2TKH6R2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAVUmvANVjkjFptG7vc6RbhqUkpRNiwQ3s',
    appId: '1:547102469282:android:3ec65e2a0b7aa59460bbfb',
    messagingSenderId: '547102469282',
    projectId: 'wheelz-dce67',
    storageBucket: 'wheelz-dce67.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC_8CoEEb0Z80LLXOu-Gy01t6zz_0KDaFc',
    appId: '1:547102469282:ios:f4ff6d910a3d818860bbfb',
    messagingSenderId: '547102469282',
    projectId: 'wheelz-dce67',
    storageBucket: 'wheelz-dce67.appspot.com',
    iosBundleId: 'com.example.usersApp',
  );
}
