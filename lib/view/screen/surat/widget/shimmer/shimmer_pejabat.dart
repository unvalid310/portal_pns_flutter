import 'package:flutter/material.dart';
import 'package:portal_pns_flutter/utill/colors_resource.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPejabat extends StatelessWidget {
  const ShimmerPejabat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      // clipBehavior: Clip.none,
      itemCount: 10,
      separatorBuilder: (context, index) => SizedBox(
        height: Adaptive.h(3),
      ),
      itemBuilder: (context, index) => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: ColorsResource.shimmerBaseColor,
              highlightColor: ColorsResource.shimmerHighlightColor,
              child: Container(
                width: double.infinity,
                height: Adaptive.sp(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: Adaptive.h(1)),
            Shimmer.fromColors(
              baseColor: ColorsResource.shimmerBaseColor,
              highlightColor: ColorsResource.shimmerHighlightColor,
              child: Container(
                width: Adaptive.w(25),
                height: Adaptive.sp(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
