import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portal_pns_flutter/utill/colors_resource.dart';
import 'package:portal_pns_flutter/utill/images.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCardRekapAbsensi extends StatelessWidget {
  const ShimmerCardRekapAbsensi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Adaptive.h(1.5)),
      padding:
          EdgeInsets.fromLTRB(Adaptive.w(3), 0, Adaptive.w(3), Adaptive.h(1)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Shimmer.fromColors(
            baseColor: ColorsResource.shimmerBaseColor,
            highlightColor: ColorsResource.shimmerHighlightColor,
            child: Container(
              width: Adaptive.w(10),
              padding: EdgeInsets.fromLTRB(
                  Adaptive.w(1), Adaptive.h(1), Adaptive.w(1), Adaptive.h(1)),
              decoration: BoxDecoration(
                color: Color(0xffd29828),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: '00\n',
                      style: poppinsMedium.copyWith(
                          fontSize: 18.sp,
                          color: Colors.white,
                          backgroundColor: Colors.white),
                    ),
                    TextSpan(
                      text: '01',
                      style: poppinsRegular.copyWith(
                        fontSize: 12.sp,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: Adaptive.w(1)),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: Adaptive.h(1)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Shimmer.fromColors(
                                  baseColor: ColorsResource.shimmerBaseColor,
                                  highlightColor:
                                      ColorsResource.shimmerHighlightColor,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    child: Text(
                                      'Masuk',
                                      style: poppinsLight.copyWith(
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: Adaptive.h(0.5)),
                                Shimmer.fromColors(
                                  baseColor: ColorsResource.shimmerBaseColor,
                                  highlightColor:
                                      ColorsResource.shimmerHighlightColor,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(3),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          Images.ic_masuk,
                                          width: 14.sp,
                                        ),
                                        SizedBox(width: Adaptive.w(2)),
                                        Text(
                                          '--:--',
                                          style: poppinsBold.copyWith(
                                            fontSize: 14.sp,
                                            color: Color(0xff41403f),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: Adaptive.h(0.3)),
                                Shimmer.fromColors(
                                  baseColor: ColorsResource.shimmerBaseColor,
                                  highlightColor:
                                      ColorsResource.shimmerHighlightColor,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(3),
                                      ),
                                    ),
                                    child: Text(
                                      'Hadir',
                                      style: poppinsLight.copyWith(
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
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
                                Shimmer.fromColors(
                                  baseColor: ColorsResource.shimmerBaseColor,
                                  highlightColor:
                                      ColorsResource.shimmerHighlightColor,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    child: Text(
                                      'Masuk',
                                      style: poppinsLight.copyWith(
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: Adaptive.h(0.5)),
                                Shimmer.fromColors(
                                  baseColor: ColorsResource.shimmerBaseColor,
                                  highlightColor:
                                      ColorsResource.shimmerHighlightColor,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(3),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          Images.ic_masuk,
                                          width: 14.sp,
                                        ),
                                        SizedBox(width: Adaptive.w(2)),
                                        Text(
                                          '--:--',
                                          style: poppinsBold.copyWith(
                                            fontSize: 14.sp,
                                            color: Color(0xff41403f),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: Adaptive.h(0.3)),
                                Shimmer.fromColors(
                                  baseColor: ColorsResource.shimmerBaseColor,
                                  highlightColor:
                                      ColorsResource.shimmerHighlightColor,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(3),
                                      ),
                                    ),
                                    child: Text(
                                      'Hadir',
                                      style: poppinsLight.copyWith(
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: Adaptive.w(2)),
                  Shimmer.fromColors(
                    baseColor: ColorsResource.shimmerBaseColor,
                    highlightColor: ColorsResource.shimmerHighlightColor,
                    child: Container(
                      padding: EdgeInsets.all(Adaptive.h(1.5)),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        'A',
                        style: poppinsMedium.copyWith(fontSize: 14.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
