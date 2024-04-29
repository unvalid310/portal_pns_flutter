import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:portal_pns_flutter/cubit/absensi/absensi_cubit.dart';
import 'package:portal_pns_flutter/helper/string_helper.dart';
import 'package:portal_pns_flutter/utill/images.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:portal_pns_flutter/view/screen/absensi/widget/appbar_riwayat_absensi_widget.dart';
import 'package:portal_pns_flutter/view/screen/absensi/widget/card_chart_absensi_widget.dart';
import 'package:portal_pns_flutter/view/screen/absensi/widget/list_absensi_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RiwayatAbsensiPage extends StatefulWidget {
  const RiwayatAbsensiPage({Key? key}) : super(key: key);

  @override
  _RiwayatAbsensiPageState createState() => _RiwayatAbsensiPageState();
}

class _RiwayatAbsensiPageState extends State<RiwayatAbsensiPage> {
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  void initData() async {
    await BlocProvider.of<AbsensiCubit>(context)
      ..getRekapAbsensi(
        month: _selectedDate.month.toString(),
        year: _selectedDate.year.toString(),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarRiwayatAbsensiWidget(
        context: context,
        onPress: () async {
          final date = await showMonthPicker(
            context: context,
            firstDate: DateTime(2022, 10),
            lastDate: DateTime(DateTime.now().year + 1, 1),
            initialDate: DateTime(_selectedDate.year, _selectedDate.month),
            locale: const Locale('id'),
          );

          if (date != null) {
            setState(() {
              _selectedDate = date;
            });

            context
              ..read<AbsensiCubit>().getRekapAbsensi(
                month: _selectedDate.month.toString(),
                year: _selectedDate.year.toString(),
              );
          }
        },
      ),
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.fromLTRB(
                Adaptive.w(5), Adaptive.h(3), Adaptive.w(5), Adaptive.h(0)),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocProvider.value(
                  value: BlocProvider.of<AbsensiCubit>(context),
                  child: CardChartAbsensiWidget(selectedDate: _selectedDate),
                ),
                SizedBox(height: Adaptive.h(2)),
                RichText(
                  text: TextSpan(
                    style: poppinsLight.copyWith(
                      fontSize: 14.sp,
                      color: Color(0xff41403f),
                    ),
                    children: [
                      TextSpan(text: 'Riwayat Absensi,'),
                      TextSpan(
                          text: ' ${getMonthName(_selectedDate.toString())}',
                          style: poppinsMedium),
                    ],
                  ),
                ),
                SizedBox(height: Adaptive.h(2)),
                BlocProvider.value(
                  value: BlocProvider.of<AbsensiCubit>(context)
                    ..getRekapAbsensi(
                      month: _selectedDate.month.toString(),
                      year: _selectedDate.year.toString(),
                    ),
                  child: ListAbsensiWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
