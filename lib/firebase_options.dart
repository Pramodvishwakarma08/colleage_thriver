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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCbpuJwrMK3qtNZRmapiEn5bmICEBbdvt8',
    appId: '1:675007525384:android:b77889144de3a1932997bd',
    messagingSenderId: '675007525384',
    projectId: 'colleage-thriver-654fe',
    storageBucket: 'colleage-thriver-654fe.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCqS2N99S8TdQP3i9Kzg6MXVFpDsGbvAEQ',
    appId: '1:675007525384:ios:8b9df3c56123d7df2997bd',
    messagingSenderId: '675007525384',
    projectId: 'colleage-thriver-654fe',
    storageBucket: 'colleage-thriver-654fe.appspot.com',
    androidClientId: '675007525384-5mcfr21bbgr3erl46pnrgne49lpb557c.apps.googleusercontent.com',
    iosClientId: '675007525384-lcbnaqd3tbsti4jtgcen4o4c0cm57n20.apps.googleusercontent.com',
    iosBundleId: 'com.example.colleageThriver',
  );

}