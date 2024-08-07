// Imported packages that displays firebase options

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyDJCSZLHmz3Y6IwhZ-4MNYkzuC-Ej2WIyo',
    appId: '1:809855679062:web:a62f33cd14cede212bd9f7',
    messagingSenderId: '809855679062',
    projectId: 'baho-app-df230',
    authDomain: 'baho-app-df230.firebaseapp.com',
    storageBucket: 'baho-app-df230.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAxKX2fyRoyUYMlSaMgegwbz__EUUuDBCc',
    appId: '1:809855679062:android:17fb194735ff27f62bd9f7',
    messagingSenderId: '809855679062',
    projectId: 'baho-app-df230',
    storageBucket: 'baho-app-df230.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDvftNa928zwvmrtZ0hIFkthCdsTe6bfgs',
    appId: '1:809855679062:ios:44f528f1d3c165a32bd9f7',
    messagingSenderId: '809855679062',
    projectId: 'baho-app-df230',
    storageBucket: 'baho-app-df230.appspot.com',
    iosBundleId: 'com.example.bahoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDvftNa928zwvmrtZ0hIFkthCdsTe6bfgs',
    appId: '1:809855679062:ios:44f528f1d3c165a32bd9f7',
    messagingSenderId: '809855679062',
    projectId: 'baho-app-df230',
    storageBucket: 'baho-app-df230.appspot.com',
    iosBundleId: 'com.example.bahoApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDJCSZLHmz3Y6IwhZ-4MNYkzuC-Ej2WIyo',
    appId: '1:809855679062:web:46e3e4e414ffbb6c2bd9f7',
    messagingSenderId: '809855679062',
    projectId: 'baho-app-df230',
    authDomain: 'baho-app-df230.firebaseapp.com',
    storageBucket: 'baho-app-df230.appspot.com',
  );
}
