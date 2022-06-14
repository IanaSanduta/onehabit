// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

///
///
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
    apiKey: 'AIzaSyCMQu_ekGWosKAgK7KmigJ3-nNOdZNu-NA',
    appId: '1:1017134315369:web:c0d81668b8beb0395deff8',
    messagingSenderId: '1017134315369',
    projectId: 'onehabit-53d2e',
    authDomain: 'onehabit-53d2e.firebaseapp.com',
    storageBucket: 'onehabit-53d2e.appspot.com',
    measurementId: 'G-2141MC7WKC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA3X9sbL5pauTkFHBD3C0evckXEq1JxH8g',
    appId: '1:1017134315369:android:78f96262cf6b29ac5deff8',
    messagingSenderId: '1017134315369',
    projectId: 'onehabit-53d2e',
    storageBucket: 'onehabit-53d2e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAXbN9RWYN3rs9dVeEwDNzKT6Fv65rnxnw',
    appId: '1:1017134315369:ios:e0b9d1bb972f74355deff8',
    messagingSenderId: '1017134315369',
    projectId: 'onehabit-53d2e',
    storageBucket: 'onehabit-53d2e.appspot.com',
    iosClientId:
        '1017134315369-is0s321jkja2oo5nabobok7508r4sgkm.apps.googleusercontent.com',
    iosBundleId: 'com.example.onehabit',
  );
}