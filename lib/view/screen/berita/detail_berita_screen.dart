import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:portal_pns_flutter/data/model/mberita.dart';
import 'package:portal_pns_flutter/helper/string_helper.dart';
import 'package:portal_pns_flutter/utill/colors_resource.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

class DetailBeritaScreen extends StatelessWidget {
  final Mberita berita;
  const DetailBeritaScreen({Key? key, required this.berita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: Adaptive.h(35),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: berita.urlfoto,
                      width: double.infinity,
                      height: Adaptive.h(35),
                      fit: BoxFit.cover,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              Shimmer.fromColors(
                        child: Container(
                          width: double.infinity,
                          height: Adaptive.h(35),
                          color: Colors.white,
                        ),
                        baseColor: ColorsResource.shimmerBaseColor,
                        highlightColor: ColorsResource.shimmerHighlightColor,
                      ),
                      errorWidget: (context, url, dynamic error) =>
                          const Icon(Icons.error),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Adaptive.w(5), vertical: Adaptive.h(3)),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Container(
                                padding: EdgeInsets.all(Adaptive.h(0.5)),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                child: Icon(
                                  Icons.close_rounded,
                                  size: 16.sp,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () => Navigator.pop(context),
                            ),
                            InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Container(
                                  padding: EdgeInsets.all(Adaptive.h(0.5)),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                  child: Icon(
                                    Icons.share_rounded,
                                    size: 16.sp,
                                    color: Colors.white,
                                  ),
                                ),
                                onTap: () async {
                                  final box =
                                      context.findRenderObject() as RenderBox?;
                                  await Share.share(
                                    berita.link,
                                    subject: berita.judul,
                                  );
                                }),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Adaptive.w(5), vertical: Adaptive.h(1)),
                        width: double.infinity,
                        decoration:
                            BoxDecoration(color: Colors.black.withOpacity(0.5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.calendar_today_rounded,
                              size: 12.sp,
                              color: Colors.white,
                            ),
                            SizedBox(width: Adaptive.w(1)),
                            Text(
                              daytimeFormat(
                                berita.tgl.toString(),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: poppinsRegular.copyWith(
                                fontSize: 12.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Adaptive.h(2)),
              Padding(
                padding:
                    EdgeInsets.only(left: Adaptive.w(5), right: Adaptive.w(5)),
                child: Text(
                  berita.judul,
                  textAlign: TextAlign.justify,
                  style: poppinsBold.copyWith(
                    fontSize: 18.sp,
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: Adaptive.w(5), right: Adaptive.w(5)),
                child: Divider(
                  height: Adaptive.h(2),
                  thickness: 1.5,
                  color: ColorsResource.textMuted.withOpacity(0.3),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: Adaptive.w(5), right: Adaptive.w(5)),
                child: HtmlWidget(
                  '${berita.isifull} <br><br>',
                  customStylesBuilder: (element) {
                    if (element.localName!.contains('p')) {
                      return {
                        'white-space': 'normal',
                        'text-align': 'justify',
                        'word-break': 'break-all',
                      };
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
