import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portal_pns_flutter/utill/colors_resource.dart';
import 'package:portal_pns_flutter/utill/images.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          curve: Curves.bounceOut,
          duration: Duration(seconds: 2),
          tween: Tween<double>(begin: 10.sp, end: 20.sp),
          builder: (context, value, child) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: Adaptive.w(4)),
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                clipBehavior: Clip.none,
                children: [
                  Lottie.asset(
                    Images.notFound_animated,
                    animate: true,
                    height: Adaptive.h(1.4 * double.parse(value.toString())),
                    fit: BoxFit.fitHeight,
                  ),
                  Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          child: Container(
                            margin: EdgeInsets.only(right: Adaptive.w(15)),
                            padding: EdgeInsets.all(Adaptive.h(1)),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.close_rounded,
                            ),
                          ),
                          onTap: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: Adaptive.h(30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Page not found!',
                          textAlign: TextAlign.center,
                          style: poppinsBold.copyWith(
                            fontSize: double.parse(value.toString()),
                            color: ColorsResource.textColor,
                          ),
                        ),
                        SizedBox(height: Adaptive.h(0.5)),
                        Text(
                          'Aplikasi dalam proses pengembangan.',
                          textAlign: TextAlign.center,
                          style: poppinsRegular.copyWith(
                            fontSize: 14.sp,
                            color: ColorsResource.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
