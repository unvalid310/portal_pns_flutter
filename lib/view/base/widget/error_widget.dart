import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portal_pns_flutter/utill/images.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ErrorValueWidget extends StatelessWidget {
  final String? title;
  final String? message;
  const ErrorValueWidget({Key? key, this.title, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              Images.notFound_animated,
              height: Adaptive.h(15),
            ),
            SizedBox(width: Adaptive.w(1)),
            Container(
              width: Adaptive.w(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (title != '') ? title! : 'Maaf!',
                    softWrap: true,
                    style: poppinsMedium.copyWith(
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: Adaptive.h(0.5)),
                  Text(
                    (message != '')
                        ? message!
                        : 'Tidak ada data untuk ditampilkan!',
                    softWrap: true,
                    style: poppinsLight.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
