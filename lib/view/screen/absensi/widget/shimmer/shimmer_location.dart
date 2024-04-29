import 'package:flutter/material.dart';
import 'package:portal_pns_flutter/utill/colors_resource.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLocation extends StatelessWidget {
  const ShimmerLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Adaptive.h(5)),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Lokasi saat ini :',
                style: poppinsMedium.copyWith(
                  fontSize: 13.sp,
                ),
              ),
              SizedBox(width: Adaptive.w(2)),
              Shimmer.fromColors(
                baseColor: ColorsResource.shimmerBaseColor,
                highlightColor: ColorsResource.shimmerHighlightColor,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: Adaptive.h(0.3), horizontal: Adaptive.h(0.5)),
                  decoration: BoxDecoration(
                    color: Color(0xff41a433),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        size: 14.sp,
                        color: Colors.white,
                      ),
                      SizedBox(width: Adaptive.w(1)),
                      Text(
                        'Petunjuk Lokasi',
                        style: poppinsLight.copyWith(
                            fontSize: 12.sp, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: Adaptive.h(0.5)),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: Adaptive.h(0.4)),
                child: Icon(
                  Icons.location_pin,
                  size: 16.sp,
                ),
              ),
              SizedBox(width: Adaptive.w(2)),
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: ColorsResource.shimmerBaseColor,
                  highlightColor: ColorsResource.shimmerHighlightColor,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Text(
                      'Jl. Imopuro No. 10',
                      maxLines: 1,
                      softWrap: true,
                      style: poppinsLight.copyWith(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
