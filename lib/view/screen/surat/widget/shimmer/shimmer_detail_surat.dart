import 'package:flutter/material.dart';
import 'package:portal_pns_flutter/utill/colors_resource.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerDetailSurat extends StatelessWidget {
  const ShimmerDetailSurat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: Adaptive.h(5)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Adaptive.w(5),
                vertical: Adaptive.h(2),
              ),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Shimmer.fromColors(
                        baseColor: ColorsResource.shimmerBaseColor,
                        highlightColor: ColorsResource.shimmerHighlightColor,
                        child: Container(
                          height: 13.sp,
                          width: Adaptive.w(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Shimmer.fromColors(
                        baseColor: ColorsResource.shimmerBaseColor,
                        highlightColor: ColorsResource.shimmerHighlightColor,
                        child: Container(
                          height: 13.sp,
                          width: Adaptive.w(25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
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
                      height: 16.sp,
                      width: double.infinity,
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
                      height: 16.sp,
                      width: Adaptive.w(85),
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
                      height: 16.sp,
                      width: Adaptive.w(45),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: Adaptive.h(2)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: ColorsResource.shimmerBaseColor,
                        highlightColor: ColorsResource.shimmerHighlightColor,
                        child: Container(
                          height: 14.sp,
                          width: Adaptive.w(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: Adaptive.w(2)),
                      Expanded(
                        child: Column(
                          children: [
                            Shimmer.fromColors(
                              baseColor: ColorsResource.shimmerBaseColor,
                              highlightColor:
                                  ColorsResource.shimmerHighlightColor,
                              child: Container(
                                height: 14.sp,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: Adaptive.h(1)),
                            Shimmer.fromColors(
                              baseColor: ColorsResource.shimmerBaseColor,
                              highlightColor:
                                  ColorsResource.shimmerHighlightColor,
                              child: Container(
                                height: 14.sp,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Adaptive.h(2)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: ColorsResource.shimmerBaseColor,
                        highlightColor: ColorsResource.shimmerHighlightColor,
                        child: Container(
                          height: 14.sp,
                          width: Adaptive.w(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: Adaptive.w(2)),
                      Expanded(
                        child: Shimmer.fromColors(
                          baseColor: ColorsResource.shimmerBaseColor,
                          highlightColor: ColorsResource.shimmerHighlightColor,
                          child: Container(
                            height: 14.sp,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: Adaptive.h(3),
                    thickness: 1.5,
                    color: ColorsResource.textMuted.withOpacity(0.2),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Shimmer.fromColors(
                        baseColor: ColorsResource.shimmerBaseColor,
                        highlightColor: ColorsResource.shimmerHighlightColor,
                        child: Container(
                          height: 14.sp,
                          width: Adaptive.w(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: Adaptive.w(2)),
                      Shimmer.fromColors(
                        baseColor: ColorsResource.shimmerBaseColor,
                        highlightColor: ColorsResource.shimmerHighlightColor,
                        child: Container(
                          height: 14.sp,
                          width: Adaptive.w(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: Adaptive.h(2)),
            Shimmer.fromColors(
              baseColor: ColorsResource.shimmerBaseColor,
              highlightColor: ColorsResource.shimmerHighlightColor,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: Adaptive.w(2),
                ),
                height: Adaptive.h(50),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: Adaptive.h(2)),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Adaptive.w(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Shimmer.fromColors(
                    baseColor: ColorsResource.shimmerBaseColor,
                    highlightColor: ColorsResource.shimmerHighlightColor,
                    child: Container(
                      height: Adaptive.h(3),
                      width: Adaptive.w(30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: ColorsResource.shimmerBaseColor,
                    highlightColor: ColorsResource.shimmerHighlightColor,
                    child: Container(
                      height: Adaptive.h(3),
                      width: Adaptive.w(30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
