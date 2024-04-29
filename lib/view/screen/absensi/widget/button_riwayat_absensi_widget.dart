import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portal_pns_flutter/utill/images.dart';
import 'package:portal_pns_flutter/utill/routes.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ButtonRiwayatAbsensiWidget extends StatelessWidget {
  const ButtonRiwayatAbsensiWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: Adaptive.h(3)),
        padding: EdgeInsets.symmetric(
            horizontal: Adaptive.h(1), vertical: Adaptive.h(0.5)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color(0xffb64b4b),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(Images.ic_history),
            SizedBox(width: Adaptive.w(2)),
            Text(
              'Riwayat Absensi',
              style: poppinsMedium.copyWith(
                fontSize: 12.sp,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(Routes.RIWAYAT_ABSENSI_SCREEN);
      },
    );
  }
}
