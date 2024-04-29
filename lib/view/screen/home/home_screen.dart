// ignore_for_file: unused_field, prefer_final_fields, use_late_for_private_fields_and_variables, cancel_subscriptions, library_private_types_in_public_api, avoid_void_async, avoid_single_cascade_in_expression_statements, await_only_futures, unawaited_futures, use_build_context_synchronously, avoid_print, prefer_const_constructors, sized_box_for_whitespace

import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portal_pns_flutter/cubit/absensi/absensi_cubit.dart';
import 'package:portal_pns_flutter/cubit/apps/apps_cubit.dart';
import 'package:portal_pns_flutter/cubit/auth/auth_cubit.dart';
import 'package:portal_pns_flutter/cubit/berita/berita_cubit.dart';
import 'package:portal_pns_flutter/helper/string_helper.dart';
import 'package:portal_pns_flutter/utill/images.dart';
import 'package:portal_pns_flutter/utill/routes.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:portal_pns_flutter/view/base/widget/absensi_widget.dart';
import 'package:portal_pns_flutter/view/screen/absensi/absensi_screen.dart';
import 'package:portal_pns_flutter/view/screen/home/widget/apps_widget.dart';
import 'package:portal_pns_flutter/view/screen/home/widget/berita_widget.dart';
import 'package:portal_pns_flutter/view/screen/home/widget/profile_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Connectivity _connectivity = Connectivity();
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _initNotification();
    _connectivitySubscription = _connectivity.onConnectivityChanged
        .listen((_connectivityResult) => _connectivityResult);
  }

  @override
  void dispose() {
    super.dispose();
    _connectivitySubscription!.cancel();
  }

  void _initNotification() async {
    if (Platform.isAndroid) {
      final token = await FirebaseMessaging.instance.getToken();
      print('token = $token');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(Adaptive.w(5), Adaptive.h(4),
                          Adaptive.w(5), Adaptive.h(3)),
                      width: double.infinity,
                      child: Column(
                        children: [
                          // nav status
                          Container(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: Adaptive.w(2),
                                        horizontal: Adaptive.w(2)),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xffE8ECF2),
                                    ),
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        SvgPicture.asset(
                                          Images.ic_surat,
                                          height: 14.sp,
                                        ),
                                        Positioned(
                                          top: -Adaptive.h(0.5),
                                          right: -Adaptive.w(0.5),
                                          child: Container(
                                            height: Adaptive.w(2),
                                            width: Adaptive.w(2),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff41a433),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  onTap: () => Navigator.pushNamed(
                                      context, Routes.SURAT_SCREEN),
                                ),
                                SizedBox(width: Adaptive.w(2)),
                                Container(
                                  width: Adaptive.w(5.5),
                                  height: Adaptive.h(2.5),
                                  decoration: BoxDecoration(
                                    color: Color(0xff41a433),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: Adaptive.h(1.5)),
                          // profile
                          ProfileWidget(),
                          // Absensi
                          BlocProvider.value(
                            value: BlocProvider.of<AbsensiCubit>(context)
                              ..getAbsensi(),
                            child: AbsensiWidget(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // SKP
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: Adaptive.h(3), horizontal: Adaptive.w(5)),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: Adaptive.h(1), horizontal: Adaptive.w(2)),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(Adaptive.w(1.5)),
                            decoration: BoxDecoration(
                              color: Color(0xff9DC4FF),
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              Images.ic_input_lap_kinerja,
                              width: 14.sp,
                            ),
                          ),
                          SizedBox(width: Adaptive.w(2)),
                          Text(
                            'Input Laporan Kinerja Harian',
                            style: poppinsRegular.copyWith(
                              fontSize: 14.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: Adaptive.w(2)),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        padding: EdgeInsets.all(Adaptive.h(1.5)),
                        decoration: BoxDecoration(
                          color: Color(0xff9dc4ff),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          Images.ic_add_lap_kinerja,
                          height: 16.sp,
                        ),
                      ),
                      onTap: () =>
                          Navigator.pushNamed(context, Routes.KINERJA_SCREEN),
                    ),
                  ],
                ),
              ),
              // Fast Menu
              Container(
                margin: EdgeInsets.symmetric(horizontal: Adaptive.w(5)),
                padding: EdgeInsets.symmetric(
                    vertical: Adaptive.h(1.5), horizontal: Adaptive.w(4)),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fast Menu',
                      style: poppinsBold.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: Adaptive.h(2)),
                    Row(
                      children: [
                        Flexible(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  Images.ic_menu_absensi,
                                  height: 25.sp,
                                ),
                                SizedBox(height: Adaptive.h(1)),
                                Text(
                                  'Absensi',
                                  style: poppinsRegular.copyWith(
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                            onTap: () async {
                              await Navigator.push<void>(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return MultiBlocProvider(
                                      providers: [
                                        BlocProvider.value(
                                          value: BlocProvider.of<AbsensiCubit>(
                                              context),
                                        ),
                                        BlocProvider.value(
                                          value: BlocProvider.of<AuthCubit>(
                                              context),
                                        ),
                                      ],
                                      child: AbsensiScreen(),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(width: Adaptive.w(5)),
                        Flexible(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  Images.ic_laporan_kinerja,
                                  height: 25.sp,
                                ),
                                SizedBox(height: Adaptive.h(1)),
                                Text(
                                  'Kinerja Harian',
                                  style: poppinsRegular.copyWith(
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                            onTap: () => Navigator.pushNamed(
                                context, Routes.KINERJA_SCREEN),
                          ),
                        ),
                        SizedBox(width: Adaptive.w(5)),
                        BlocProvider<BeritaCubit>(
                          create: (context) =>
                              BlocProvider.of<BeritaCubit>(context),
                          child: Flexible(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    Images.ic_menu_metro_terkini,
                                    height: 25.sp,
                                  ),
                                  SizedBox(height: Adaptive.h(1)),
                                  Text(
                                    'Metro Terkini',
                                    style: poppinsRegular.copyWith(
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () => Navigator.pushNamed(
                                context,
                                Routes.BERITA_SCREEN,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              // Lates Post
              BlocProvider.value(
                value: BlocProvider.of<BeritaCubit>(context)..getBeritaList(),
                child: BeritaWidget(),
              ),
              // Quick App
              BlocProvider.value(
                value: BlocProvider.of<AppsCubit>(context)..getApps(),
                child: AppsWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
