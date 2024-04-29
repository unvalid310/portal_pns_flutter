import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portal_pns_flutter/utill/colors_resource.dart';
import 'package:portal_pns_flutter/utill/images.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerButtonRiwaayatAbsensi extends StatelessWidget {
  const ShimmerButtonRiwaayatAbsensi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsResource.shimmerBaseColor,
      highlightColor: ColorsResource.shimmerHighlightColor,
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
    );
  }
}
