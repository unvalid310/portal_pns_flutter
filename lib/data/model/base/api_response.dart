import 'package:dio/dio.dart';

class ApiResponse {
  final Response? response;
  final Map<String, dynamic> error;

  ApiResponse(this.response, this.error);

  ApiResponse.withError(Map<String, dynamic> errorValue)
      : response = null,
        error = errorValue;

  ApiResponse.withSuccess(Response responseValue)
      : response = responseValue,
        error = <String, dynamic>{};
}
