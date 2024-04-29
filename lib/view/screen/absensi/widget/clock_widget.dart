import 'package:flutter/material.dart';
import 'package:portal_pns_flutter/helper/string_helper.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class ClockWidget extends StatelessWidget {
  const ClockWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Positioned(
          top: Adaptive.h(-0.5),
          child: Text(
            daytimeFormat(DateTime.now().toString()),
            style: poppinsRegular.copyWith(fontSize: 16.sp),
          ),
        ),
        DigitalClock(
          digitAnimationStyle: Curves.elasticOut,
          is24HourTimeFormat: true,
          showSecondsDigit: false,
          areaDecoration: const BoxDecoration(color: Colors.transparent),
          hourMinuteDigitTextStyle: poppinsMedium.copyWith(fontSize: 32.sp),
          areaAligment: AlignmentDirectional.center,
          colon: Text(
            ':',
            style: poppinsMedium.copyWith(fontSize: 30.sp),
          ),
          areaHeight: Adaptive.h(9.5),
        ),
      ],
    );
  }
}
