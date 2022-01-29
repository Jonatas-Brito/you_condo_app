// import 'dart:convert';

// import 'package:youcondo/core/notification/push_notification.dart';
// import 'package:youcondo/core/uma_variavel_ai.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// import 'core/model/scheduling.dart';
import 'src/app_module.dart';
import 'src/app_widget.dart';

// PushNotificationConfigure pushNotificationConfigure =
//     PushNotificationConfigure();

// Future<void> _processMessageBackgroundHandler(RemoteMessage message) async {
//   Scheduling scheduling = Scheduling();
//   String payload = '';
//   Map<String, dynamic> mapTest = {};

//   if (message.data['payload'] != null) {
//     payload = message.data['payload'];
//     mapTest = jsonDecode(payload);
//     scheduling = Scheduling.fromJson(mapTest);
//     schedulings = scheduling;
//     print("Deu load: ${schedulings.status}");
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      // options: FirebaseOptions(
      //     apiKey: "AIzaSyB1ebZxvRJpGebFJDbpGsgJVqjj7gu1bCU",
      //     appId: "1:80069231043:web:d2e6e0c2a8cc3495d03d76",
      //     messagingSenderId: "80069231043",
      //     projectId: "youcondo-3560f"),
      );
  // FirebaseMessaging.onBackgroundMessage(_processMessageBackgroundHandler);
  // pushNotificationConfigure.configure();
  runApp(ModularApp(
    module: AppModule(),
    child: AppWidget(),
  ));
}
