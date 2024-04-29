import 'package:flutter/material.dart';
import 'package:portal_pns_flutter/utill/colors_resource.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerUnitKerja extends StatelessWidget {
  const ShimmerUnitKerja({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsResource.shimmerBaseColor,
      highlightColor: ColorsResource.shimmerHighlightColor,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: Adaptive.h(3)),
        padding: EdgeInsets.symmetric(
            horizontal: Adaptive.w(3), vertical: Adaptive.w(1.5)),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xff41403f).withOpacity(0.5)),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                'Lorem ipsum is dolor amet ipsum is at lord may',
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: poppinsMedium.copyWith(
                  fontSize: 14.sp,
                ),
              ),
            ),
            SizedBox(width: Adaptive.w(2)),
            Icon(
              Icons.arrow_drop_down_outlined,
              size: 16.sp,
            )
          ],
        ),
      ),
    );
  }
}
