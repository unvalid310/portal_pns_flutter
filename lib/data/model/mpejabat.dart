class PejabatModel {
  PejabatModel({
    required this.id,
    required this.nip,
    required this.nama,
    required this.unorNama,
    required this.jabatan,
  });

  factory PejabatModel.fromMap(Map<String, dynamic> map) {
    return PejabatModel(
      id: (map['id'] == null) ? '' : map['id'].toString(),
      nip: (map['nipBaru'] == null) ? '' : map['nipBaru'].toString(),
      nama: (map['nama'] == null) ? '' : map['nama'].toString(),
      unorNama: (map['unorNama'] == null) ? '' : map['unorNama'].toString(),
      jabatan:
          (map['jabatanNama'] == null) ? '' : map['jabatanNama'].toString(),
    );
  }

  factory PejabatModel.fromJson(Map<String, dynamic> json) {
    return PejabatModel(
      id: json['id'].toString(),
      nip: json['nipBaru'].toString(),
      nama: json['nama'].toString(),
      unorNama: json['unorNama'].toString(),
      jabatan: json['jabatanNama'].toString(),
    );
  }

  String id = '';
  String nip = '';
  String nama = '';
  String unorNama = '';
  String jabatan = '';
}
