// ignore_for_file: unused_local_variable, omit_local_variable_types, prefer_final_locals, unnecessary_statements

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:portal_pns_flutter/cubit/surat/surat_cubit.dart';
import 'package:portal_pns_flutter/data/model/mpejabat.dart';
import 'package:portal_pns_flutter/data/model/msurat.dart';
import 'package:portal_pns_flutter/utill/colors_resource.dart';
import 'package:portal_pns_flutter/utill/images.dart';
import 'package:portal_pns_flutter/utill/routes.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:portal_pns_flutter/view/base/custom_text_field.dart';
import 'package:portal_pns_flutter/view/screen/surat/pages/pejabat_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:strings/strings.dart';

class DisposisiSuratWidget extends StatefulWidget {
  final SuratModel surat;
  const DisposisiSuratWidget({Key? key, required this.surat}) : super(key: key);

  @override
  State<DisposisiSuratWidget> createState() => _DisposisiSuratWidgetState();
}

class _DisposisiSuratWidgetState extends State<DisposisiSuratWidget> {
  TextEditingController _pejabatController = TextEditingController();
  TextEditingController _catatanController = TextEditingController();
  List<PejabatModel> _listPejabat = [];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
        child: Form(
          key: _formKey,
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
                  'Apakah anda ingin mengajukan surat ini?',
                  textAlign: TextAlign.center,
                  style: poppinsMedium.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: Adaptive.h(2)),
                Text(
                  'Ajukan Surat ke-',
                  style: poppinsMedium.copyWith(
                    fontSize: 14.sp,
                    color: ColorsResource.textColor,
                  ),
                ),
                SizedBox(height: Adaptive.h(1)),
                CustomTextField(
                  hintText: 'Pilih pejabat..',
                  controller: _pejabatController,
                  isIcon: true,
                  isShowSuffixIcon: true,
                  suffixIconData: Icons.search_rounded,
                  isReadonly: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '* Pejabat wajib diisi.';
                    }
                  },
                  onTap: () async {
                    dynamic pejabat = await Navigator.push<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (context) => PejabatPage(
                          listSelectedPejabat: _listPejabat,
                        ),
                      ),
                    );

                    if (pejabat is List<PejabatModel>) {
                      _listPejabat = pejabat;
                      if (pejabat.isNotEmpty) {
                        setState(() {
                          _pejabatController.text =
                              camelize(pejabat.first.nama);
                          _formKey.currentState!.validate();
                        });
                      } else {
                        setState(() {
                          _pejabatController.clear();
                        });
                      }
                    }

                    setState(() {
                      _listPejabat;
                    });
                  },
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
                            'Disposisi Surat',
                            style: poppinsBold.copyWith(
                              fontSize: 14.sp,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.of(context).pop();
                              BlocProvider.of<SuratCubit>(context).ajukan(
                                surat: widget.surat,
                                ringkasan: _catatanController.text,
                                pejabat: _listPejabat.first,
                              );
                            }
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
      ),
    );
  }
}
