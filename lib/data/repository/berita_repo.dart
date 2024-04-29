// ignore_for_file: unnecessary_statements, empty_catches, deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:portal_pns_flutter/data/datasource/remote/dio/dio_client.dart';
import 'package:portal_pns_flutter/data/datasource/remote/exception/api_error_handler.dart';
import 'package:portal_pns_flutter/data/model/base/api_response.dart';

class BeritaRepo {
  final DioClient dioClient;

  BeritaRepo({required this.dioClient});

  Future<ApiResponse> getBerita({int? pages}) async {
    try {
      int _pages = (pages != null) ? pages : 1;
      final response = await dioClient.get(
        dotenv.env['URL_BERITA'].toString(),
        queryParameters: <String, dynamic>{
          'page': _pages.toString(),
          '_embed': null
        },
      ) as Response;

      return ApiResponse.withSuccess(response);
    } on DioException catch (error) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(error));
    }
  }
}
