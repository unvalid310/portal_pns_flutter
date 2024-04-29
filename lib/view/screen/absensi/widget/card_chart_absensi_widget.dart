// ignore_for_file: unused_local_variable, omit_local_variable_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:portal_pns_flutter/cubit/absensi/absensi_cubit.dart';
import 'package:portal_pns_flutter/data/model/mabsensi.dart';
import 'package:portal_pns_flutter/di_container.dart' as di;
import 'package:portal_pns_flutter/helper/string_helper.dart';
import 'package:portal_pns_flutter/utill/app_constants.dart';
import 'package:portal_pns_flutter/utill/images.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardChartAbsensiWidget extends StatelessWidget {
  final DateTime selectedDate;
  const CardChartAbsensiWidget({Key? key, required this.selectedDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isLoading = true;
    bool _isError = false;
    String _title = 'Maaf';
    String _message = 'Sistem sedang diperbarui.';
    final SharedPreferences _sharedPreferences = di.getIt();

    MchartAbsensi _chartAbsensi = new MchartAbsensi();

    return BlocConsumer<AbsensiCubit, AbsensiState>(listener: (context, state) {
      if (state is RekapAbsensiProgress) {
        print('listener absensi progress : ${state.isLoading}');
        _isLoading = state.isLoading;
      }
      if (state is RekapAbsensiSuccess) {
        print('listener absensi success');
        _isLoading = false;
        _chartAbsensi = state.chartAbsensi!;
        print('presensi masuk : ${_chartAbsensi.persentaseMasuk}');
      }
      if (state is RekapAbsensiError) {
        final Map<String, dynamic> _error = state.message;
        _isError = true;
        _title = _error['title'].toString();
        _message = _error['message'].toString();
      }
    }, builder: (context, state) {
      return Container(
        padding: EdgeInsets.symmetric(
            vertical: Adaptive.h(1.5), horizontal: Adaptive.h(2)),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          image: DecorationImage(
            image: AssetImage(Images.login_bg),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Portal PNS',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: poppinsBold.copyWith(
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${getMonthName(selectedDate.toString())}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: poppinsMedium.copyWith(
                    fontSize: 14.sp,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: Adaptive.h(2)),
            Container(
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    child: CircularPercentIndicator(
                      radius: Adaptive.w(17),
                      animation: true,
                      animationDuration: 1200,
                      lineWidth: Adaptive.w(3),
                      percent: _chartAbsensi.persentaseMasuk != null
                          ? (_chartAbsensi.persentaseMasuk!.toDouble() > 100)
                              ? 1.0
                              : _chartAbsensi.persentaseMasuk!.toDouble() / 100
                          : 0,
                      center: Text(
                        _chartAbsensi.persentaseMasuk != null
                            ? (_chartAbsensi.persentaseMasuk!.toDouble() > 100)
                                ? '100%'
                                : '${_chartAbsensi.persentaseMasuk?.toStringAsFixed(0)}%'
                            : '0%',
                        style: poppinsMedium.copyWith(
                          fontSize: 20.sp,
                          color: Colors.white,
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: Color(0xffbae9f0),
                      progressColor: Color(0xff13acac),
                    ),
                  ),
                  SizedBox(width: Adaptive.w(6)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                _sharedPreferences
                                    .getString(AppConstants.NAMA)
                                    .toString(),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: poppinsMedium.copyWith(
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                (_sharedPreferences.getString(
                                            AppConstants.USER_KATEGORI) !=
                                        'PNS')
                                    ? _sharedPreferences
                                        .getString(AppConstants.NIP)
                                        .toString()
                                    : 'Nip. ${_sharedPreferences.getString(AppConstants.NIP).toString()}',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: poppinsLight.copyWith(
                                  fontSize: 12.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Adaptive.h(2)),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  'Hadir',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textAlign: TextAlign.right,
                                  style: poppinsLight.copyWith(
                                    fontSize: 12.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: Adaptive.w(2)),
                              Expanded(
                                flex: 10,
                                child: LinearPercentIndicator(
                                  padding: EdgeInsets.zero,
                                  lineHeight: 14.sp,
                                  percent: 1,
                                  center: Text(
                                    _chartAbsensi.totalMasuk != null
                                        ? '${_chartAbsensi.totalMasuk?.toStringAsFixed(0)} Hari'
                                        : '0 Hari',
                                    style: poppinsRegular.copyWith(
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  barRadius: Radius.circular(15),
                                  backgroundColor: Color(0xffbae9f0),
                                  progressColor: Color(0xff13acac),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Adaptive.h(0.5)),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  'Cuti',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textAlign: TextAlign.right,
                                  style: poppinsLight.copyWith(
                                    fontSize: 12.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: Adaptive.w(2)),
                              Expanded(
                                flex: 10,
                                child: LinearPercentIndicator(
                                  padding: EdgeInsets.zero,
                                  lineHeight: 14.sp,
                                  percent: _chartAbsensi.persentaseCuti != null
                                      ? _chartAbsensi.persentaseCuti! / 100
                                      : 0,
                                  center: Text(
                                    _chartAbsensi.totalCuti != null
                                        ? "${_chartAbsensi.totalCuti!.toStringAsFixed(0)} Hari"
                                        : '0 Hari',
                                    style: poppinsRegular.copyWith(
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  barRadius: Radius.circular(15),
                                  backgroundColor: Color(0xfff0daba),
                                  progressColor: Color(0xffd29828),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Adaptive.h(0.5)),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  'Absen',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textAlign: TextAlign.right,
                                  style: poppinsLight.copyWith(
                                    fontSize: 12.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: Adaptive.w(2)),
                              Expanded(
                                flex: 10,
                                child: LinearPercentIndicator(
                                  padding: EdgeInsets.zero,
                                  lineHeight: 14.sp,
                                  percent: _chartAbsensi.persentaseAbsen != null
                                      ? _chartAbsensi.persentaseAbsen! / 100
                                      : 0,
                                  center: Text(
                                    _chartAbsensi.totalAbsen != null
                                        ? '${_chartAbsensi.totalAbsen!.toStringAsFixed(0)} Hari'
                                        : '0 Hari',
                                    style: poppinsRegular.copyWith(
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  barRadius: Radius.circular(15),
                                  backgroundColor: Color(0xffe6b2b2),
                                  progressColor: Color(0xffc15252),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Adaptive.h(2)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Adaptive.h(1)),
          ],
        ),
      );
    });
  }
}
