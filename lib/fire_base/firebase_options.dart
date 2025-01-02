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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBAWWK1TEV_sDcUcP6MquWttjDx95bo4Ow',
    appId: '1:24133248133:android:af05df55861e5abc81f5ec',
    messagingSenderId: '24133248133',
    projectId: 'event-app-e1339',
    storageBucket: 'event-app-e1339.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDaSEQQitkgkpEo3_ApHPzHyfwkfZ8nNJA',
    appId: '1:24133248133:ios:896018e6131a612c81f5ec',
    messagingSenderId: '24133248133',
    projectId: 'event-app-e1339',
    storageBucket: 'event-app-e1339.firebasestorage.app',
    iosBundleId: 'com.example.eventPlanningApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAIGvyYXNpuh-o0fMwMKK6lM9okvrlwm00',
    appId: '1:24133248133:web:3487bee3fb93fbf281f5ec',
    messagingSenderId: '24133248133',
    projectId: 'event-app-e1339',
    authDomain: 'event-app-e1339.firebaseapp.com',
    storageBucket: 'event-app-e1339.firebasestorage.app',
    measurementId: 'G-ZLXVFLSMQ9',
  );
}