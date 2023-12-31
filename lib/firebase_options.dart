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
    apiKey: 'AIzaSyCenbTWchlSAJLzZPxqtKJBe5jdZLKvyuo',
    appId: '1:322390885091:web:4c8be40a8f92fdc5f13bd6',
    messagingSenderId: '322390885091',
    projectId: 'flutterxfirebasecrud-b5220',
    authDomain: 'flutterxfirebasecrud-b5220.firebaseapp.com',
    storageBucket: 'flutterxfirebasecrud-b5220.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCwQnTTsi7vtvLkIYIJHa-x5zC3gJSZq7c',
    appId: '1:322390885091:android:6209f2b2ccc76a0ef13bd6',
    messagingSenderId: '322390885091',
    projectId: 'flutterxfirebasecrud-b5220',
    storageBucket: 'flutterxfirebasecrud-b5220.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCp6NfHu3N7a8QQsJc0zPJ6rmz1bjA3gsg',
    appId: '1:322390885091:ios:0f6325f0e9f82b55f13bd6',
    messagingSenderId: '322390885091',
    projectId: 'flutterxfirebasecrud-b5220',
    storageBucket: 'flutterxfirebasecrud-b5220.appspot.com',
    iosClientId: '322390885091-09ig6do4ssfk6fheesu23v5cn2p1guai.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCp6NfHu3N7a8QQsJc0zPJ6rmz1bjA3gsg',
    appId: '1:322390885091:ios:0f6325f0e9f82b55f13bd6',
    messagingSenderId: '322390885091',
    projectId: 'flutterxfirebasecrud-b5220',
    storageBucket: 'flutterxfirebasecrud-b5220.appspot.com',
    iosClientId: '322390885091-09ig6do4ssfk6fheesu23v5cn2p1guai.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFirebase',
  );
}
