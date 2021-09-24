import 'dart:convert';
import 'package:YouCondo/core/model/scheduling.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PushNotificationConfigure {
  Scheduling scheduling = Scheduling();
  late NotificationDetails platformChannelSpecifics;
  late IOSNotificationDetails iosPlatformChannelSpecifics;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  late AndroidNotificationChannel channel;
  RemoteMessage message = RemoteMessage();

  getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print(token);
  }

  Future<void> configure() async {
    channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      'This channel is used for important notifications.', // description
      importance: Importance.max,
    );

    getToken();
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            onDidReceiveLocalNotification: _onDidReceiveLocalNotification);

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );

    iosPlatformChannelSpecifics = IOSNotificationDetails();

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (payload) => _selectNotification(payload));

    FirebaseMessaging.onMessage
        .listen((RemoteMessage message) => _processMessage(message));
  }

  void _processMessage(RemoteMessage message) {
    flutterLocalNotificationShow(message, channel);
  }

  Future<void> flutterLocalNotificationShow(
      RemoteMessage message, AndroidNotificationChannel channel) async {
    String payload = '';

    RemoteNotification notification = message.notification!;
    AndroidNotification? android = message.notification!.android;
    if (notification != null && android != null) {
      payload = message.data['payload'];
      print('I me : $payload');
      await flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
              android: AndroidNotificationDetails(
                  channel.id, channel.name, channel.description,
                  icon: android.smallIcon),
              iOS: iosPlatformChannelSpecifics),
          payload: payload);
    }
  }

  Future _onDidReceiveLocalNotification(
      int? id, String? title, String? body, String? payload) async {}

  Future _selectNotification(String? payload) async {
    Map<String, dynamic> mapTest = {};
    print('========== SELECTENOTIFICATION IS TRUE ==========');
    dynamic mapTeste = {};
    if (payload != null) {
      mapTeste = payload;
      mapTest = jsonDecode(mapTeste);
      scheduling = Scheduling.fromJson(mapTest);
      onTest(scheduling);
      print("notification das: ${scheduling.status}");
      Modular.to.navigate(scheduling.page!, arguments: scheduling);
    }
  }

  onTest(Scheduling scheduling) {
    Scheduling _scheduling = scheduling;
    return _scheduling;
  }
}
