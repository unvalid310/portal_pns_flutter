import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portal_pns_flutter/data/model/mberita.dart';
import 'package:portal_pns_flutter/helper/string_helper.dart';
import 'package:portal_pns_flutter/utill/colors_resource.dart';
import 'package:portal_pns_flutter/utill/images.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListBeritaVerticalWidget extends StatelessWidget {
  const ShimmerListBeritaVerticalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      clipBehavior: Clip.none,
      separatorBuilder: (context, index) => SizedBox(height: Adaptive.h(3)),
      itemBuilder: (context, index) => InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: ColorsResource.shimmerBaseColor,
              highlightColor: ColorsResource.shimmerHighlightColor,
              child: Container(
                width: Adaptive.h(17),
                height: Adaptive.h(15),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
                child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: Adaptive.w(3)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Adaptive.h(1)),
                  Shimmer.fromColors(
                    baseColor: ColorsResource.shimmerBaseColor,
                    highlightColor: ColorsResource.shimmerHighlightColor,
                    child: Container(
                      height: 18.sp,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(height: Adaptive.h(0.5)),
                  Shimmer.fromColors(
                    baseColor: ColorsResource.shimmerBaseColor,
                    highlightColor: ColorsResource.shimmerHighlightColor,
                    child: Container(
                      height: 18.sp,
                      width: Adaptive.w(40),
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
                      height: 12.sp,
                      width: Adaptive.w(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(height: Adaptive.h(1)),
                  Shimmer.fromColors(
                    baseColor: ColorsResource.shimmerBaseColor,
                    highlightColor: ColorsResource.shimmerHighlightColor,
                    child: Container(
                      height: 14.sp,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(height: Adaptive.h(0.5)),
                  Shimmer.fromColors(
                    baseColor: ColorsResource.shimmerBaseColor,
                    highlightColor: ColorsResource.shimmerHighlightColor,
                    child: Container(
                      height: 14.sp,
                      width: Adaptive.w(45),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(height: Adaptive.h(1)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
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
                    ],
                  ),
                ],
              ),
            ))
          ],
        ),
        onTap: () => null,
      ),
    );
  }
}
