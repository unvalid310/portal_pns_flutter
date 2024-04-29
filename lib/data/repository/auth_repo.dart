import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:portal_pns_flutter/data/datasource/remote/dio/dio_client.dart';
import 'package:portal_pns_flutter/data/datasource/remote/exception/api_error_handler.dart';
import 'package:portal_pns_flutter/data/model/base/api_response.dart';
import 'package:portal_pns_flutter/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.dioClient, required this.sharedPreferences});

  Future<ApiResponse> login(
      {required String nip,
      required String password,
      String deviceID = ''}) async {
    try {
      Map<String, dynamic> formData = <String, dynamic>{
        'nip': nip,
        'passwd': password,
        'apps': 'pns'
      };

      if (deviceID != '') {
        formData['deviceid'] = deviceID;
      }

      final response = await dioClient.post(
        '${dotenv.env['BASE_URL_DATAWAREHOUSE']}/api/login',
        data: FormData.fromMap(formData),
        options: Options(
          contentType: 'application/json, application/x-www-form-urlencoded',
          headers: <String, String>{
            'authorization':
                'Basic ${base64Encode(utf8.encode(dotenv.env['AUTH_KEY'].toString()))}'
          },
        ),
      );

      return ApiResponse.withSuccess(response);
    } on DioException catch (error) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(error));
      print(error);
    }
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.ID_USER);
  }
}
