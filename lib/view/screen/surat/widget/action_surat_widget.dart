import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portal_pns_flutter/cubit/surat/surat_cubit.dart';
import 'package:portal_pns_flutter/data/model/msurat.dart';
import 'package:portal_pns_flutter/utill/colors_resource.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:portal_pns_flutter/view/screen/surat/pages/tanda_tangan_page.dart';
import 'package:portal_pns_flutter/view/screen/surat/widget/pengajuan_surat_widget.dart';
import 'package:portal_pns_flutter/view/screen/surat/widget/pengembalian_surat_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ActionSuratWidget extends StatelessWidget {
  final SuratModel surat;
  final String nip;
  final String page;
  const ActionSuratWidget({
    Key? key,
    required this.surat,
    required this.nip,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: Adaptive.h(1), horizontal: Adaptive.w(3)),
      child: (page == 'draft')
          ? (surat.posisi == nip)
              ? Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (surat.create_by != nip)
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Adaptive.w(3),
                              vertical: Adaptive.h(1)),
                          decoration: BoxDecoration(
                            color: ColorsResource.danger,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.cancel_schedule_send,
                                size: 14.sp,
                                color: Colors.white,
                              ),
                              SizedBox(width: Adaptive.w(1)),
                              Text(
                                'Kembalikan ${surat.create_by}',
                                style: poppinsMedium.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () async {
                          await showDialog<void>(
                            context: context,
                            builder: (context) => BlocProvider.value(
                              value: BlocProvider.of<SuratCubit>(context),
                              child: PengembalianSuratWidget(
                                surat: surat,
                              ),
                            ),
                          );
                        },
                      ),
                    if (surat.penandatangan == nip)
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Adaptive.w(3),
                              vertical: Adaptive.h(1)),
                          decoration: BoxDecoration(
                            color: ColorsResource.success,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.qr_code_rounded,
                                size: 14.sp,
                                color: Colors.white,
                              ),
                              SizedBox(width: Adaptive.w(1)),
                              Text(
                                'Tandatangan',
                                style: poppinsMedium.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (context) => BlocProvider.value(
                                value: BlocProvider.of<SuratCubit>(context),
                                child: TandaTanganPage(
                                  surat: surat,
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    else
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Adaptive.w(3),
                              vertical: Adaptive.h(1)),
                          decoration: BoxDecoration(
                            color: ColorsResource.primary,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.send_rounded,
                                size: 14.sp,
                                color: Colors.white,
                              ),
                              SizedBox(width: Adaptive.w(1)),
                              Text(
                                'Ajukan Surat',
                                style: poppinsMedium.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () async {
                          await showDialog<void>(
                            context: context,
                            builder: (context) => BlocProvider.value(
                              value: BlocProvider.of<SuratCubit>(context),
                              child: PengajuanSuratWidget(surat: surat),
                            ),
                          );
                        },
                      ),
                  ],
                )
              : SizedBox()
          : (page == 'inbox')
              ? InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Adaptive.w(3), vertical: Adaptive.h(1)),
                    decoration: BoxDecoration(
                      color: ColorsResource.primary,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.send_rounded,
                          size: 14.sp,
                          color: Colors.white,
                        ),
                        SizedBox(width: Adaptive.w(1)),
                        Text(
                          'Disposisi',
                          style: poppinsMedium.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : null,
    );
  }
}
