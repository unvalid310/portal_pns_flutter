import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:portal_pns_flutter/data/datasource/remote/dio/dio_client.dart';
import 'package:portal_pns_flutter/data/datasource/remote/exception/api_error_handler.dart';
import 'package:portal_pns_flutter/data/model/base/api_response.dart';
import 'package:portal_pns_flutter/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SuratRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  SuratRepo({required this.dioClient, required this.sharedPreferences});

  Future<ApiResponse> getDraftSurat() async {
    try {
      final response = await dioClient.get(
        '${dotenv.env['BASE_URL_DEV_ESIKAM']}/suratnew/draf',
        queryParameters: <String, dynamic>{
          'nip': sharedPreferences.getString(AppConstants.NIP),
          'unit_kerja': sharedPreferences.getString(AppConstants.UNIT_KERJA),
        },
      );

      return ApiResponse.withSuccess(response);
    } on DioException catch (error) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(error));
    }
  }

  Future<ApiResponse> getSuratMasuk() async {
    try {
      final response = await dioClient.get(
        '${dotenv.env['BASE_URL_DEV_ESIKAM']}/suratnew/masuk',
        queryParameters: <String, dynamic>{
          'nip': sharedPreferences.getString(AppConstants.NIP),
          'unit_kerja': sharedPreferences.getString(AppConstants.UNIT_KERJA),
        },
      );

      return ApiResponse.withSuccess(response);
    } on DioException catch (error) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(error));
    }
  }

  Future<ApiResponse> getSuratKeluar() async {
    try {
      final response = await dioClient.get(
        '${dotenv.env['BASE_URL_DEV_ESIKAM']}/suratnew/keluar',
        queryParameters: <String, dynamic>{
          'nip': sharedPreferences.getString(AppConstants.NIP),
          'unit_kerja': sharedPreferences.getString(AppConstants.UNIT_KERJA),
        },
      );

      return ApiResponse.withSuccess(response);
    } on DioException catch (error) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(error));
    }
  }

  Future<ApiResponse> getDetailSurat({required String idSurat}) async {
    try {
      final response = await dioClient.get(
        '${dotenv.env['BASE_URL_DEV_ESIKAM']}/suratnew/$idSurat',
        queryParameters: <String, dynamic>{
          'nip': sharedPreferences.getString(AppConstants.NIP),
        },
      );

      return ApiResponse.withSuccess(response);
    } on DioException catch (error) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(error));
    }
  }

  Future<ApiResponse> getPejabat({
    int? limit,
    int? offset,
    String? search,
  }) async {
    try {
      final response = await dioClient.get(
        '${dotenv.env['BASE_URL_DEV_ESIKAM']}/suratnew/kirim_ke',
        queryParameters: <String, dynamic>{
          'unit_kerja': sharedPreferences.getString(AppConstants.UNIT_KERJA),
          'limit': limit,
          'offset': offset,
          'search': search,
        },
      );

      return ApiResponse.withSuccess(response);
    } on DioException catch (error) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(error));
    }
  }

  Future<ApiResponse> kirim({required Map<String, dynamic> data}) async {
    try {
      data['nip'] = sharedPreferences.getString(AppConstants.NIP);
      final response = await dioClient.post(
        '${dotenv.env['BASE_URL_DEV_ESIKAM']}/suratnew/kirim',
        data: FormData.fromMap(data),
        options: Options(
          contentType: 'application/x-www-form-urlencoded',
        ),
      );

      return ApiResponse.withSuccess(response);
    } on DioException catch (error) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(error));
    }
  }

  Future<ApiResponse> tandaTangan({required Map<String, dynamic> data}) async {
    try {
      data['nip'] = sharedPreferences.getString(AppConstants.NIP);
      data['nama'] = sharedPreferences.getString(AppConstants.NAMA);
      final response = await dioClient.post(
        '${dotenv.env['BASE_URL_DEV_ESIKAM']}/suratnew/tandatangan',
        data: FormData.fromMap(data),
        options: Options(
          contentType: 'application/x-www-form-urlencoded',
        ),
      );

      return ApiResponse.withSuccess(response);
    } on DioException catch (error) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(error));
    }
  }
}
