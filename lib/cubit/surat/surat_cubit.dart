// ignore_for_file: unused_local_variable, avoid_dynamic_calls, prefer_final_locals, omit_local_variable_types, require_trailing_commas, avoid_print

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portal_pns_flutter/data/model/base/response_model.dart';
import 'package:portal_pns_flutter/data/model/mpejabat.dart';
import 'package:portal_pns_flutter/data/model/msurat.dart';
import 'package:portal_pns_flutter/data/repository/surat_repo.dart';

part 'surat_state.dart';

class SuratCubit extends Cubit<SuratState> {
  final SuratRepo suratRepo;
  SuratCubit({required this.suratRepo}) : super(SuratInital());
  int offset = 0;
  int limit = 10;

  Future<void> getDraftSurat() async {
    try {
      emit(SuratProgress());

      final apiResponse = await suratRepo.getDraftSurat();
      final response = apiResponse.response;
      List<SuratModel> _listSurat = [];

      if (response != null && response.statusCode == 200) {
        final String _success = response.data['status'].toString();
        final String _message = response.data['message'].toString();

        if (_success == 'success') {
          final _data = jsonEncode(response.data['data'].toString());
          jsonDecode(jsonEncode(response.data['data']))
              .map(
                (dynamic e) => _listSurat.add(
                  SuratModel.fromJson(e as Map<String, dynamic>),
                ),
              )
              .toList();
        }

        emit(SuratSuccess(listSurat: _listSurat, message: _message));
      } else {
        emit(SuratError(message: apiResponse.error));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getSuratMasuk() async {
    try {
      emit(SuratProgress());

      final apiResponse = await suratRepo.getSuratMasuk();
      final response = apiResponse.response;
      List<SuratModel> _listSurat = [];

      if (response != null && response.statusCode == 200) {
        final String _success = response.data['status'].toString();
        final String _message = response.data['message'].toString();

        if (_success == 'success') {
          final _data = jsonEncode(response.data['data'].toString());
          jsonDecode(jsonEncode(response.data['data']))
              .map(
                (dynamic e) => _listSurat.add(
                  SuratModel.fromJson(e as Map<String, dynamic>),
                ),
              )
              .toList();
        }

        emit(SuratSuccess(listSurat: _listSurat, message: _message));
      } else {
        emit(SuratError(message: apiResponse.error));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getSuratKeluar() async {
    try {
      emit(SuratProgress());

      final apiResponse = await suratRepo.getSuratKeluar();
      final response = apiResponse.response;
      List<SuratModel> _listSurat = [];

      if (response != null && response.statusCode == 200) {
        final String _success = response.data['status'].toString();
        final String _message = response.data['message'].toString();

        if (_success == 'success') {
          final _data = jsonEncode(response.data['data'].toString());
          jsonDecode(jsonEncode(response.data['data']))
              .map(
                (dynamic e) => _listSurat.add(
                  SuratModel.fromJson(e as Map<String, dynamic>),
                ),
              )
              .toList();
        }

        emit(SuratSuccess(listSurat: _listSurat, message: _message));
      } else {
        emit(SuratError(message: apiResponse.error));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getDetailSurat({required String idSurat}) async {
    try {
      emit(DetailSuratProggress());
      final apiResponse = await suratRepo.getDetailSurat(idSurat: idSurat);
      final response = apiResponse.response;
      late SuratModel _surat;

      if (response != null && response.statusCode == 200) {
        final String _success = response.data['status'].toString();
        final String _message = response.data['message'].toString();

        if (_success == 'success') {
          _surat =
              SuratModel.fromMap(response.data['data'] as Map<String, dynamic>);
        }

        emit(DetailSuratSuccess(surat: _surat, message: _message));
      } else {
        emit(DetailSuratError(message: apiResponse.error));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> kembalikan(
      {required SuratModel surat, required String ringkasan}) async {
    try {
      emit(SuratProgress());
      ResponseModel responseModel = ResponseModel(
          false, 'Gagal mengembalikan surat!', 'Surat gagal dikembalikan');

      final data = <String, dynamic>{
        'idsurat': surat.id,
        'ringkasan': ringkasan,
        'kembalikan': 1,
      };

      final apiResponse = await suratRepo.kirim(data: data);
      final response = apiResponse.response;

      if (response != null && response.statusCode == 200) {
        final String _success = response.data['status'].toString();
        final String _message = response.data['message'].toString();

        if (_success == 'success') {
          responseModel =
              ResponseModel(true, 'Berhasil mengembalikan surat!', '');
        } else {
          responseModel =
              ResponseModel(false, 'Gagal mengembalikan surat!', '');
        }

        emit(Kirim(responseModel: responseModel));
      } else {
        responseModel = ResponseModel(
            false,
            apiResponse.error['title'].toString(),
            apiResponse.error['message'].toString());
        emit(Kirim(responseModel: responseModel));
      }
    } catch (e) {}
  }

  Future<void> ajukan(
      {required SuratModel surat,
      required String ringkasan,
      required PejabatModel pejabat}) async {
    try {
      emit(SuratProgress());
      ResponseModel responseModel = ResponseModel(
          false, 'Gagal mengembalikan surat!', 'Surat gagal dikembalikan');

      final data = <String, dynamic>{
        'idsurat': surat.id,
        'nomorsurat': surat.nomor,
        'tanggal': surat.tanggal,
        'perihal': surat.perihal,
        'penandatangan': surat.penandatangan,
        'halaman': surat.ttd_hal,
        'x': surat.ttd_x,
        'y': surat.ttd_y,
        'kirim': pejabat.nip,
        'ringkasan': ringkasan,
      };

      final apiResponse = await suratRepo.kirim(data: data);
      final response = apiResponse.response;

      if (response != null && response.statusCode == 200) {
        final String _success = response.data['status'].toString();
        final String _message = response.data['message'].toString();

        if (_success == 'success') {
          responseModel =
              ResponseModel(true, 'Berhasil mengembalikan surat!', '');
        } else {
          responseModel =
              ResponseModel(false, 'Gagal mengembalikan surat!', '');
        }

        emit(Kirim(responseModel: responseModel));
      } else {
        responseModel = ResponseModel(
          false,
          apiResponse.error['title'].toString(),
          apiResponse.error['message'].toString(),
        );
        emit(Kirim(responseModel: responseModel));
      }
    } catch (e) {}
  }

  Future<void> getPejabat() async {
    try {
      emit(PejabatProggress());

      final apiResponse =
          await suratRepo.getPejabat(limit: limit, offset: offset);
      final response = apiResponse.response;
      List<PejabatModel> _listPejabat = [];

      if (response != null && response.statusCode == 200) {
        final String _success = response.data['status'].toString();
        final String _message = response.data['message'].toString();

        if (_success == 'success') {
          jsonDecode(jsonEncode(response.data['data']['kirim_ke']))
              .map(
                (dynamic e) => _listPejabat.add(
                  PejabatModel.fromJson(e as Map<String, dynamic>),
                ),
              )
              .toList();
        }

        emit(PejabatSuccess(pejabat: _listPejabat, message: _message));
      } else {
        emit(PejabatError(message: apiResponse.error));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> searchPejabat({required String search}) async {
    try {
      emit(PejabatProggress());

      final apiResponse =
          await suratRepo.getPejabat(limit: 0, offset: 0, search: search);
      final response = apiResponse.response;
      List<PejabatModel> _listPejabat = [];

      if (response != null && response.statusCode == 200) {
        final String _success = response.data['status'].toString();
        final String _message = response.data['message'].toString();

        if (_success == 'success') {
          jsonDecode(jsonEncode(response.data['data']['kirim_ke']))
              .map(
                (dynamic e) => _listPejabat.add(
                  PejabatModel.fromJson(e as Map<String, dynamic>),
                ),
              )
              .toList();
        }

        emit(PejabatSuccess(pejabat: _listPejabat, message: _message));
      } else {
        emit(PejabatError(message: apiResponse.error));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> tandatangan(
      {required SuratModel surat, required String passphrase}) async {
    try {
      emit(SuratProgress());

      ResponseModel responseModel = ResponseModel(
          false, 'Gagal menandatangani surat!', 'Surat gagal ditandatangani.');
      final data = <String, dynamic>{
        'idsurat': surat.id,
        'passphrase': passphrase,
      };

      final apiResponse =
          await suratRepo.tandaTangan(data: <String, dynamic>{});
      final response = apiResponse.response;

      if (response != null && response.statusCode == 200) {
        final String _success = response.data['status'].toString();
        final String _message = response.data['message'].toString();

        if (_success == 'success') {
          responseModel =
              ResponseModel(true, 'Berhasil mengembalikan surat!', '');
        } else {
          responseModel = ResponseModel(false, 'Gagal menandatangani surat!',
              'Surat gagal ditandatangani.');
        }

        emit(TandaTangan(responseModel: responseModel));
      } else {
        responseModel = ResponseModel(
          false,
          apiResponse.error['title'].toString(),
          apiResponse.error['message'].toString(),
        );
        emit(TandaTangan(responseModel: responseModel));
      }
    } catch (e) {
      print(e);
    }
  }
}
