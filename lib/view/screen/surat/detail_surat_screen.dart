// ignore_for_file: sort_constructors_first, prefer_const_constructors, prefer_final_locals, omit_local_variable_types, use_named_constants

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/src/overlay_controller_widget_extension.dart';
import 'package:portal_pns_flutter/cubit/surat/surat_cubit.dart';
import 'package:portal_pns_flutter/data/model/msurat.dart';
import 'package:portal_pns_flutter/di_container.dart' as di;
import 'package:portal_pns_flutter/utill/app_constants.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:portal_pns_flutter/view/base/widget/alert_dialog_widget.dart';
import 'package:portal_pns_flutter/view/screen/surat/pages/tanda_tangan_page.dart';
import 'package:portal_pns_flutter/view/screen/surat/widget/action_surat_widget.dart';
import 'package:portal_pns_flutter/view/screen/surat/widget/disposisi_surat_widget.dart';
import 'package:portal_pns_flutter/view/screen/surat/widget/header_surat_widget.dart';
import 'package:portal_pns_flutter/view/screen/surat/widget/nota_dinas_widget.dart';
import 'package:portal_pns_flutter/view/screen/surat/widget/pdf_viewer_widget.dart';
import 'package:portal_pns_flutter/view/screen/surat/widget/pengajuan_surat_widget.dart';
import 'package:portal_pns_flutter/view/screen/surat/widget/pengembalian_surat_widget.dart';
import 'package:portal_pns_flutter/view/screen/surat/widget/shimmer/shimmer_detail_surat.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailSuratScreen extends StatefulWidget {
  final String idSurat;
  final String page;
  const DetailSuratScreen({
    Key? key,
    required this.idSurat,
    required this.page,
  }) : super(key: key);

  @override
  State<DetailSuratScreen> createState() => _DetailSuratScreenState();
}

class _DetailSuratScreenState extends State<DetailSuratScreen> {
  SuratModel? surat;
  SharedPreferences? sharedPreferences;
  String? nip;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sharedPreferences = di.getIt();
    nip = sharedPreferences!.getString(AppConstants.NIP);

