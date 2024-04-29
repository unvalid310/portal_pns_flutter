// ignore_for_file: implementation_imports, curly_braces_in_flow_control_structures, prefer_const_constructors

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:loader_overlay/src/overlay_controller_widget_extension.dart';
import 'package:portal_pns_flutter/cubit/absensi/absensi_cubit.dart';
import 'package:portal_pns_flutter/helper/location_helper.dart';
import 'package:portal_pns_flutter/utill/colors_resource.dart';
import 'package:portal_pns_flutter/utill/routes.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:portal_pns_flutter/view/base/widget/absensi_widget.dart';
import 'package:portal_pns_flutter/view/base/widget/alert_dialog_widget.dart';
import 'package:portal_pns_flutter/view/base/widget/confirm_alert_widget.dart';
import 'package:portal_pns_flutter/view/base/widget/custom_toast_widget.dart';
import 'package:portal_pns_flutter/view/screen/absensi/widget/appbar_absensi_widget.dart';
import 'package:portal_pns_flutter/view/screen/absensi/widget/button_absensi_wdiget.dart';
import 'package:portal_pns_flutter/view/screen/absensi/widget/button_riwayat_absensi_widget.dart';
import 'package:portal_pns_flutter/view/screen/absensi/widget/clock_widget.dart';
import 'package:portal_pns_flutter/view/screen/absensi/widget/lokasi_widget.dart';
import 'package:portal_pns_flutter/view/screen/absensi/widget/shimmer/shimmer_button_absesnsi.dart';
import 'package:portal_pns_flutter/view/screen/absensi/widget/shimmer/shimmer_location.dart';
import 'package:portal_pns_flutter/view/screen/absensi/widget/unitkerja_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class AbsensiScreen extends StatefulWidget {
  const AbsensiScreen({Key? key}) : super(key: key);

  @override
  _AbsensiScreenState createState() => _AbsensiScreenState();
}

class _AbsensiScreenState extends State<AbsensiScreen> {
  StreamSubscription<Position>? _positionStream;
  TextEditingController _lokasiController = TextEditingController();
  Position? _currentPosition;
  String? _currentAddress;
  late String _lokasi = '';
  late String _unitKerja = '';
  late int _tipeAbsensi = 1;
  late int _tipeLokasi = 1;

