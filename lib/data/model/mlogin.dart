import 'package:intl/intl.dart';

class Mlogin {
  Mlogin({
    required this.nip,
    required this.username,
    required this.password,
    required this.nama,
    required this.urlfoto,
    required this.jabatan,
    required this.unitkerja,
    required this.unitorganisasi,
    required this.email,
    required this.nohp,
    required this.tgllahir,
    required this.statuslogin,
  });

  factory Mlogin.fromMap(Map<String, dynamic> map, String password) {
    return Mlogin(
      nip: (map['info'] as Map<String, dynamic>)['nip'] == null
          ? ''
          : (map['info'] as Map<String, dynamic>)['nip'].toString(),
      username: (map['info'] as Map<String, dynamic>)['username'].toString(),
      password: password,
      nama: (map['dataapi'] as Map<String, dynamic>)['nama'].toString(),
      urlfoto: (map['info'] as Map<String, dynamic>)['fotoprofil'] == null
          ? ''
          : (map['info'] as Map<String, dynamic>)['fotoprofil'].toString(),
      jabatan: (map['dataapi'] as Map<String, dynamic>)['jabatanNama'] == null
          ? ''
          : (map['dataapi'] as Map<String, dynamic>)['jabatanNama'].toString(),
      unitkerja: (map['dataunit'] as Map<String, dynamic>)['unit_kerja'] == null
          ? ''
          : (map['dataunit'] as Map<String, dynamic>)['unit_kerja'].toString(),
      unitorganisasi:
          (map['dataunit'] as Map<String, dynamic>)['unit_organisasi'] == null
              ? ''
              : (map['dataunit'] as Map<String, dynamic>)['unit_organisasi']
                  .toString(),
      email: (map['info'] as Map<String, dynamic>)['email'] == null
          ? ''
          : (map['info'] as Map<String, dynamic>)['email'].toString(),
      nohp: (map['dataapi'] as Map<String, dynamic>)['noHp'] == null
          ? ''
          : (map['dataapi'] as Map<String, dynamic>)['noHp'].toString(),
      tgllahir: (map['dataapi'] as Map<String, dynamic>)['tglLahir'] == null
          ? DateTime.now()
          : DateFormat('yyyy-MM-dd').parse(
              (map['dataapi'] as Map<String, dynamic>)['tglLahir'].toString(),
            ),
      statuslogin: '1',
    );
  }

  factory Mlogin.fromJson(Map<String, dynamic> json) {
    return Mlogin(
      nip: json['nip'].toString(),
      username: json['username'].toString(),
      password: json['password'].toString(),
      nama: json['nama'].toString(),
      urlfoto: json['urlfoto'].toString(),
      jabatan: json['jabatan'].toString(),
      unitkerja: json['unitkerja'].toString(),
      unitorganisasi: json['unitorganisasi'].toString(),
      email: json['email'].toString(),
      nohp: json['nohp'].toString(),
      tgllahir: DateTime.parse(json['tgllahir'].toString()),
      statuslogin: json['statuslogin'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'nip': nip,
      'username': username,
      'password': password,
      'nama': nama,
      'urlfoto': urlfoto,
      'jabatan': jabatan,
      'unitkerja': unitkerja,
      'unitorganisasi': unitorganisasi,
      'email': email,
      'nohp': nohp,
      'tgllahir': tgllahir.toString(),
      'statuslogin': statuslogin
    };
  }

  String nip = '';
  String username = '';
  String password = '';
  String nama = '';
  String urlfoto = '';
  String jabatan = '';
  String unitkerja = '';
  String unitorganisasi = '';
  String email = '';
  DateTime tgllahir = DateTime.now();
  String nohp = '';
  String statuslogin = '0';
}
