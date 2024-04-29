// ignore_for_file: prefer_final_locals, omit_local_variable_types, avoid_dynamic_calls, unused_local_variable, avoid_print

import 'dart:convert';
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portal_pns_flutter/data/model/base/api_response.dart';
import 'package:portal_pns_flutter/data/model/base/response_model.dart';
import 'package:portal_pns_flutter/data/model/mabsensi.dart';
import 'package:portal_pns_flutter/data/repository/absensi_repo.dart';
import 'package:portal_pns_flutter/helper/string_helper.dart';

part 'absensi_state.dart';

class AbsensiCubit extends Cubit<AbsensiState> {
  final AbsensiRepo absensiRepo;
  AbsensiCubit({required this.absensiRepo}) : super(AbsensiInitial());

  Future<void> getAbsensi() async {
    try {
      emit(AbsensiProgress(isLoading: true));
      final apiResponse = await absensiRepo.getAbsensiHarian();
      final response = apiResponse.response;
      Mabsensi _absensi = Mabsensi();
      debugPrint('response data : ${response!.data}');

      if (response != null && response.statusCode == 200) {
        final _data = (response.data['data']) as Map<String, dynamic>;
        final bool _success = (response.data['success']) as bool;
        final String _message = (response.data['message']) as String;

        if (_success) {
          _absensi = Mabsensi.fromJson(_data);
        }

        emit(AbsensiSuccess(absensi: _absensi, message: _message));
        emit(AbsensiProgress(isLoading: false));
      } else {
        emit(AbsensiError(message: apiResponse.error));
        emit(AbsensiProgress(isLoading: false));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getRekapAbsensi(
      {required String month, required String year}) async {
    try {
      emit(RekapAbsensiProgress(isLoading: true));
      final apiResponse =
          await absensiRepo.getRekapAbsensi(month: month, year: year);
      final response = apiResponse.response;
      List<MrekapAbsensi> _listAbsensi = [];

      if (response != null && response.statusCode == 200) {
        var _chartAbsensi = MchartAbsensi();
        final bool _success =
            parseBool(string: response.data['success'].toString());
        final String _message = response.data['message'].toString();

        if (response.data['chart'] != null) {
          _chartAbsensi = MchartAbsensi.fromJson(
              response.data['chart'] as Map<String, dynamic>);
          print(response.data['chart']);
          print(_chartAbsensi.totalHari);
        }

        if (_success) {
          print('sukses');
          final _data = jsonEncode(response.data['data'].toString());

          jsonDecode(jsonEncode(response.data['data']))
              .map(
                (dynamic e) => _listAbsensi.add(
                  MrekapAbsensi.fromJson(e as Map<String, dynamic>),
                ),
              )
              .toList();
        }

        emit(RekapAbsensiProgress(isLoading: false));
        emit(RekapAbsensiSuccess(
            listAbsensi: _listAbsensi, chartAbsensi: _chartAbsensi));
      } else {
        emit(RekapAbsensiError(message: apiResponse.error));
        emit(RekapAbsensiProgress(isLoading: false));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> postAbsensi(Map<String, dynamic> data) async {
    try {
      emit(PostAbsensiProgress());
      await getUnitKerja(data);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getUnitKerja(Map<String, dynamic> data) async {
    double _unitLat = 0;
    double _unitLong = 0;
    ResponseModel _responseModel;

    final apiResponse =
        await absensiRepo.getUnitKerja(unitKerja: data['lokasi'].toString());
    final response = apiResponse.response;
    if (data['tipe_lokasi'] == 1) {
      if (response != null && response.statusCode == 200) {
        final bool _success =
            parseBool(string: response.data['success'].toString());
        final String _message = response.data['message'].toString();
        print('response unit kerja>> ${response.data['data'].toString()}');

        if (_success) {
          final responseData = response.data['data'] as Map<String, dynamic>;
          _unitLat = double.parse(responseData['latitude'].toString());
          _unitLong = double.parse(responseData['longitude'].toString());

          double distanceInMeters = calculateDistance(
            lat1: double.parse(data['latitude'].toString()),
            lon1: double.parse(data['longitude'].toString()),
            lat2: _unitLat,
            lon2: _unitLong,
          );

          if (int.parse(distanceInMeters.toStringAsFixed(0)) <= 50) {
            await actPostPresensi(data);
          } else {
            _responseModel = ResponseModel(
              false,
              'Presensi gagal!',
              'Lokasi anda berada diluar dinas.',
            );

            emit(PostAbsensi(responseModel: _responseModel));
          }
        } else {
          _responseModel = ResponseModel(
            false,
            'Presensi gagal!',
            'Gagal mencari data lokasi unit kerja.',
          );

          emit(PostAbsensi(responseModel: _responseModel));
        }
      } else {
        _responseModel = ResponseModel(
          false,
          apiResponse.error['title'].toString(),
          apiResponse.error['message'].toString(),
        );

        emit(PostAbsensi(responseModel: _responseModel));
      }
    } else {
      // post presensi
      await actPostPresensi(data);
    }
  }

  Future<void> actPostPresensi(Map<String, dynamic> data) async {
    final apiResponse = await absensiRepo.postPresensi(data);
    final response = apiResponse.response;
    ResponseModel _responseModel;

    if (response != null && response.statusCode == 200) {
      final bool _success =
          parseBool(string: response.data['success'].toString());
      final String _message = response.data['message'].toString();
      print('response unit kerja>> ${response.data['data'].toString()}');

      if (_success) {
        _responseModel = ResponseModel(
          true,
          'Presensi berhasil!',
          'Anda berhasil melakukan presensi.',
        );

        emit(PostAbsensi(responseModel: _responseModel));
      } else {
        _responseModel = ResponseModel(
          false,
          'Presensi gagal!',
          _message,
        );

        emit(PostAbsensi(responseModel: _responseModel));
      }
    } else {
      _responseModel = ResponseModel(
        false,
        apiResponse.error['title'].toString(),
        apiResponse.error['message'].toString(),
      );

      emit(PostAbsensi(responseModel: _responseModel));
    }
  }

  double calculateDistance({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
  }) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 1000 * 12742 * asin(sqrt(a));
  }
}
