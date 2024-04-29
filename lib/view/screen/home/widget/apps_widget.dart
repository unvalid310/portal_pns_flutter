import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portal_pns_flutter/cubit/apps/apps_cubit.dart';
import 'package:portal_pns_flutter/helper/string_helper.dart';
import 'package:portal_pns_flutter/utill/colors_resource.dart';
import 'package:portal_pns_flutter/utill/images.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:portal_pns_flutter/view/screen/home/widget/shimmer/shimmer_apps.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class AppsWidget extends StatelessWidget {
  const AppsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.fromLTRB(Adaptive.w(5), 0, Adaptive.w(5), Adaptive.h(8)),
      padding: EdgeInsets.symmetric(
          vertical: Adaptive.h(1.5), horizontal: Adaptive.w(4)),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick App',
            style: poppinsBold.copyWith(
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: Adaptive.h(2)),
          BlocConsumer<AppsCubit, AppsState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is AppsProgress) {
                return ShimmerApps();
              }

              if (state is AppsSuccess) {
                return Row(
                  children: [
                    for (var item in state.apps)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (item.logo != '')
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Container(
                                margin: EdgeInsets.only(right: Adaptive.w(1)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: Adaptive.w(3),
                                    vertical: Adaptive.h(0.5)),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: ColorsResource.tabIndicator,
                                ),
                                child: CachedNetworkImage(
                                  height: 18.sp,
                                  imageUrl:
                                      '${dotenv.env['BASE_URL_DATAWAREHOUSE']}/${item.logo}',
                                  fit: BoxFit.fitHeight,
                                  errorWidget: (context, url, dynamic error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              onTap: () async => await launchURL(
                                  context: context, url: item.url),
                            )
                          else
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Container(
                                margin: EdgeInsets.only(right: Adaptive.w(1)),
                                padding: EdgeInsets.only(
                                  left: Adaptive.w(2),
                                  right: Adaptive.w(3),
                                  top: Adaptive.h(0.5),
                                  bottom: Adaptive.h(0.5),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: ColorsResource.tabIndicator,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      Images.metro,
                                      height: 16.sp,
                                      fit: BoxFit.fitHeight,
                                    ),
                                    SizedBox(width: Adaptive.w(1)),
                                    Text(
                                      item.nama,
                                      style: poppinsMedium.copyWith(
                                        fontSize: 14.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () async => await launchURL(
                                  context: context, url: item.url),
                            ),
                        ],
                      ),
                  ],
                );
              }
              return SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
