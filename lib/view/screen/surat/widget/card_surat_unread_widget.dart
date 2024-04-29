// ignore_for_file: prefer_const_constructors

import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:portal_pns_flutter/data/model/msurat.dart';
import 'package:portal_pns_flutter/helper/string_helper.dart';
import 'package:portal_pns_flutter/utill/colors_resource.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:portal_pns_flutter/view/screen/surat/widget/daftar_tujuan_widget.dart';
import 'package:portal_pns_flutter/view/screen/surat/widget/nota_dinas_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:strings/strings.dart';

class CardSuratUnreadWidget extends StatelessWidget {
  final SuratModel surat;
  const CardSuratUnreadWidget({Key? key, required this.surat})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Adaptive.w(5), vertical: Adaptive.w(3)),
      decoration: BoxDecoration(color: Colors.white),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  Text(
                    surat.nomor,
                    style: poppinsBold.copyWith(
                      fontSize: 13.sp,
                    ),
                  ),
                  SizedBox(width: Adaptive.w(1)),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Adaptive.w(1.5),
                      vertical: Adaptive.h(0.2),
                    ),
                    decoration: BoxDecoration(
                        color: ColorsResource.primary,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      'Baru',
                      style: poppinsRegular.copyWith(
                        fontSize: 12.sp,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              Text(
                timeFormat(surat.tanggal),
                style: poppinsRegular.copyWith(
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: Adaptive.h(0.3)),
          Text(
            surat.perihal,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: poppinsBold.copyWith(
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: Adaptive.h(1.5)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tujuan :',
                style: poppinsRegular.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(width: Adaptive.w(1.5)),
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          style: poppinsMedium.copyWith(fontSize: 14.sp),
                          children: [
                            if (surat.tujuan.length > 1)
                              for (var i = 0; i < 2; i++)
                                if (i == 0)
                                  TextSpan(
                                    text: surat.tujuan[i],
                                    style: poppinsRegular.copyWith(
                                      color: ColorsResource.tabIndicator,
                                    ),
                                  )
                                else
                                  TextSpan(
                                    text: ',  ${surat.tujuan[i]}',
                                    style: poppinsRegular.copyWith(
                                      color: ColorsResource.tabIndicator,
                                    ),
                                  )
                            else
                              TextSpan(
                                text: surat.tujuan[0],
                                style: poppinsRegular.copyWith(
                                  color: ColorsResource.tabIndicator,
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (surat.tujuan.length > 2)
                        Row(
                          children: [
                            Text(
                              'dan ${surat.tujuan.length - 2} Tujuan Lainnya',
                              style: poppinsBold.copyWith(
                                fontSize: 14.sp,
                                color: ColorsResource.tabIndicator,
                              ),
                            ),
                            SizedBox(width: Adaptive.w(0.2)),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 16.sp,
                              color: ColorsResource.tabIndicator,
                            ),
                          ],
                        ),
                    ],
                  ),
                  onTap: () async {
                    if (surat.tujuan.length > 2) {
                      return showDialog(
                        context: context,
                        builder: (context) => DaftarTujuanWidget(
                          tujuan: surat.tujuan,
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: Adaptive.h(1)),
          Row(
            mainAxisAlignment: (surat.nota_dinas!.isNotEmpty)
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.end,
            children: [
              if (surat.nota_dinas!.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(right: Adaptive.w(2)),
                  child: InkWell(
                    child: Row(
                      children: [
                        Icon(
                          Icons.sticky_note_2_outlined,
                          size: 14.sp,
                          color: ColorsResource.primary,
                        ),
                        SizedBox(width: Adaptive.w(1)),
                        Text(
                          'Nota dinas',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: poppinsMedium.copyWith(
                            fontSize: 14.sp,
                            color: ColorsResource.primary,
                          ),
                        ),
                      ],
                    ),
                    onTap: () => showDialog<void>(
                      context: context,
                      builder: (context) => NotaDinasWidget(
                        notaDinas: surat.nota_dinas.toString(),
                      ),
                    ),
                  ),
                ),
              Row(
                children: [
                  Icon(
                    Icons.check_circle_outline_rounded,
                    size: 14.sp,
                    color: ColorsResource.textColor,
                  ),
                  SizedBox(width: Adaptive.w(1)),
                  Text(
                    '${camelize(surat.status)}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: poppinsMedium.copyWith(
                      fontSize: 14.sp,
                      color: ColorsResource.textMuted,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
