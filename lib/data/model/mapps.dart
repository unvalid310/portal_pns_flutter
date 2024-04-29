class Mapps {
  Mapps({
    required this.nama,
    required this.ket,
    required this.logo,
    required this.url,
  });

  factory Mapps.fromMap(Map<String, dynamic> map) {
    return Mapps(
      nama: map['apps'].toString(),
      ket: map['ket'].toString(),
      logo: map['logo'] == null ? '' : map['logo'].toString(),
      url: map['url'].toString(),
    );
  }

  String nama = '';
  String ket = '';
  String logo = '';
  String url = '';
}
