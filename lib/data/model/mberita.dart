import 'package:html/parser.dart' show parse;

class Mberita {
  Mberita({
    required this.judul,
    required this.isiexcerpt,
    required this.urlfoto,
    required this.link,
    required this.isifull,
    required this.tgl,
  });

  factory Mberita.fromMap(Map<String, dynamic> map) {
    return Mberita(
      judul: (map['title'] as Map<String, dynamic>)['rendered'].toString(),
      isiexcerpt: parse((map['excerpt'] as Map<String, dynamic>)['rendered'])
          .documentElement!
          .text,
      // urlfoto: 'https://datawarehouse.metrokota.go.id/assets/logometro.png',
      urlfoto: (map['_embedded'] as Map<String, dynamic>)['wp:featuredmedia'] ==
              null
          ? 'https://datawarehouse.metrokota.go.id/assets/logometro.png'
          : ((((((map['_embedded'] as Map<String, dynamic>)['wp:featuredmedia']
                                  as List)
                              .first as Map<String, dynamic>)['media_details']
                          as Map<String, dynamic>)['sizes']
                      as Map<String, dynamic>)['medium']
                  as Map<String, dynamic>)['source_url']
              .toString(),

      link: map['link'].toString(),
      isifull: (map['content'] as Map<String, dynamic>)['rendered'].toString(),
      tgl: DateTime.parse(map['date'].toString()),
    );
  }

  String judul = '';
  String isiexcerpt = '';
  String urlfoto = '';
  DateTime tgl = DateTime(2000);
  String link = '';
  String isifull = '';
}
