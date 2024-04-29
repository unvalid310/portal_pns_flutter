import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:lottie/lottie.dart';
import 'package:portal_pns_flutter/helper/router_helper.dart';
import 'package:portal_pns_flutter/utill/images.dart';
import 'package:portal_pns_flutter/utill/routes.dart';
import 'package:portal_pns_flutter/view/screen/splash/splash_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  static final navigatorKey = new GlobalKey<NavigatorState>();

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    RouterHelper.setupRouter();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GlobalLoaderOverlay(
          useDefaultLoading: false,
          overlayColor: Color(0xff3168b9).withOpacity(0.7),
          overlayWidgetBuilder: (dynamic progress) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                    Images.splash_animated,
                    width: Adaptive.w(20),
                    animate: true,
                    repeat: true,
                  ),
                  SizedBox(height: Adaptive.h(1)),
                  SpinKitThreeBounce(
                    size: Adaptive.w(5),
                    color: Colors.white.withOpacity(0.9),
                  ),
                ],
              ),
            );
          },
          child: MaterialApp(
            // useInheritedMediaQuery: true,
            // locale: DevicePreview.locale(context),
            initialRoute: Routes.getSplashRoute(),
            onGenerateRoute: RouterHelper.router.generator,
            navigatorKey: App.navigatorKey,
            title: 'Portal PNS',
            theme: ThemeData(
              fontFamily: 'Poppins',
              scaffoldBackgroundColor: Color(0xfff1eded),
              primaryColor: Color(0xff3168b9),
              brightness: Brightness.light,
              focusColor: Color(0xFFADC4C8),
              hintColor: Color(0xFF52575C),
              pageTransitionsTheme: const PageTransitionsTheme(
                builders: {
                  TargetPlatform.android: ZoomPageTransitionsBuilder(),
                  TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
                },
              ),
              primaryTextTheme: TextTheme(
                button: TextStyle(color: Colors.white),
                bodyText1: TextStyle(
                  fontSize: 14.sp,
                  color: Color(0xff41403f),
                  fontWeight: FontWeight.w500,
                ),
                bodyText2: TextStyle(
                  fontSize: 14.sp,
                  color: Color(0xff41403f),
                  fontWeight: FontWeight.w500,
                ),
              ),
              inputDecorationTheme: InputDecorationTheme(
                contentPadding: EdgeInsets.symmetric(
                    vertical: Adaptive.h(0.5), horizontal: Adaptive.w(3)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(style: BorderStyle.none, width: 0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(color: Color(0xffa5a5a5), width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: Color(0xff3168b9).withOpacity(0.7), width: 1.5),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: Color(0xffdc5555).withOpacity(0.7), width: 1.5),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: Color(0xffdc5555).withOpacity(0.7), width: 1.5),
                ),
                filled: true,
                fillColor: Color(0Xffa5a5a5).withOpacity(0.09),
                isDense: true,
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffa5a5a5),
                ),
                alignLabelWithHint: true,
              ),
              textTheme: TextTheme(
                button: TextStyle(color: Colors.white),
                bodyText1: TextStyle(
                  fontSize: 14.sp,
                  color: Color(0xff41403f),
                  fontWeight: FontWeight.w500,
                ),
                bodyText2: TextStyle(
                  fontSize: 14.sp,
                  color: Color(0xff41403f),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
