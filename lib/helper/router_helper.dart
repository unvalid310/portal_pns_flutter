// ignore_for_file: cascade_invocations

import 'package:fluro/fluro.dart';
import 'package:portal_pns_flutter/utill/routes.dart';
import 'package:portal_pns_flutter/view/base/not_found.dart';
import 'package:portal_pns_flutter/view/screen/absensi/absensi_screen.dart';
import 'package:portal_pns_flutter/view/screen/absensi/pages/riwayat_absensi_page.dart';
import 'package:portal_pns_flutter/view/screen/auth/login_screen.dart';
import 'package:portal_pns_flutter/view/screen/berita/berita_screen.dart';
import 'package:portal_pns_flutter/view/screen/home/home_screen.dart';
import 'package:portal_pns_flutter/view/screen/splash/splash_screen.dart';
import 'package:portal_pns_flutter/view/screen/surat/pages/pejabat_page.dart';
import 'package:portal_pns_flutter/view/screen/surat/surat_screen.dart';

class RouterHelper {
  static final FluroRouter router = FluroRouter();

  // Define Handler /
  static final Handler _splashHandler = Handler(
    handlerFunc: (context, Map<String, dynamic> params) => const SplashScreen(),
  );
  static final Handler _loginHandler = Handler(
    handlerFunc: (context, Map<String, dynamic> params) => const LoginScreen(),
  );
  static final Handler _homeHandler = Handler(
    handlerFunc: (context, Map<String, dynamic> params) => const HomeScreen(),
  );
  static final Handler _absensiHandler = Handler(
    handlerFunc: (context, Map<String, dynamic> params) =>
        const AbsensiScreen(),
  );
  static final Handler _riwayatAbsensiHandler = Handler(
    handlerFunc: (context, Map<String, dynamic> params) =>
        const RiwayatAbsensiPage(),
  );
  static final Handler _suratHandler = Handler(
    handlerFunc: (context, parameters) => const SuratScreen(),
  );
  static final Handler _beritaHandler = Handler(
    handlerFunc: (context, parameters) => const BeritaScreen(),
  );
  static final Handler _pejabatHandler = Handler(
    handlerFunc: (context, parameters) => const PejabatPage(),
  );

  static final Handler _notFoundHandler = Handler(
    handlerFunc: (context, Map<String, dynamic> params) => const NotFound(),
  );

  // Define Router /
  static void setupRouter() {
    router.notFoundHandler = _notFoundHandler;
    router.define(
      Routes.SPLASH_SCREEN,
      handler: _splashHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      Routes.LOGIN_SCREEN,
      handler: _loginHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      Routes.HOME_SCREEN,
      handler: _homeHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      Routes.ABSENSI_SCREEN,
      handler: _absensiHandler,
      transitionType: TransitionType.inFromBottom,
    );
    router.define(
      Routes.RIWAYAT_ABSENSI_SCREEN,
      handler: _riwayatAbsensiHandler,
      transitionType: TransitionType.inFromBottom,
    );
    router.define(
      Routes.SURAT_SCREEN,
      handler: _suratHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      Routes.BERITA_SCREEN,
      handler: _beritaHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      Routes.DAFTAR_PEJABAT_SCREEN,
      handler: _pejabatHandler,
      transitionType: TransitionType.inFromBottom,
    );
  }
}
