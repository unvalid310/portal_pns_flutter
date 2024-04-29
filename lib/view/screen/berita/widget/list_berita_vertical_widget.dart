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

class ListBeritaVerticalWidget extends StatelessWidget {
  final List<Mberita> listBerita;
  final String message;
  final String title;
  const ListBeritaVerticalWidget({
    Key? key,
    required this.listBerita,
    this.message = '',
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (listBerita.isNotEmpty)
        ? ListView.separated(
            itemCount: listBerita.length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            clipBehavior: Clip.none,
            separatorBuilder: (context, index) =>
                SizedBox(height: Adaptive.h(3)),
            itemBuilder: (context, index) => InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: Adaptive.h(17),
                    height: Adaptive.h(15),
                    clipBehavior: Clip.hardEdge,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: CachedNetworkImage(
                      imageUrl: listBerita[index].urlfoto,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              Shimmer.fromColors(
                        child: Container(
                          width: Adaptive.h(17),
                          height: Adaptive.h(15),
                          color: Colors.white,
                        ),
                        baseColor: ColorsResource.shimmerBaseColor,
                        highlightColor: ColorsResource.shimmerHighlightColor,
                      ),
                      errorWidget: (context, url, dynamic error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: Adaptive.w(3)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          listBerita[index].judul,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: poppinsBold.copyWith(
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: Adaptive.h(0.5)),
                        Text(
                          daytimeFormat(
                            listBerita[index].tgl.toString(),
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
                          listBerita[index].isiexcerpt,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: poppinsLight.copyWith(
                            fontSize: 13.sp,
                          ),
                        ),
                        SizedBox(height: Adaptive.h(1)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Selengkapnya',
                              maxLines: 2,
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.ellipsis,
                              style: poppinsMedium.copyWith(
                                fontSize: 13.sp,
                                color: ColorsResource.tabIndicator,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),)
                ],
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) =>
                      DetailBeritaScreen(berita: listBerita[index]),
                ),
              ),
            ),
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Lottie.asset(
                  Images.notFound_animated,
                  height: Adaptive.h(25),
                ),
                SizedBox(width: Adaptive.w(1)),
                Text(
                  (title != '') ? title : 'Maaf!',
                  softWrap: true,
                  style: poppinsMedium.copyWith(
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: Adaptive.h(0.5)),
                Text(
                  (message != '')
                      ? message
                      : 'Tidak ada data untuk ditampilkan!',
                  softWrap: true,
                  style: poppinsLight.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          );
  }
}
