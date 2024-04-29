import 'package:flutter/material.dart';
import 'package:portal_pns_flutter/utill/colors_resource.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCardSurat extends StatelessWidget {
  const ShimmerCardSurat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Adaptive.w(5), vertical: Adaptive.w(3)),
      decoration: BoxDecoration(color: Colors.white),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Shimmer.fromColors(
                baseColor: ColorsResource.shimmerBaseColor,
                highlightColor: ColorsResource.shimmerHighlightColor,
                child: Container(
                  width: Adaptive.w(10),
                  height: 13.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                ),
              ),
              Shimmer.fromColors(
                baseColor: ColorsResource.shimmerBaseColor,
                highlightColor: ColorsResource.shimmerHighlightColor,
                child: Container(
                  width: Adaptive.w(10),
                  height: 12.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: Adaptive.h(1)),
          Shimmer.fromColors(
            baseColor: ColorsResource.shimmerBaseColor,
            highlightColor: ColorsResource.shimmerHighlightColor,
            child: Container(
              width: double.infinity,
              height: 16.sp,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
            ),
          ),
          SizedBox(height: Adaptive.h(0.3)),
          Shimmer.fromColors(
            baseColor: ColorsResource.shimmerBaseColor,
            highlightColor: ColorsResource.shimmerHighlightColor,
            child: Container(
              width: Adaptive.w(75),
              height: 16.sp,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
            ),
          ),
          SizedBox(height: Adaptive.h(1)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Shimmer.fromColors(
                baseColor: ColorsResource.shimmerBaseColor,
                highlightColor: ColorsResource.shimmerHighlightColor,
                child: Container(
                  width: Adaptive.w(15),
                  height: 14.sp,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                ),
              ),
              SizedBox(width: Adaptive.w(1.5)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: ColorsResource.shimmerBaseColor,
                      highlightColor: ColorsResource.shimmerHighlightColor,
                      child: Container(
                        width: double.infinity,
                        height: 14.sp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: Adaptive.h(0.3)),
                    Shimmer.fromColors(
                      baseColor: ColorsResource.shimmerBaseColor,
                      highlightColor: ColorsResource.shimmerHighlightColor,
                      child: Container(
                        width: Adaptive.w(45),
                        height: 14.sp,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: Adaptive.h(1)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Shimmer.fromColors(
                baseColor: ColorsResource.shimmerBaseColor,
                highlightColor: ColorsResource.shimmerHighlightColor,
                child: Container(
                  width: Adaptive.w(15),
                  height: 14.sp,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                ),
              ),
              Shimmer.fromColors(
                baseColor: ColorsResource.shimmerBaseColor,
                highlightColor: ColorsResource.shimmerHighlightColor,
                child: Container(
                  width: Adaptive.w(30),
                  height: 14.sp,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
