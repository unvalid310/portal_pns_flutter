// ignore_for_file: sort_constructors_first, must_be_immutable

part of 'surat_cubit.dart';

class SuratState extends Equatable {
  SuratState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SuratInital extends SuratState {}

class SuratProgress extends SuratState {}

class SuratSuccess extends SuratState {
  final List<SuratModel> listSurat;
  final String message;
  SuratSuccess({required this.listSurat, required this.message});
}

class SuratError extends SuratState {
  final Map<String, dynamic> message;
  SuratError({required this.message});
}

class DetailSuratProggress extends SuratState {}

class DetailSuratSuccess extends SuratState {
  final SuratModel surat;
  final String message;
  DetailSuratSuccess({required this.surat, required this.message});
}

class DetailSuratError extends SuratState {
  final Map<String, dynamic> message;
  DetailSuratError({required this.message});
}

class Kirim extends SuratState {
  ResponseModel responseModel;
  Kirim({required this.responseModel});
}

class TandaTangan extends SuratState {
  ResponseModel responseModel;
  TandaTangan({required this.responseModel});
}

class PejabatProggress extends SuratState {}

class PejabatSuccess extends SuratState {
  final List<PejabatModel> pejabat;
  final String message;
  PejabatSuccess({required this.pejabat, required this.message});
}

class PejabatError extends SuratState {
  final Map<String, dynamic> message;
  PejabatError({required this.message});
}
