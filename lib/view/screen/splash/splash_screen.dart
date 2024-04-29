import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:portal_pns_flutter/cubit/auth/auth_cubit.dart';
import 'package:portal_pns_flutter/helper/notification_helper.dart';
import 'package:portal_pns_flutter/utill/images.dart';
import 'package:portal_pns_flutter/utill/routes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  bool _isLoginedIn = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: (5)),
      vsync: this,
    );

    NotificationHelper.requestNotificationPermission();
    isLoginedIn();

    SystemChrome.setEnabledSystemUIOverlays(
      <SystemUiOverlay>[SystemUiOverlay.top],
    );
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
  }

  void isLoginedIn() {
    setState(() {
      _isLoginedIn =
          BlocProvider.of<AuthCubit>(context, listen: false).isLoginedIn();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Images.splash_bg,
          width: Adaptive.w(100),
          height: Adaptive.h(100), //MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              if (_isLoginedIn)
                Positioned(
                  bottom: Adaptive.h(5),
                  child: SpinKitThreeBounce(
                    color: Colors.white,
                    size: Adaptive.w(5),
                  ),
                ),
              Center(
                child: Lottie.asset(
                  Images.splash_animated,
                  controller: _controller,
                  width: Adaptive.w(35),
                  animate: true,
                  onLoaded: (composition) {
                    print(composition.duration);

                    _controller!
                      ..duration = composition.duration
                      ..forward().whenComplete(() {
                        if (_isLoginedIn) {
                          return Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes.HOME_SCREEN,
                            (route) => false,
                          );
                        }
                        return Navigator.pushNamedAndRemoveUntil(
                          context,
                          Routes.LOGIN_SCREEN,
                          (route) => false,
                        );
                      });
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
