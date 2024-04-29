class Mabsensi {
  Mabsensi({
    this.waktuMasuk,
    this.absenMasuk,
    this.waktuPulang,
    this.absenPulang,
    this.jamKerja,
  });

  factory Mabsensi.fromJson(Map<String, dynamic> json) {
    return Mabsensi(
      waktuMasuk:
          (json['waktu_masuk'] != null) ? json['waktu_masuk'].toString() : '',
      absenMasuk:
          (json['absen_masuk'] != null) ? json['absen_masuk'].toString() : '',
      waktuPulang:
          (json['waktu_pulang'] != null) ? json['waktu_pulang'].toString() : '',
      absenPulang:
          (json['absen_pulang'] != null) ? json['absen_pulang'].toString() : '',
      jamKerja: (json['jam_kerja'] != null)
          ? '${json['jam_kerja'].toString()} jam'
          : '',
    );
  }

  String? waktuMasuk = '';
  String? absenMasuk = '';
  String? waktuPulang = '';
  String? absenPulang = '';
  String? jamKerja = '';
}

class MrekapAbsensi {
  MrekapAbsensi({
    this.tanggal,
    this.isDayoff,
    this.dayoffDesc,
    this.isLeave,
    this.leaveDesc,
    this.absenMasuk,
    this.absenPulang,
  });

  factory MrekapAbsensi.fromJson(Map<String, dynamic> json) {
    return MrekapAbsensi(
      tanggal: (json['tanggal'] != null) ? json['tanggal'].toString() : '',
      isDayoff:
          (json['is_dayoff'].toString().toLowerCase() == 'true') ? true : false,
      dayoffDesc:
          (json['dayoff_desc'] != null) ? json['dayoff_desc'].toString() : '',
      isLeave:
          (json['is_leave'].toString().toLowerCase() == 'true') ? true : false,
      leaveDesc:
          (json['leave_desc'] != null) ? json['leave_desc'].toString() : '',
      absenMasuk: (json['absen_masuk'] != null)
          ? Mabsen.fromJson(json['absen_masuk'] as Map<String, dynamic>)
          : null,
      absenPulang: (json['absen_pulang'] != null)
          ? Mabsen.fromJson(json['absen_pulang'] as Map<String, dynamic>)
          : null,
    );
  }

  String? tanggal = '';
  bool? isDayoff = false;
  String? dayoffDesc = '';
  bool? isLeave = false;
  String? leaveDesc = '';
  Mabsen? absenMasuk = Mabsen();
  Mabsen? absenPulang = Mabsen();
}

class Mabsen {
  Mabsen({
    this.tanggal,
    this.isLate,
    this.isPresent,
  });

  factory Mabsen.fromJson(Map<String, dynamic> json) {
    return Mabsen(
      tanggal: (json['tanggal'] != null) ? json['tanggal'].toString() : null,
      isLate:
          (json['is_late'].toString().toLowerCase() == 'true') ? true : false,
      isPresent: (json['is_present'].toString().toLowerCase() == 'true')
          ? true
          : false,
    );
  }

  String? tanggal = '';
  bool? isLate = false;
  bool? isPresent = false;
}

class MchartAbsensi {
  MchartAbsensi({
    this.totalHari,
    this.totalHariKerja,
    this.totalCuti,
    this.totalMasuk,
    this.totalAbsen,
    this.totalLiburWeekend,
    this.totalLibur,
    this.persentaseMasuk,
    this.persentaseCuti,
    this.persentaseAbsen,
  });

  factory MchartAbsensi.fromJson(Map<String, dynamic> json) {
    return MchartAbsensi(
      totalHari: double.parse(json['total_hari'].toString()),
      totalHariKerja: double.parse(json['total_hari_kerja'].toString()),
      totalCuti: double.parse(json['total_cuti'].toString()),
      totalMasuk: double.parse(json['total_masuk'].toString()),
      totalAbsen: double.parse(json['total_absen'].toString()),
      totalLiburWeekend: double.parse(json['total_libur_weekend'].toString()),
      totalLibur: double.parse(json['total_libur'].toString()),
      persentaseMasuk: double.parse(json['persentase_masuk'].toString()),
      persentaseCuti: double.parse(json['persentase_cuti'].toString()),
      persentaseAbsen: double.parse(json['persentase_absen'].toString()),
    );
  }
  double? totalHari = 0;
  double? totalHariKerja = 0;
  double? totalCuti = 0;
  double? totalMasuk = 0;
  double? totalAbsen = 0;
  double? totalLiburWeekend = 0;
  double? totalLibur = 0;
  double? persentaseMasuk = 0;
  double? persentaseCuti = 0;
  double? persentaseAbsen = 0;
}
