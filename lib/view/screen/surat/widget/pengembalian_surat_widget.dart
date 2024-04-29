import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:portal_pns_flutter/cubit/surat/surat_cubit.dart';
import 'package:portal_pns_flutter/data/model/msurat.dart';
import 'package:portal_pns_flutter/utill/colors_resource.dart';
import 'package:portal_pns_flutter/utill/images.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:portal_pns_flutter/view/base/custom_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:strings/strings.dart';

class PengembalianSuratWidget extends StatelessWidget {
  final SuratModel surat;
  const PengembalianSuratWidget({Key? key, required this.surat})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _catatanController = TextEditingController();

    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: Adaptive.w(5),
        vertical: Adaptive.h(3),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)), //this right here
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Adaptive.w(5),
          vertical: Adaptive.h(3),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    Images.warning_animated,
                    width: Adaptive.sp(20),
                  ),
                  SizedBox(width: Adaptive.h(1)),
                  Text(
                    'Peringatan!',
                    style: poppinsBold.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: Adaptive.h(4)),
              Text(
                'Apakah anda ingin mengembalikan surat ini?',
                textAlign: TextAlign.center,
                style: poppinsMedium.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: Adaptive.h(1)),
              Text(
                '"${camelize(surat.perihal)}"',
                textAlign: TextAlign.justify,
                style: poppinsBold.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: Adaptive.h(1)),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  text: 'Dikirim oleh ',
                  style: poppinsRegular.copyWith(
                    fontSize: 14.sp,
                    color: ColorsResource.textColor,
                  ),
                  children: [
                    TextSpan(
                      text: surat.nama_pembuat,
                      style: poppinsBold,
                    )
                  ],
                ),
              ),
              SizedBox(height: Adaptive.h(2)),
              Text(
                'Catatan',
                style: poppinsMedium.copyWith(
                  fontSize: 14.sp,
                  color: ColorsResource.textColor,
                ),
              ),
              SizedBox(height: Adaptive.h(1)),
              CustomTextField(
                minLines: 3,
                maxLines: 10,
                hintText: 'Tulis catatan...',
                controller: _catatanController,
              ),
              SizedBox(height: Adaptive.h(2)),
              Divider(thickness: 1, height: Adaptive.h(3)),
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: Adaptive.h(1)),
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Text(
                          'Kembalikan',
                          style: poppinsBold.copyWith(
                            fontSize: 14.sp,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          BlocProvider.of<SuratCubit>(context).kembalikan(
                            surat: surat,
                            ringkasan: _catatanController.text,
                          );
                        },
                      ),
                    ),
                    SizedBox(width: Adaptive.w(5)),
                    Padding(
                      padding: EdgeInsets.only(top: Adaptive.h(1)),
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Text(
                          'Batal',
                          style: poppinsMedium.copyWith(
                            fontSize: 14.sp,
                            color: ColorsResource.textMuted,
                          ),
                        ),
                        onTap: () {
                          return Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
