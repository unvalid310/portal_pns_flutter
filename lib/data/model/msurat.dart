// ignore_for_file: sort_constructors_first, unused_local_variable, avoid_dynamic_calls, unnecessary_lambdas, lines_longer_than_80_chars, non_constant_identifier_names, avoid_unused_constructor_parameters, omit_local_variable_types

class SuratModel {
  SuratModel({
    required this.id,
    required this.tanggal,
    required this.nomor,
    required this.perihal,
    required this.status,
    this.penandatangan,
    this.create_by,
    this.nama_pembuat,
    this.opd_pembuat,
    this.created_on,
    this.nota_dinas,
    this.waktu,
    this.posisi,
    this.catatan,
    required this.filename,
    this.ttd_x,
    this.ttd_y,
    this.ttd_hal,
    this.read_status,
    this.read_at,
    required this.tujuan,
    this.filepath,
    required this.logsurat,
    this.posisiNama,
    this.statusSurat,
  });

  factory SuratModel.fromMap(Map<String, dynamic> map) {
    List<String> _tujuan = [];
    final List<LogSurat> _logsurat = [];
    if (map['tujuansurat'] != null) {
      _tujuan = (map['tujuansurat'].toString()).split(', ');
    }
    if (map['logsurat'] != null) {
      map['logsurat'].forEach(
        (dynamic map) =>
            _logsurat.add(LogSurat.fromMap(map as Map<String, dynamic>)),
      );
    }

    return SuratModel(
      id: (map['id'] == null) ? '' : map['id'].toString(),
      tanggal: (map['tanggal'] == null) ? '' : map['tanggal'].toString(),
      nomor: (map['nomor'] == null) ? '' : map['nomor'].toString(),
      perihal: (map['perihal'] == null) ? '' : map['perihal'].toString(),
      status: (map['status'] == null) ? '' : map['status'].toString(),
      penandatangan:
          (map['penandatangan'] == null) ? '' : map['penandatangan'].toString(),
      create_by:
          (map['created_by'] == null) ? '' : map['created_by'].toString(),
      nama_pembuat:
          (map['nama_pembuat'] == null) ? '' : map['nama_pembuat'].toString(),
      opd_pembuat:
          (map['opd_pembuat'] == null) ? '' : map['opd_pembuat'].toString(),
      nota_dinas: (map['notadinas'] == null) ? '' : map['notadinas'].toString(),
      waktu: (map['waktu'] == null) ? '' : map['waktu'].toString(),
      posisi: (map['posisi'] == null) ? '' : map['posisi'].toString(),
      catatan: (map['catatan'] == null) ? '' : map['catatan'].toString(),
      filename: (map['filename'] == null) ? '' : map['filename'].toString(),
      ttd_x: (map['ttd_x'] == null) ? '' : map['ttd_x'].toString(),
      ttd_y: (map['ttd_y'] == null) ? '' : map['ttd_y'].toString(),
      ttd_hal: (map['ttd_hal'] == null) ? '' : map['ttd_hal'].toString(),
      read_status:
          (map['read_status'] == null) ? '' : map['read_status'].toString(),
      read_at: (map['read_at'] == null) ? '' : map['read_at'].toString(),
      tujuan: (map['tujuansurat'] == null) ? [] : _tujuan,
      filepath: (map['filepath'] == null) ? '' : map['filepath'].toString(),
      posisiNama:
          (map['posisi_nama'] == null) ? '' : map['posisi_nama'].toString(),
      statusSurat:
          (map['status_surat'] == null) ? '' : map['status_surat'].toString(),
      logsurat: _logsurat,
    );
  }

  factory SuratModel.fromJson(Map<String, dynamic> json) {
    List<String> _tujuan = [];
    final List<LogSurat> _logsurat = [];
    if (json['tujuansurat'] != null) {
      _tujuan = (json['tujuansurat'].toString()).split(', ');
    }
    if (json['logsurat'] != null) {
      json['logsurat'].forEach(
        (dynamic map) =>
            _logsurat.add(LogSurat.fromMap(map as Map<String, dynamic>)),
      );
    }

    return SuratModel(
      id: json['id'].toString(),
      tanggal: json['tanggal'].toString(),
      nomor: json['nomor'].toString(),
      perihal: json['perihal'].toString(),
      status: json['status'].toString(),
      penandatangan: json['penandatangan'].toString(),
      create_by: json['created_by'].toString(),
      nama_pembuat: json['nama_pembuat'].toString(),
      opd_pembuat: json['opd_pembuat'].toString(),
      created_on: json['created_on'].toString(),
      nota_dinas:
          (json['notadinas'] != null) ? json['notadinas'].toString() : null,
      waktu: json['waktu'].toString(),
      posisi: json['posisi'].toString(),
      catatan: json['catatan'].toString(),
      filename: json['filename'].toString(),
      ttd_x: json['ttd_x'].toString(),
      ttd_y: json['ttd_y'].toString(),
      ttd_hal: json['ttd_hal'].toString(),
      read_status: json['read_status'].toString(),
      read_at: json['read_at'].toString(),
      tujuan: _tujuan,
      filepath: json['filepath'].toString(),
      statusSurat: json['status_surat'].toString(),
      posisiNama: json['posisi_nama'].toString(),
      logsurat: _logsurat,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'nomor': nomor,
      'penandatangan': penandatangan,
      'perihal': perihal,
      'tanggal': tanggal,
      'tujuan': tujuan.toList(),
      'create_by': create_by,
      'filename': filename,
      'status': status,
      'read_status': read_status,
    };
  }

