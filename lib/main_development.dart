import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:portal_pns_flutter/app/app.dart';
import 'package:portal_pns_flutter/cubit/absensi/absensi_cubit.dart';
import 'package:portal_pns_flutter/cubit/apps/apps_cubit.dart';
import 'package:portal_pns_flutter/cubit/auth/auth_cubit.dart';
import 'package:portal_pns_flutter/cubit/berita/berita_cubit.dart';
import 'package:portal_pns_flutter/cubit/surat/surat_cubit.dart';
import 'package:portal_pns_flutter/firebase_options.dart';
import 'package:portal_pns_flutter/helper/http_overrides_helper.dart';
import 'package:portal_pns_flutter/helper/notification_helper.dart';
import 'package:portal_pns_flutter/utill/app_bloc_observer.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'di_container.dart' as di;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = HttpOverridesHelper();
  await di.init();

  // final wsUrl = Uri.parse('ws://192.168.13.30:8282');
  // final channel = WebSocketChannel.connect(wsUrl);
  // Map<String, dynamic> authData = <String, dynamic>{
  //   'user_id': 2,
  //   'recipient_id': null,
  //   'type': 'socket',
  //   'token': null,
  //   'message': null
  // };

  // channel.sink.add(jsonEncode(authData));

  // await channel.ready.then((value) {
  //   channel.stream.listen((dynamic message) {
  //     print('message ${message.toString()}');
  //     print('status ${status.goingAway}');
  //   });
  // });

  if (Platform.isIOS) {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }

  if (Platform.isAndroid) {
    await Firebase.initializeApp();
  }

  await NotificationHelper.initialize(flutterLocalNotificationsPlugin);
  FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);

  SystemChrome.setEnabledSystemUIOverlays(
    <SystemUiOverlay>[SystemUiOverlay.top],
  );
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Bloc.observer = AppBlocObserver();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(
    () => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(create: (context) => di.getIt<AuthCubit>()),
          BlocProvider<AppsCubit>(create: (context) => di.getIt<AppsCubit>()),
          BlocProvider<BeritaCubit>(
              create: (context) => di.getIt<BeritaCubit>()),
          BlocProvider<AbsensiCubit>(
              create: (context) => di.getIt<AbsensiCubit>()),
          BlocProvider<SuratCubit>(create: (context) => di.getIt<SuratCubit>()),
        ],
        child: const App(),
      ),
    ),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
