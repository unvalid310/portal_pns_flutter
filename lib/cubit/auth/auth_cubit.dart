// ignore_for_file: omit_local_variable_types, unawaited_futures, cascade_invocations, avoid_print

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:crypto/crypto.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:portal_pns_flutter/data/model/base/response_model.dart';
import 'package:portal_pns_flutter/data/model/mlogin.dart';
import 'package:portal_pns_flutter/data/repository/auth_repo.dart';
import 'package:portal_pns_flutter/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:strings/strings.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  final SharedPreferences sharedPreferences;
  AuthCubit({required this.authRepo, required this.sharedPreferences})
      : super(AuthInitial());

  Future<void> login({required String nip, required String password}) async {
    try {
      List dataUnitOrganisasi;
      List<String> _unitOrganisasi = [];
      final String _deviceID =
          await FirebaseMessaging.instance.getToken().then((value) => value!);
      ResponseModel responseModel =
          ResponseModel(false, 'Terjadi kesalahan', 'Nip atau password salah');

      emit(AuthProgress());

      final apiResponse = await authRepo.login(
        nip: nip,
        password: sha1.convert(utf8.encode(password)).toString(),
        deviceID: '', //_deviceID,
      );

      final response = apiResponse.response;

      if (response != null && response.statusCode == 200) {
        final String _success = response.data['login'].toString();

        if (_success == 'sukses') {
          final data = response.data as Map<String, dynamic>;
          final mlogin = Mlogin.fromMap(data, password);
          if (data['unit_organisasi'] == null) {
            _unitOrganisasi.add(camelize(mlogin.unitkerja));
          } else {
            dataUnitOrganisasi = data['unit_organisasi'] as List;
            dataUnitOrganisasi.forEach((dynamic value) {
              _unitOrganisasi.add(value['unit_organisasi'].toString());
            });
          }

          sharedPreferences.setString(
            AppConstants.ID_USER,
            data['info']['id_user'].toString(),
          );
          sharedPreferences.setString(AppConstants.NIP, mlogin.nip);
          sharedPreferences.setString(AppConstants.NAMA, mlogin.nama);
          sharedPreferences.setString(
            AppConstants.UNIT_KERJA,
            camelize(mlogin.unitorganisasi),
          );
          sharedPreferences.setStringList(
            AppConstants.UNIT_ORGANISASI,
            _unitOrganisasi,
          );

          sharedPreferences.setString(
              AppConstants.USER_KATEGORI, data['info']['kategori'].toString());

          if (data['info']['fotoprofil'] != null) {
            sharedPreferences.setString(AppConstants.PROFILE_PICTURE,
                '${dotenv.env['BASE_URL_DATAWAREHOUSE']}/${data['info']['fotoprofil'].toString()}');
          }

          responseModel = ResponseModel(true, 'Login berhasil', 'selamat');
        } else {
          final String _message = response.data['detail'].toString();
          responseModel = ResponseModel(false, 'Login gagal', _message);
        }

        emit(AuthProeses(responseModel: responseModel));
      } else {
        emit(AuthError(message: apiResponse.error));
      }
    } catch (e) {
      print(e);
    }
  }

  bool isLoginedIn() {
    return authRepo.isLoggedIn();
  }

  Future<void> getProfile() async {
    try {
      emit(Profile(sharedPreferences: sharedPreferences));
    } catch (e) {
      print(e);
    }
  }
}
