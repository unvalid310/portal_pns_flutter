// ignore_for_file: unnecessary_null_comparison, prefer_is_empty, curly_braces_in_flow_control_structures, deprecated_member_use

import 'package:dio/dio.dart';
import 'package:portal_pns_flutter/data/model/base/error_response.dart';

class ApiErrorHandler {
  static Map<String, dynamic> getMessage(dynamic error) {
    var errorDescription = <String, dynamic>{};
    if (error is DioException) {
      try {
        print(error.type);
        switch (error.type) {
          case DioExceptionType.cancel:
            errorDescription = <String, dynamic>{
              'title': 'Request dibatalkan!',
              'message': 'Request to API server was cancelled.'
            };
            break;
          case DioExceptionType.connectionTimeout:
            errorDescription = <String, dynamic>{
              'title': 'Batas waktu server habis!',
              'message':
                  'Periksa koneksi internet Anda atau mulai ulang aplikasi.'
            };
            break;
          case DioExceptionType.unknown:
            errorDescription = <String, dynamic>{
              'title': 'Terjadi kesalahan server!',
              'message': 'Server sedang diperbaiki, coba beberapa saat lagi.'
            };
            break;
          case DioExceptionType.receiveTimeout:
            errorDescription = <String, dynamic>{
              'title': 'Terjadi kesalahan!',
              'message': 'Harap periksa koneksi jariangan anda.'
            };
            break;
          case DioExceptionType.badResponse:
            switch (error.response?.statusCode) {
              case 404:
                errorDescription = <String, dynamic>{
                  'title': 'Data tidak ditemukan!',
                  'message': 'Harap hubungi petugas pelayanan terkait.'
                };
                break;
              case 500:
                errorDescription = <String, dynamic>{
                  'title': 'Terjadi kesalahan server!',
                  'message': 'Harap hubungi petugas pelayanan terkait.'
                };
                break;
              case 503:
                errorDescription = <String, dynamic>{
                  'title': 'Terjadi kesalahan server!',
                  'message': error.response?.statusMessage
                };
                break;
              default:
                ErrorResponse errorResponse =
                    ErrorResponse.fromJson(error.response?.data);
                if (errorResponse.errors != null &&
                    errorResponse.errors.length > 0)
                  errorDescription = <String, dynamic>{
                    'title': 'Terjadi kesalahan server!',
                    'message': errorResponse
                  };
                else
                  errorDescription = <String, dynamic>{
                    'title': 'Terjadi kesalahan server!',
                    'message':
                        "Failed to load data - status code: ${error.response?.statusCode}"
                  };
            }
            break;
          case DioExceptionType.sendTimeout:
            errorDescription = <String, dynamic>{
              'title': 'Gagal akses server!',
              'message': 'Harap periksa koneksi jariangan anda.'
            };
            break;
          case DioExceptionType.badCertificate:
            // TODO: Handle this case.
            break;
          case DioExceptionType.connectionError:
            // TODO: Handle this case.
            break;
        }
      } on FormatException catch (e) {
        errorDescription = <String, dynamic>{
          'title': 'Terjadi kesalahan!',
          'message': e.toString()
        };
      }
    } else {
      errorDescription = <String, dynamic>{
        'title': 'Terjadi kesalahan!',
        'message': 'is not a subtype of exception'
      };
    }
    return errorDescription;
  }
}
