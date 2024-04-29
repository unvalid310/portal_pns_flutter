import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portal_pns_flutter/data/model/mberita.dart';
import 'package:portal_pns_flutter/helper/string_helper.dart';
import 'package:portal_pns_flutter/utill/colors_resource.dart';
import 'package:portal_pns_flutter/utill/images.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:portal_pns_flutter/view/screen/berita/detail_berita_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class ListBeritaHorizontalWidget extends StatelessWidget {
  final List<Mberita> listBerita;
  final String message;
  final String title;
  const ListBeritaHorizontalWidget({
    Key? key,
    required this.listBerita,
    this.message = '',
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(listBerita);

    return (listBerita.isNotEmpty)
        ? Row(
            children: [
              for (var item in listBerita)
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Container(
                    margin: EdgeInsets.only(right: Adaptive.w(3)),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    width: Adaptive.w(50),
                    child: Column(
                      children: [
                        Container(
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: double.infinity,
                                height: Adaptive.h(15),
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: item.urlfoto,
                                  fit: BoxFit.cover,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          Shimmer.fromColors(
                                    child: Container(
                                      width: double.infinity,
                                      height: Adaptive.h(15),
                                      color: Colors.white,
                                    ),
                                    baseColor: ColorsResource.shimmerBaseColor,
                                    highlightColor:
                                        ColorsResource.shimmerHighlightColor,
                                  ),
                                  errorWidget: (context, url, dynamic error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: Adaptive.h(1.5),
                              horizontal: Adaptive.w(2.5)),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.judul,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: poppinsMedium.copyWith(
                                  fontSize: 16.sp,
                                ),
                              ),
                              SizedBox(height: Adaptive.h(0.5)),
                              Text(
                                daytimeFormat(
                                  item.tgl.toString(),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: poppinsLight.copyWith(
                                  fontSize: 12.sp,
                                  color: ColorsResource.textMuted,
                                ),
                              ),
                              SizedBox(height: Adaptive.h(1)),
                              Text(
                                item.isiexcerpt,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: poppinsLight.copyWith(
                                  fontSize: 13.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => DetailBeritaScreen(berita: item),
                    ),
                  ),
                ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      Images.notFound_animated,
                      height: Adaptive.h(10),
                    ),
                    SizedBox(width: Adaptive.w(1)),
                    Container(
                      width: Adaptive.w(40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (title != '') ? title : 'Maaf!',
                            softWrap: true,
                            style: poppinsMedium.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: Adaptive.h(0.5)),
                          Text(
                            (message != '')
                                ? message
                                : 'Tidak ada data untuk ditampilkan!',
                            softWrap: true,
                            style: poppinsLight.copyWith(
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
  }
}