  final toast = FToast();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentPosition();
    toast.init(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _positionStream!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppbarAbsensiWidget(context: context),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(bottom: Adaptive.h(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: Adaptive.h(1)),
                    const ClockWidget(),
                    ButtonRiwayatAbsensiWidget(),
                  ],
                ),
                SizedBox(height: Adaptive.h(4)),
                UnitKerjaWidget(
                  lokasi: lokasiCallback,
                  tipeLokasi: tipkeLokasiCallback,
                  unitKerja: unitKerjaCallback,
                ),
                SizedBox(height: Adaptive.h(4)),
                BlocConsumer<AbsensiCubit, AbsensiState>(
                  listener: (context, state) {
                    if (state is PostAbsensiProgress) {
                      context.loaderOverlay.show();
                    }
                    if (state is PostAbsensi) {
                      context.loaderOverlay.hide();
                      if (state.responseModel.isSuccess) {
                        toast.showToast(
                          child: CustomToastWidget(
                            message: 'Berhasil melakukan presensi!',
                          ),
                          positionedToastBuilder: (context, child) =>
                              Positioned(
                            child: child,
                            bottom: Adaptive.h(8),
                            left: 0,
                            right: 0,
                          ),
                        );
                      } else {
                        showDialog<void>(
                          context: context,
                          builder: (context) {
                            return AlertDialogWidget(
                              title: state.responseModel.title,
                              message: state.responseModel.message,
                              isError: true,
                              onClose: () {
                                Navigator.pop(context);
                              },
                            );
                          },
                        );
                      }
                    }
                  },
                  builder: (context, state) {
                    if (state is AbsensiProgress) {
                      if (state.isLoading)
                        return Column(
                          children: [
                            Shimmer.fromColors(
                              baseColor: ColorsResource.shimmerBaseColor,
                              highlightColor:
                                  ColorsResource.shimmerHighlightColor,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Text(
                                  'Tekan untuk melakukan presensi',
                                  textAlign: TextAlign.center,
                                  style: poppinsLight.copyWith(fontSize: 14.sp),
                                ),
                              ),
                            ),
                            SizedBox(height: Adaptive.h(1)),
                            ShimmerButtonAnsensi(),
                          ],
                        );
                    }

                    return Column(
                      children: [
                        Text(
                          'Tekan untuk melakukan presensi',
                          textAlign: TextAlign.center,
                          style: poppinsLight.copyWith(fontSize: 14.sp),
                        ),
                        SizedBox(height: Adaptive.h(1)),
                        ButtonAbsensiWidget(
                          onTap: () async {
                            final data = <String, dynamic>{
                              'unit_kerja': _unitKerja,
                              'lokasi': _lokasi,
                              'latitude': _currentPosition!.latitude,
                              'longitude': _currentPosition!.longitude,
                              'tipe_lokasi': _tipeLokasi,
                              'tipe_absensi': _tipeAbsensi,
                            };

                            if (_currentAddress != null) {
                              await showDialog<void>(
                                context: context,
                                builder: (context) {
                                  return ConfirmAlertWidget(
                                    title: 'Peringatan!',
                                    message:
                                        'Apakah anda ingin melanjutkan proses absensi ?',
                                    onSubmit: () async {
                                      Navigator.of(context).pop();
                                      await context
                                        ..read<AbsensiCubit>()
                                            .postAbsensi(data);
                                    },
                                  );
                                },
                              );
                            } else {
                              await showDialog<void>(
                                context: context,
                                builder: (context) {
                                  return AlertDialogWidget(
                                    title: 'Presensi gagal!',
                                    message:
                                        'Lokasi anda saat ini tidak ditemukan.',
                                    isError: true,
                                  );
                                },
                              );
                            }

                            print('data : ${data.toString()}');
                          },
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: Adaptive.h(4)),
                if (_currentAddress != null)
                  LokasiWidget(
                    address: _currentAddress!,
                    position: _currentPosition!,
                  )
                else
                  ShimmerLocation(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Adaptive.h(3)),
                  child: BlocProvider.value(
                    value: context.read<AbsensiCubit>()..getAbsensi(),
                    child: AbsensiWidget(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void unitKerjaCallback(String value) {
    _unitKerja = value;
  }

  void lokasiCallback(String value) {
    _lokasi = value;
  }

  void tipkeLokasiCallback(int value) {
    _tipeLokasi = value;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await LocationHelper().handleLocationPermission();
    late LocationSettings _locationSettings;

    if (Platform.isAndroid) {
      _locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 4,
      );
    }

    if (Platform.isIOS) {
      _locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 4,
      );
    }

    if (!hasPermission) return;

    _positionStream =
        Geolocator.getPositionStream(locationSettings: _locationSettings)
            .listen(
      (position) async {
        print('is mock position : ${position.isMocked}');
        final _address = await LocationHelper()
            .getAddressFromLatLng(position: position)
            .then((value) => value);

        if (position.isMocked) {
          await showDialog<void>(
            context: context,
            builder: (_) {
              return AlertDialogWidget(
                title: 'Terjadi kesalahan',
                message: 'Device anda menggunakan lokasi palsu.',
                isError: true,
                onClose: () {
                  Navigator.popAndPushNamed(_, Routes.HOME_SCREEN);
                },
              );
            },
          );

          await _positionStream!.cancel();

          setState(() {
            _currentAddress = _address;
            _currentPosition = position;
          });
        } else {
          setState(() {
            _currentAddress = _address;
            _currentPosition = position;
          });
        }
      },
    );
  }
}
