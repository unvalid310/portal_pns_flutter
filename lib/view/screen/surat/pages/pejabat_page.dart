// ignore_for_file: prefer_final_locals, omit_local_variable_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portal_pns_flutter/cubit/surat/surat_cubit.dart';
import 'package:portal_pns_flutter/data/model/mpejabat.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:portal_pns_flutter/view/base/custom_text_field.dart';
import 'package:portal_pns_flutter/view/base/widget/error_widget.dart';
import 'package:portal_pns_flutter/view/screen/surat/widget/daftar_pejabat_widget.dart';
import 'package:portal_pns_flutter/view/screen/surat/widget/shimmer/shimmer_pejabat.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PejabatPage extends StatefulWidget {
  final List<PejabatModel>? listSelectedPejabat;
  const PejabatPage({Key? key, this.listSelectedPejabat}) : super(key: key);

  @override
  State<PejabatPage> createState() => _PejabatPageState();
}

class _PejabatPageState extends State<PejabatPage> {
  TextEditingController pejabatController = TextEditingController();
  List<PejabatModel> listPejabat = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SuratCubit>(context).getPejabat();

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Color(0xff41403f),
          ),
          leading: IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            focusColor: Colors.white,
            icon: Icon(
              Icons.close_rounded,
              size: 18.sp,
            ),
            onPressed: () async => Navigator.of(context).pop(),
          ),
          title: Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              'Daftar Pejabat',
              overflow: TextOverflow.ellipsis,
              style: poppinsBold.copyWith(
                fontSize: 16.sp,
                color: Color(0xff41403f),
              ),
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(
              Adaptive.w(5), Adaptive.h(1), Adaptive.w(5), Adaptive.h(5)),
          child: Column(
            children: [
              CustomTextField(
                hintText: 'Cari pejabat...',
                controller: pejabatController..text = '',
                onFieldSubmitted: (value) =>
                    context..read<SuratCubit>().searchPejabat(search: value),
              ),
              SizedBox(height: Adaptive.h(3)),
              Expanded(
                child: BlocConsumer<SuratCubit, SuratState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is PejabatProggress) {
                      return const ShimmerPejabat();
                    }

                    if (state is PejabatSuccess) {
                      listPejabat = state.pejabat;

                      if (listPejabat.isNotEmpty) {
                        return DaftarPejabatWidget(
                          pejabat: listPejabat,
                          listSelectedPejabat: widget.listSelectedPejabat,
                        );
                      } else {
                        return const Center(
                          child: ErrorValueWidget(
                            title: '',
                            message: '',
                          ),
                        );
                      }
                    }

                    if (state is PejabatError) {
                      return Center(
                        child: ErrorValueWidget(
                          title: state.message['title'].toString(),
                          message: state.message['message'].toString(),
                        ),
                      );
                    }

                    return Container();
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
