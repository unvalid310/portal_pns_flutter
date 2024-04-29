import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portal_pns_flutter/cubit/absensi/absensi_cubit.dart';
import 'package:portal_pns_flutter/data/model/mabsensi.dart';
import 'package:portal_pns_flutter/helper/string_helper.dart';
import 'package:portal_pns_flutter/utill/images.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:portal_pns_flutter/view/base/widget/shimmer/shimmer_absensi.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AbsensiWidget extends StatelessWidget {
  const AbsensiWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<AbsensiCubit>(context, listen: false).getAbsensi();

    bool _isLoading = true;
    bool _isError = false;
    String _title = 'Maaf';
    String _message = 'Sistem sedang diperbarui.';
    Mabsensi? _absensi;

    return BlocConsumer<AbsensiCubit, AbsensiState>(
      listener: (context, state) {
        if (state is AbsensiProgress) {
          print('listener absensi progress : ${state.isLoading}');
          _isLoading = state.isLoading;
        }
        if (state is AbsensiSuccess) {
          print('listener absensi success');
          _absensi = state.absensi;
        }
        if (state is AbsensiError) {
          final Map<String, dynamic> _error = state.message;
          _isError = true;
          _title = _error['title'].toString();
          _message = _error['message'].toString();
        }
      },
      builder: (context, state) {
        if (state is AbsensiProgress) {
          print('builder absensi progress : ${state.isLoading}');
          _isLoading = state.isLoading;
        }
        if (state is AbsensiSuccess) {
          print('builder absensi success');
          _absensi = state.absensi;
        }
        if (state is AbsensiError) {
          final Map<String, dynamic> _error = state.message;
          _isError = true;
          _title = _error['title'].toString();
          _message = _error['message'].toString();
        }

        return (!_isError)
            ? (_isLoading && _absensi == '')
                ? ShimmerAbsensi()
                : Container(
                    margin: EdgeInsets.fromLTRB(0, Adaptive.h(3), 0, 0),
                    padding: EdgeInsets.symmetric(
                        vertical: Adaptive.h(1.5), horizontal: Adaptive.h(2)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(color: Color(0xff41403f).withOpacity(0.5)),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Masuk',
                                style: poppinsLight.copyWith(
                                  fontSize: 14.sp,
                                ),
                              ),
                              SizedBox(height: Adaptive.h(0.5)),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    Images.ic_masuk,
                                    width: 16.sp,
                                  ),
                                  SizedBox(width: Adaptive.w(2)),
                                  Text(
                                    (_absensi != null &&
                                            _absensi!.waktuMasuk.toString() !=
                                                '')
                                        ? getTimeOfDate(
                                            _absensi!.waktuMasuk.toString())
                                        : '--:--',
                                    style: poppinsBold.copyWith(
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
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
                                  fontSize: 14.sp,
                                ),
                              ),
                              SizedBox(height: Adaptive.h(0.5)),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    Images.ic_pulang,
                                    width: 16.sp,
                                  ),
                                  SizedBox(width: Adaptive.w(2)),
                                  Text(
                                    (_absensi != null &&
                                            _absensi!.waktuPulang != '')
                                        ? getTimeOfDate(
                                            _absensi!.waktuPulang.toString())
                                        : '--:--',
                                    style: poppinsBold.copyWith(
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
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
                                'Jam Kerja',
                                style: poppinsLight.copyWith(
                                  fontSize: 14.sp,
                                ),
                              ),
                              SizedBox(height: Adaptive.h(0.5)),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    Images.ic_jam_kerja,
                                    width: 16.sp,
                                  ),
                                  SizedBox(width: Adaptive.w(2)),
                                  Text(
                                    (_absensi != null &&
                                            _absensi!.jamKerja != '')
                                        ? _absensi!.jamKerja.toString()
                                        : '--:--',
                                    style: poppinsBold.copyWith(
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: Adaptive.w(2)),
                      ],
                    ),
                  )
            : Container(
                margin: EdgeInsets.fromLTRB(0, Adaptive.h(3), 0, 0),
                padding: EdgeInsets.symmetric(
                    vertical: Adaptive.h(1.5), horizontal: Adaptive.h(2)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xff41403f).withOpacity(0.5)),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Masuk',
                            style: poppinsLight.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: Adaptive.h(0.5)),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                Images.ic_masuk,
                                width: 16.sp,
                              ),
                              SizedBox(width: Adaptive.w(2)),
                              Text(
                                (_absensi != null &&
                                        _absensi!.waktuMasuk.toString() != '')
                                    ? getTimeOfDate(
                                        _absensi!.waktuMasuk.toString())
                                    : '--:--',
                                style: poppinsBold.copyWith(
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
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
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: Adaptive.h(0.5)),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                Images.ic_pulang,
                                width: 16.sp,
                              ),
                              SizedBox(width: Adaptive.w(2)),
                              Text(
                                (_absensi != null &&
                                        _absensi!.waktuPulang != '')
                                    ? _absensi!.waktuPulang.toString()
                                    : '--:--',
                                style: poppinsBold.copyWith(
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
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
                            'Jam Kerja',
                            style: poppinsLight.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: Adaptive.h(0.5)),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                Images.ic_jam_kerja,
                                width: 16.sp,
                              ),
                              SizedBox(width: Adaptive.w(2)),
                              Text(
                                (_absensi != null && _absensi!.jamKerja != '')
                                    ? getTimeOfDate(
                                        _absensi!.waktuPulang.toString())
                                    : '--:--',
                                style: poppinsBold.copyWith(
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: Adaptive.w(2)),
                  ],
                ),
              );
      },
    );
  }
}