    BlocProvider.of<SuratCubit>(context)
        .getDetailSurat(idSurat: widget.idSurat);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xff41403f)),
        leading: IconButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          icon: Icon(
            Icons.close_rounded,
            size: 18.sp,
          ),
          onPressed: () async {
            Navigator.of(context).pop(true);
          },
        ),
        actions: [
          if (widget.page == 'draft' || widget.page == 'inbox')
            PopupMenuButton<dynamic>(
              iconSize: 18.sp,
              itemBuilder: (context) => [
                if (widget.page == 'draft')
                  if (surat!.posisi == nip! && surat!.create_by != nip)
                    PopupMenuItem<dynamic>(
                      padding: EdgeInsets.symmetric(
                          horizontal: Adaptive.w(5), vertical: Adaptive.h(0.5)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.cancel_schedule_send,
                            size: 14.sp,
                          ),
                          SizedBox(width: Adaptive.w(1)),
                          Text(
                            'Kembalikan',
                            style: poppinsMedium.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                      onTap: () async {
                        Future.delayed(
                          const Duration(),
                          () => showDialog<void>(
                            context: context,
                            builder: (context) => BlocProvider.value(
                              value: BlocProvider.of<SuratCubit>(context),
                              child: PengembalianSuratWidget(
                                surat: surat!,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                if (widget.page == 'draft' && surat!.penandatangan == nip!)
                  PopupMenuItem<dynamic>(
                    padding: EdgeInsets.symmetric(
                        horizontal: Adaptive.w(5), vertical: Adaptive.h(0.5)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.qr_code_rounded,
                          size: 14.sp,
                        ),
                        SizedBox(width: Adaptive.w(1)),
                        Text(
                          'Tandatangan',
                          style: poppinsMedium.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                    onTap: () async {
                      Future.delayed(
                        const Duration(),
                        () => Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (context) => BlocProvider.value(
                              value: BlocProvider.of<SuratCubit>(context),
                              child: TandaTanganPage(
                                surat: surat!,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                else if (widget.page == 'draft' && surat!.penandatangan != nip!)
                  PopupMenuItem<dynamic>(
                    padding: EdgeInsets.symmetric(
                        horizontal: Adaptive.w(5), vertical: Adaptive.h(0.5)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.send_rounded,
                          size: 14.sp,
                        ),
                        SizedBox(width: Adaptive.w(1)),
                        Text(
                          'Ajukan Surat',
                          style: poppinsMedium.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                    onTap: () async {
                      Future.delayed(
                        const Duration(),
                        () => showDialog<void>(
                          context: context,
                          builder: (context) => BlocProvider.value(
                            value: BlocProvider.of<SuratCubit>(context),
                            child: PengajuanSuratWidget(surat: surat!),
                          ),
                        ),
                      );
                    },
                  ),
                if (widget.page == 'inbox')
                  PopupMenuItem<dynamic>(
                    padding: EdgeInsets.symmetric(
                        horizontal: Adaptive.w(5), vertical: Adaptive.h(0.5)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.send_rounded,
                          size: 14.sp,
                        ),
                        SizedBox(width: Adaptive.w(1)),
                        Text(
                          'Disposisi',
                          style: poppinsMedium.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Future.delayed(
                        const Duration(),
                        () => showDialog<void>(
                          context: context,
                          builder: (context) => BlocProvider.value(
                            value: BlocProvider.of<SuratCubit>(context),
                            child: DisposisiSuratWidget(surat: surat!),
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
        ],
      ),
      body: BlocConsumer<SuratCubit, SuratState>(
        listener: (context, state) {
          if (state is SuratProgress) {
            context.loaderOverlay.show();
          }

          if (state is Kirim) {
            context.loaderOverlay.hide();
            bool isSuccess = state.responseModel.isSuccess;
            String title = state.responseModel.title;
            String message = state.responseModel.message;

            if (isSuccess) {
              showDialog<void>(
                context: context,
                builder: (context) =>
                    AlertDialogWidget(title: title, message: message),
              );
            } else {
              showDialog<void>(
                context: context,
                builder: (context) => AlertDialogWidget(
                  title: title,
                  message: message,
                  isError: true,
                ),
              );
            }
          }

          if (state is TandaTangan) {
            context.loaderOverlay.hide();
            bool isSuccess = state.responseModel.isSuccess;
            String title = state.responseModel.title;
            String message = state.responseModel.message;

            if (isSuccess) {
              showDialog<void>(
                context: context,
                builder: (context) =>
                    AlertDialogWidget(title: title, message: message),
              );
            } else {
              showDialog<void>(
                context: context,
                builder: (context) => AlertDialogWidget(
                  title: title,
                  message: message,
                  isError: true,
                ),
              );
            }
          }

          if (state is DetailSuratSuccess) {
            final surat = state.surat;
            if (surat != null && surat.nota_dinas!.isNotEmpty) {
              showDialog<void>(
                context: context,
                builder: (context) => NotaDinasWidget(
                  notaDinas: surat.nota_dinas.toString(),
                ),
              );
            }
          }
        },
        builder: (context, state) {
          if (state is DetailSuratSuccess) {
            surat = state.surat;
          }
          return (surat != null)
              ? Container(
                  padding: EdgeInsets.only(bottom: Adaptive.h(5)),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeaderSuratWidget(surat: surat!),
                        SizedBox(height: Adaptive.h(2)),
                        PdfViewerWidget(
                          url:
                              'https://esikamv2.metrokota.go.id/upload/surat/40cd24b6-28f2-4482-aba0-c1bc60777733/output/1690253618_6481151797ba0854b463.pdf',
                        ),
                        SizedBox(height: Adaptive.h(1)),
                        BlocProvider.value(
                          value: BlocProvider.of<SuratCubit>(context),
                          child: ActionSuratWidget(
                            surat: surat!,
                            nip: nip!,
                            page: widget.page,
                          ),
                        ),
                        SizedBox(height: Adaptive.h(1)),
                      ],
                    ),
                  ),
                )
              : ShimmerDetailSurat();
        },
      ),
    );
  }
}
