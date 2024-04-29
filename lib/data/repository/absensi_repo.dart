import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:portal_pns_flutter/data/datasource/remote/dio/dio_client.dart';
import 'package:portal_pns_flutter/data/datasource/remote/exception/api_error_handler.dart';
import 'package:portal_pns_flutter/data/model/base/api_response.dart';
import 'package:portal_pns_flutter/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AbsensiRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  AbsensiRepo({required this.dioClient, required this.sharedPreferences});

  Future<ApiResponse> getAbsensiHarian() async {
    try {
      final _params = <String, dynamic>{
        'nip': sharedPreferences.getString(AppConstants.NIP),
      };

      final response = await dioClient.get(
        '${dotenv.env['BASE_URL_EKIN'].toString()}/presensi',
        queryParameters: _params,
      ) as Response;

      return ApiResponse.withSuccess(response);
    } on DioException catch (error) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(error));
    }
  }

  Future<ApiResponse> getRekapAbsensi(
      {required String month, required String year}) async {
    try {
      final _params = <String, dynamic>{
        'nip': sharedPreferences.getString(AppConstants.NIP),
        'bulan': month,
        'tahun': year,
        'unit_kerja': sharedPreferences.getString(AppConstants.UNIT_KERJA),
      };

      final response = await dioClient.get(
        '${dotenv.env['BASE_URL_EKIN']}/presensi_bulanan',
        queryParameters: _params,
      );

      return ApiResponse.withSuccess(response);
    } on DioException catch (error) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(error));
    }
  }

  Future<ApiResponse> getUnitKerja({String? unitKerja}) async {
    try {
      final response = await dioClient.get(
        '${dotenv.env['BASE_URL_EKIN']}/unitkerja',
        queryParameters: <String, dynamic>{'unit_kerja': unitKerja},
      );

      return ApiResponse.withSuccess(response);
    } on DioException catch (error) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(error));
    }
  }

  Future<ApiResponse> postPresensi(Map<String, dynamic> data) async {
    try {
      final nip = sharedPreferences.getString(AppConstants.NIP);

      data['nip'] = nip;

      final response = await dioClient.post(
        '${dotenv.env['BASE_URL_EKIN']}/presensi',
        data: data,
      );

      return ApiResponse.withSuccess(response);
    } on DioException catch (error) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(error));
    }
  }
}
