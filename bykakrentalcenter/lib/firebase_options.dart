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
    apiKey: 'AIzaSyDJpKdTW3sVBypzqB2omg6oWj9EMUs1-Qo',
    appId: '1:1042214968619:web:198f61b32152d29066396e',
    messagingSenderId: '1042214968619',
    projectId: 'bykakrental',
    authDomain: 'bykakrental.firebaseapp.com',
    storageBucket: 'bykakrental.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDCKGF5ABVczMWbF9ANtuMy3IK1Tfz0hJM',
    appId: '1:1042214968619:android:dab40747a62ad30866396e',
    messagingSenderId: '1042214968619',
    projectId: 'bykakrental',
    storageBucket: 'bykakrental.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBZUJz-JBfB9cxvvU6ZUqv3wt6cATWohpk',
    appId: '1:1042214968619:ios:69ac17b7360e79e866396e',
    messagingSenderId: '1042214968619',
    projectId: 'bykakrental',
    storageBucket: 'bykakrental.appspot.com',
    iosClientId: '1042214968619-8mmg0g1lb2bn4lvt6g6n6f8ke4v1o3gg.apps.googleusercontent.com',
    iosBundleId: 'com.designer.bykakrentalcenter',
  );
}