  String id = '';
  String tanggal = '';
  String nomor = '';
  String perihal = '';
  String status = '';
  String? penandatangan = '';
  String? create_by = '';
  String? nama_pembuat = '';
  String? opd_pembuat = '';
  String? created_on = '';
  String? nota_dinas = '';
  String? waktu = '';
  String? posisi = '';
  String? posisiNama = '';
  String? statusSurat = '';
  String? catatan = '';
  String filename = '';
  String? ttd_x = '';
  String? ttd_y = '';
  String? ttd_hal = '';
  String? read_status = '';
  String? read_at = '';
  List<String> tujuan = [];
  String? filepath = '';
  List<LogSurat> logsurat = [];
}

class LogSurat {
  LogSurat({
    required this.idlogsurat,
    required this.idsurat,
    required this.waktu,
    this.catatan,
    required this.pengirimNama,
    required this.kepadaNama,
    this.kepadaUnitOrganisasi,
    this.kepadaUnitKerja,
  });

  factory LogSurat.fromJson(Map<String, dynamic> json) {
    // print(
    //   'kepada_nama ${(json['kepada_nama'] == null) ? 'tidak ada' : json['kepada_nama'].toString()}',
    // );
    return LogSurat(
      idlogsurat:
          (json['idlogsurat'] == null) ? '' : json['idlogsurat'].toString(),
      idsurat: (json['idsurat'] == null) ? '' : json['idsurat'].toString(),
      waktu: (json['waktu'] == null) ? '' : json['waktu'].toString(),
      catatan: (json['catatan'] == null) ? '' : json['catatan'].toString(),
      pengirimNama: (json['pengirim_nama'] == null)
          ? ''
          : json['pengirim_nama'].toString(),
      kepadaNama:
          (json['kepada_nama'] == null) ? '' : json['kepada_nama'].toString(),
      kepadaUnitOrganisasi: (json['kepada_unit_organisasi'] == null)
          ? ''
          : json['kepada_unit_organisasi'].toString(),
      kepadaUnitKerja: (json['kepada_unit_kerja'] == null)
          ? ''
          : json['kepada_unit_kerja'].toString(),
    );
  }

  factory LogSurat.fromMap(Map<String, dynamic> map) {
    // print(
    //   'kepada_nama ${(map['kepada_nama'] == null) ? 'tidak ada' : map['kepada_nama'].toString()}',
    // );
    return LogSurat(
      idlogsurat:
          (map['idlogsurat'] == null) ? '' : map['idlogsurat'].toString(),
      idsurat: (map['idsurat'] == null) ? '' : map['idsurat'].toString(),
      waktu: (map['waktu'] == null) ? '' : map['waktu'].toString(),
      catatan: (map['catatan'] == null) ? '' : map['catatan'].toString(),
      pengirimNama:
          (map['pengirim_nama'] == null) ? '' : map['pengirim_nama'].toString(),
      kepadaNama:
          (map['kepada_nama'] == null) ? '' : map['kepada_nama'].toString(),
      kepadaUnitOrganisasi: (map['kepada_unit_organisasi'] == null)
          ? ''
          : map['kepada_unit_organisasi'].toString(),
      kepadaUnitKerja: (map['kepada_unit_kerja'] == null)
          ? ''
          : map['kepada_unit_kerja'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'idlogsurat': idlogsurat,
      'idsurat': idsurat,
      'catatan': catatan,
      'pengirim_nama': pengirimNama,
      'kepada_nama': kepadaNama,
      'kepada_unit_organisasi': kepadaUnitOrganisasi,
      'kepada_unit_kerja': kepadaUnitKerja,
    };
  }

  String? idlogsurat = '';
  String? idsurat = '';
  String waktu = '';
  String? catatan = '';
  String pengirimNama = '';
  String kepadaNama = '';
  String? kepadaUnitOrganisasi = '';
  String? kepadaUnitKerja = '';
}
