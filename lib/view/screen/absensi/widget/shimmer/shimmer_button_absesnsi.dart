import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portal_pns_flutter/utill/colors_resource.dart';
import 'package:portal_pns_flutter/utill/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerButtonAnsensi extends StatelessWidget {
  const ShimmerButtonAnsensi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Adaptive.h(3)),
      child: Shimmer.fromColors(
        baseColor: ColorsResource.shimmerBaseColor,
        highlightColor: ColorsResource.shimmerHighlightColor,
        child: Container(
          padding: EdgeInsets.fromLTRB(
              Adaptive.h(4), Adaptive.h(4.5), Adaptive.h(2.5), Adaptive.h(4.5)),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            Images.ic_absensi,
            width: Adaptive.w(30),
          ),
        ),
      ),
    );
  }
}
