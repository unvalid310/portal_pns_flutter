// ignore_for_file: omit_local_variable_types, prefer_final_locals, prefer_const_constructors, avoid_void_async

import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:portal_pns_flutter/app/app.dart';

class NotificationHelper {
  static Future<void> initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    bool _requesteNotificationPermission = false;
    bool _requestPermission = true;
    final channel = AndroidNotificationChannel(
      'portalPNS',
      'portalPNS',
      showBadge: true,
      importance: Importance.max,
      playSound: true,
      enableLights: true,
      enableVibration: true,
      sound: RawResourceAndroidNotificationSound('mixkit_musical'),
    );
    final androidInitialize = AndroidInitializationSettings('app_icon');
    final iOSInitialize = DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    final initializationsSettings = InitializationSettings(
      android: androidInitialize,
      iOS: iOSInitialize,
    );

    if (_requestPermission) {
      if (Platform.isAndroid) {
        await flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()
            ?.createNotificationChannel(channel)
            .then(
              (value) async => _requesteNotificationPermission =
                  await requestNotificationPermission().then((value) => value),
            );
        print(
            'request notification permission : $_requesteNotificationPermission');

        if (_requesteNotificationPermission) {
          await flutterLocalNotificationsPlugin.initialize(
            initializationsSettings,
            onDidReceiveNotificationResponse: (details) async {
              print('detail : ' + details.payload.toString());
              try {
                final strPayload = details.payload.toString().split(' ');
                print('ID surat >> $strPayload[0]');
                print('status surat >> $strPayload[1]');

                // await App.navigatorKey.currentState?.push(
                //   MaterialPageRoute<void>(
                //     builder: (context) => LihatSurat(
                //       idSurat: strPayload[0],
                //       page: strPayload[1],
                //     ),
                //   ),
                // );
              } catch (e) {
                print('error selecting notification >> ${e.toString()}');
              }

              return;
            },
            onDidReceiveBackgroundNotificationResponse:
                notificationTapBackground,
          );

          FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
            print('onMessage: ${message.data}');

            await NotificationHelper.showNotification(
              message.data,
              flutterLocalNotificationsPlugin,
            );
          });

          FirebaseMessaging.onMessageOpenedApp
              .listen((RemoteMessage message) async {
            print('onMessageApp: ${message.data}');

            await NotificationHelper.showNotification(
              message.data,
              flutterLocalNotificationsPlugin,
            );
          });
        }
      }

      if (Platform.isIOS) {
        await flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                IOSFlutterLocalNotificationsPlugin>()
            ?.requestPermissions(
              alert: true,
              badge: true,
              sound: true,
            )
            .then(
              (value) async => _requesteNotificationPermission =
                  await requestNotificationPermission().then((value) => value),
            );

        if (_requesteNotificationPermission) {
          await DarwinInitializationSettings(
            onDidReceiveLocalNotification: (id, title, body, payload) {
              print('Notification title : $title');
            },
          );

          FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
            print('onMessage: ${message.data}');

            await NotificationHelper.showNotification(
              message.data,
              flutterLocalNotificationsPlugin,
            );
          });

          FirebaseMessaging.onMessageOpenedApp
              .listen((RemoteMessage message) async {
            print('onMessageApp: ${message.data}');

            await NotificationHelper.showNotification(
              message.data,
              flutterLocalNotificationsPlugin,
            );
          });
        }
      }
    }
  }

  static void onDidReceiveLocalNotification({
    int? id,
    String? title,
    String? body,
    String? payload,
  }) async {}

  static Future<void> showNotification(
      Map<String, dynamic> message, FlutterLocalNotificationsPlugin fln) async {
    await showTextNotification(message, fln);
  }

  static Future<void> showTextNotification(
      Map<String, dynamic> message, FlutterLocalNotificationsPlugin fln) async {
    final _title = message['title'].toString(),
        _body = message['body'].toString(),
        _payload = message['payload'].toString();

    final vibrationPattern = Int64List(4);
    vibrationPattern[0] = 0;
    vibrationPattern[1] = 1000;
    vibrationPattern[2] = 5000;
    vibrationPattern[3] = 2000;

    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'portalPNS',
      'portalPNS',
      groupKey: 'goid.metrokota.pns',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.max,
      ticker: 'ticker',
      icon: 'secondary_icon',
      largeIcon: const DrawableResourceAndroidBitmap('logometrosmall'),
      playSound: true,
      enableLights: true,
      enableVibration: true,
      vibrationPattern: vibrationPattern,
      color: const Color.fromARGB(255, 255, 0, 0),
      ledColor: const Color.fromARGB(255, 255, 0, 0),
      ledOnMs: 1000,
      ledOffMs: 500,
      sound: const RawResourceAndroidNotificationSound('mixkit_musical'),
    );

    final IosPlatformSpecifics = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      sound: 'mixkit_musical.mp3',
      threadIdentifier: 'thread1',
    );

    final platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: IosPlatformSpecifics,
    );

    await fln.show(
      1,
      _title,
      _body,
      platformChannelSpecifics,
      payload: _payload,
    );
  }

  static Future<bool> requestNotificationPermission() async {
    bool _return = false;

    final settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('AuthorizationStatus ${AuthorizationStatus.authorized}');
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
      _return = true;
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
      _return = true;
    } else {
      await FirebaseMessaging.instance.requestPermission(
        alert: true,
        announcement: false,
        badge: true, // true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      _return = true;
    }

    return _return;
  }

  static void notificationTapBackground(
      NotificationResponse notificationResponse) {
    // handle action
  }
}

Future<dynamic> myBackgroundMessageHandler(RemoteMessage message) async {
  final channel = AndroidNotificationChannel(
    'portalPNS',
    'portalPNS',
    showBadge: true,
    importance: Importance.high,
    playSound: true,
    enableLights: true,
    enableVibration: true,
    sound: const RawResourceAndroidNotificationSound('mixkit_musical'),
  );

  final androidInitialize = AndroidInitializationSettings('app_icon');
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final iOSInitialize = DarwinInitializationSettings(
    requestSoundPermission: false,
    requestBadgePermission: false,
    requestAlertPermission: false,
  );

  final initializationsSettings = InitializationSettings(
    android: androidInitialize,
    iOS: iOSInitialize,
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await flutterLocalNotificationsPlugin.initialize(initializationsSettings);

  await NotificationHelper.showNotification(
    message.data,
    flutterLocalNotificationsPlugin,
  );
}
