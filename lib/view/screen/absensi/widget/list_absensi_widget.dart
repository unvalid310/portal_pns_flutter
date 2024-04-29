import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:portal_pns_flutter/cubit/absensi/absensi_cubit.dart';
import 'package:portal_pns_flutter/data/model/mabsensi.dart';
import 'package:portal_pns_flutter/utill/images.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:portal_pns_flutter/view/base/widget/error_widget.dart';
import 'package:portal_pns_flutter/view/screen/absensi/widget/card_rekap_absensi_widget.dart';
import 'package:portal_pns_flutter/view/screen/absensi/widget/shimmer/shimmer_card_rekap_absensi.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ListAbsensiWidget extends StatelessWidget {
  const ListAbsensiWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isLoading = true;
    bool _isError = false;
    String _title = 'Maaf';
    String _message = 'Sistem sedang diperbarui.';

    MchartAbsensi _chartAbsensi = new MchartAbsensi();
    List<MrekapAbsensi> _listAbsensi = [];

    return BlocConsumer<AbsensiCubit, AbsensiState>(
      listener: (context, state) {
        if (state is RekapAbsensiProgress) {
          print('listener absensi progress : ${state.isLoading}');
          _isLoading = state.isLoading;
        }
        if (state is RekapAbsensiSuccess) {
          print('listener absensi success');
          _isLoading = false;
          _chartAbsensi = state.chartAbsensi!;
          _listAbsensi = state.listAbsensi!;
          if (_listAbsensi.isEmpty) {
            _isError = true;
            _title = 'maaf!';
            _message = 'Tidak ada data riwayat absensi.';
          }
        }
        if (state is RekapAbsensiError) {
          final Map<String, dynamic> _error = state.message;
          _isError = true;
          _title = _error['title'].toString();
          _message = _error['message'].toString();
        }
      },
      builder: (context, state) {
        if (state is RekapAbsensiProgress) {
          print('builder absensi progress');
          _isLoading = state.isLoading;
        }
        if (state is RekapAbsensiSuccess) {
          print('builder absensi success');
          _isLoading = false;
          _chartAbsensi = state.chartAbsensi!;
          _listAbsensi = state.listAbsensi!;

          if (_listAbsensi.length < 1) {
            _isError = true;
            _title = 'maaf!';
            _message = 'Tidak ada data riwayat absensi.';
          }
        }
        if (state is RekapAbsensiError) {
          final Map<String, dynamic> _error = state.message;
          _isError = true;
          _title = _error['title'].toString();
          _message = _error['message'].toString();
        }

        return (!_isError)
            ? (_isLoading)
                ? ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    clipBehavior: Clip.none,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ShimmerCardRekapAbsensi(); //CardRekapAbsensiWidget();
                    },
                  )
                : (_listAbsensi.length > 0)
                    ? ListView.builder(
                        itemCount: _listAbsensi.length,
                        shrinkWrap: true,
                        clipBehavior: Clip.none,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CardRekapAbsensiWidget(
                            absensi: _listAbsensi[index],
                          );
                        },
                      )
                    : Container()
            : ErrorValueWidget(
                title: _title,
                message: _message,
              );
        // Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.stretch,
        //     mainAxisSize: MainAxisSize.max,
        //     children: [
        //       Row(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Lottie.asset(
        //             Images.notFound_animated,
        //             height: Adaptive.h(15),
        //           ),
        //           SizedBox(width: Adaptive.w(1)),
        //           Container(
        //             width: Adaptive.w(40),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Text(
        //                   (_title != '') ? _title : 'Maaf!',
        //                   softWrap: true,
        //                   style: poppinsMedium.copyWith(
        //                     fontSize: 18.sp,
        //                   ),
        //                 ),
        //                 SizedBox(height: Adaptive.h(0.5)),
        //                 Text(
        //                   (_message != '')
        //                       ? _message
        //                       : 'Tidak ada data untuk ditampilkan!',
        //                   softWrap: true,
        //                   style: poppinsLight.copyWith(
        //                     fontSize: 14.sp,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           )
        //         ],
        //       ),
        //     ],
        //   );
      },
    );
  }
}
