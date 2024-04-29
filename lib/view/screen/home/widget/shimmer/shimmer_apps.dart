import 'package:flutter/material.dart';
import 'package:portal_pns_flutter/utill/colors_resource.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerApps extends StatelessWidget {
  const ShimmerApps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Shimmer.fromColors(
            baseColor: ColorsResource.shimmerBaseColor,
            highlightColor: ColorsResource.shimmerHighlightColor,
            child: Container(
              margin: EdgeInsets.only(right: Adaptive.w(1)),
              padding: EdgeInsets.symmetric(
                  horizontal: Adaptive.w(3), vertical: Adaptive.h(0.5)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: ColorsResource.tabIndicator,
              ),
              height: 18.sp,
              width: Adaptive.w(20),
            ),
          ),
        ),
        Flexible(
          child: Shimmer.fromColors(
            baseColor: ColorsResource.shimmerBaseColor,
            highlightColor: ColorsResource.shimmerHighlightColor,
            child: Container(
              margin: EdgeInsets.only(right: Adaptive.w(1)),
              padding: EdgeInsets.symmetric(
                  horizontal: Adaptive.w(3), vertical: Adaptive.h(0.5)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: ColorsResource.tabIndicator,
              ),
              height: 18.sp,
              width: Adaptive.w(20),
            ),
          ),
        ),
        Flexible(
          child: Shimmer.fromColors(
            baseColor: ColorsResource.shimmerBaseColor,
            highlightColor: ColorsResource.shimmerHighlightColor,
            child: Container(
              margin: EdgeInsets.only(right: Adaptive.w(1)),
              padding: EdgeInsets.symmetric(
                  horizontal: Adaptive.w(3), vertical: Adaptive.h(0.5)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: ColorsResource.tabIndicator,
              ),
              height: 18.sp,
              width: Adaptive.w(20),
            ),
          ),
        ),
      ],
    );
  }
}
