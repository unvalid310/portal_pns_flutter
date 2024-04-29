part of 'absensi_cubit.dart';

class AbsensiState extends Equatable {
  AbsensiState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AbsensiInitial extends AbsensiState {}

class AbsensiProgress extends AbsensiState {
  final bool isLoading;
  AbsensiProgress({this.isLoading = false});
}

class AbsensiSuccess extends AbsensiState {
  final Mabsensi absensi;
  final String message;
  AbsensiSuccess({required this.absensi, this.message = ''});
}

class AbsensiError extends AbsensiState {
  final Map<String, dynamic> message;
  AbsensiError({
    required this.message,
  });
}

class RekapAbsensiProgress extends AbsensiState {
  final bool isLoading;
  RekapAbsensiProgress({this.isLoading = false});
}

class RekapAbsensiSuccess extends AbsensiState {
  List<MrekapAbsensi>? listAbsensi = [];
  MchartAbsensi? chartAbsensi = null;
  RekapAbsensiSuccess({this.listAbsensi, this.chartAbsensi});
}

class RekapAbsensiError extends AbsensiState {
  final Map<String, dynamic> message;
  RekapAbsensiError({
    required this.message,
  });
}

class PostAbsensiProgress extends AbsensiState {}

class PostAbsensi extends AbsensiState {
  ResponseModel responseModel;
  PostAbsensi({required this.responseModel});
}
