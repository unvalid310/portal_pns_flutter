import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portal_pns_flutter/data/model/mabsensi.dart';
import 'package:portal_pns_flutter/helper/string_helper.dart';
import 'package:portal_pns_flutter/utill/colors_resource.dart';
import 'package:portal_pns_flutter/utill/images.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CardRekapAbsensiWidget extends StatelessWidget {
  final MrekapAbsensi absensi;
  const CardRekapAbsensiWidget({Key? key, required this.absensi})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int index = 1;
    Mabsen _masuk = absensi.absenMasuk!;
    Mabsen _pulang = absensi.absenPulang!;

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
          Container(
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
                    text: '${getDate(absensi.tanggal!)}\n',
                    style: poppinsMedium.copyWith(
                      fontSize: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: getDayname(absensi.tanggal!),
                    style: poppinsRegular.copyWith(
                      fontSize: 12.sp,
                      color: Colors.white,
                    ),
                  )
                ],
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
                  // ketika anda cuti
                  if (absensi.isLeave!)
                    Expanded(
                      child: Container(
                        child: Text(
                          absensi.leaveDesc!,
                          textAlign: TextAlign.center,
                          style: poppinsRegular.copyWith(
                            fontSize: 12.sp,
                            color: ColorsResource.warning,
                          ),
                        ),
                      ),
                    )

                  // ketika waktu libur
                  else if (absensi.isDayoff!)
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: Adaptive.h(2)),
                        child: Text(
                          absensi.dayoffDesc!,
                          textAlign: TextAlign.center,
                          style: poppinsRegular.copyWith(
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    )

                  // ketika masuk atau tidak
                  else if (_masuk.isPresent! || _pulang.isPresent!)
                    Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Masuk',
                                    style: poppinsLight.copyWith(
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  SizedBox(height: Adaptive.h(0.5)),
                                  Row(
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
                                        (_masuk.tanggal != null)
                                            ? getTimeOfDate(_masuk.tanggal!)
                                            : '--:--',
                                        style: poppinsBold.copyWith(
                                          fontSize: 14.sp,
                                          color: (_masuk.isLate!)
                                              ? ColorsResource.danger
                                              : Color(0xff41403f),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Hadir',
                                    style: poppinsLight.copyWith(
                                      fontSize: 12.sp,
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
                                  Text(
                                    'Pulang',
                                    style: poppinsLight.copyWith(
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  SizedBox(height: Adaptive.h(0.5)),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        Images.ic_pulang,
                                        width: 14.sp,
                                      ),
                                      SizedBox(width: Adaptive.w(2)),
                                      Text(
                                        (_pulang.tanggal != null)
                                            ? getTimeOfDate(_pulang.tanggal!)
                                            : '--:--',
                                        style: poppinsBold.copyWith(
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Selesai',
                                    style: poppinsLight.copyWith(
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    Expanded(
                      child: Container(
                        child: Text(
                          'Tidak melakukan absensi',
                          textAlign: TextAlign.center,
                          style: poppinsRegular.copyWith(
                            fontSize: 12.sp,
                            color: ColorsResource.danger,
                          ),
                        ),
                      ),
                    ),

                  SizedBox(width: Adaptive.w(2)),

                  // ketika libur
                  if (absensi.isDayoff!)
                    Container(
                      padding: EdgeInsets.all(Adaptive.h(1.5)),
                      decoration: BoxDecoration(
                        color: Color(0XFFF4F6FA),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        'L',
                        style: poppinsMedium.copyWith(fontSize: 14.sp),
                      ),
                    )

                  // ketika cuti
                  else if (absensi.isLeave!)
                    Container(
                      padding: EdgeInsets.all(Adaptive.h(1.5)),
                      decoration: BoxDecoration(
                        color: ColorsResource.warning.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        'C',
                        style: poppinsMedium.copyWith(fontSize: 14.sp),
                      ),
                    )

                  // ketika masuk atau tidak
                  else if (_masuk.isPresent! || _pulang.isPresent!)
                    Container(
                      padding: EdgeInsets.all(Adaptive.h(1.5)),
                      decoration: BoxDecoration(
                        color: ColorsResource.success.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        'P',
                        style: poppinsMedium.copyWith(fontSize: 14.sp),
                      ),
                    )
                  else
                    Container(
                      padding: EdgeInsets.all(Adaptive.h(1.5)),
                      decoration: BoxDecoration(
                        color: ColorsResource.danger.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        'A',
                        style: poppinsMedium.copyWith(fontSize: 14.sp),
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
