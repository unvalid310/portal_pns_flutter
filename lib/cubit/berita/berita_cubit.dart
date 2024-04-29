// ignore_for_file: deprecated_member_use

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portal_pns_flutter/data/model/mberita.dart';
import 'package:portal_pns_flutter/data/repository/berita_repo.dart';

part 'berita_state.dart';

class BeritaCubit extends Cubit<BeritaState> {
  final BeritaRepo beritaRepo;
  BeritaCubit({required this.beritaRepo}) : super(BeritaInitial());

  Future<void> getBeritaList(
      {int? pages = null, List<Mberita>? listBerita = null}) async {
    try {
      if (listBerita == null) emit(BeritaProgress(isLoading: true));

      final apiResponse = await beritaRepo.getBerita(pages: pages);
      final response = apiResponse.response;
      List<Mberita> _listBerita = [];
      if (listBerita != null) {
        _listBerita = listBerita;
      }

      if (response != null && response.statusCode == 200) {
        final _data = (response.data) as List;

        for (final _berita in _data) {
          final _mberita = Mberita.fromMap(_berita as Map<String, dynamic>);
          _listBerita.add(_mberita);
        }

        emit(BeritaSuccess(
            berita: _listBerita, message: 'Data berhasil ditampilkan'));
        emit(BeritaProgress(isLoading: false));
      } else {
        emit(BeritaError(message: apiResponse.error));
        emit(BeritaProgress(isLoading: false));
      }
    } catch (e) {
      print(e);
    }
  }
}
