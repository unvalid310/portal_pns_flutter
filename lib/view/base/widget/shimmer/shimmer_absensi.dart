import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portal_pns_flutter/utill/colors_resource.dart';
import 'package:portal_pns_flutter/utill/images.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerAbsensi extends StatelessWidget {
  const ShimmerAbsensi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, Adaptive.h(3), 0, 0),
      padding: EdgeInsets.symmetric(
          vertical: Adaptive.h(1.5), horizontal: Adaptive.h(2)),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xff41403f).withOpacity(0.5)),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Masuk',
                  style: poppinsLight.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: Adaptive.h(0.5)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Images.ic_masuk,
                      width: 16.sp,
                    ),
                    SizedBox(width: Adaptive.w(2)),
                    Shimmer.fromColors(
                      baseColor: ColorsResource.shimmerBaseColor,
                      highlightColor: ColorsResource.shimmerHighlightColor,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white,
                        ),
                        child: Text(
                          '--:--',
                          style: poppinsBold.copyWith(
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: Adaptive.w(2)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Pulang',
                  style: poppinsLight.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: Adaptive.h(0.5)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Images.ic_pulang,
                      width: 16.sp,
                    ),
                    SizedBox(width: Adaptive.w(2)),
                    Shimmer.fromColors(
                      baseColor: ColorsResource.shimmerBaseColor,
                      highlightColor: ColorsResource.shimmerHighlightColor,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white,
                        ),
                        child: Text(
                          '--:--',
                          style: poppinsBold.copyWith(
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: Adaptive.w(2)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Jam Kerja',
                  style: poppinsLight.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: Adaptive.h(0.5)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Images.ic_jam_kerja,
                      width: 16.sp,
                    ),
                    SizedBox(width: Adaptive.w(2)),
                    Shimmer.fromColors(
                      baseColor: ColorsResource.shimmerBaseColor,
                      highlightColor: ColorsResource.shimmerHighlightColor,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white,
                        ),
                        child: Text(
                          '--:--',
                          style: poppinsBold.copyWith(
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: Adaptive.w(2)),
        ],
      ),
    );
  }
}
