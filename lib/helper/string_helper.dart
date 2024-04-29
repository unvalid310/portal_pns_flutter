import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:portal_pns_flutter/view/base/widget/alert_dialog_widget.dart';
import 'package:url_launcher/url_launcher.dart';

String daytimeFormat(String date) {
  if (date != null && date != '') {
    initializeDateFormatting();
    final fromDate = DateTime.parse(date);
    final formatter = DateFormat('EEEE, d MMMM yyyy', 'id_ID');
    final formatted = formatter.format(fromDate);
    return formatted;
  } else {
    return date;
  }
}

String dayAndTimeFormat(String date) {
  if (date != null && date != '') {
    initializeDateFormatting();
    final DateTime fromDate = DateTime.parse(date);
    final tanggal = DateFormat('d MMMM yyyy hh:mm', 'id_ID');
    final String formatTanggal = tanggal.format(fromDate);
    return 'Pada $formatTanggal';
  } else {
    return date;
  }
}

String timeFormat(String date) {
  if (date != null && date != '') {
    initializeDateFormatting();
    final DateTime fromDate = DateTime.parse(date);
    final formatter = DateFormat('d MMMM yyyy', 'id_ID');
    final String formatted = formatter.format(fromDate);
    return formatted;
  } else {
    return date;
  }
}

String getTimeOfDate(String date) {
  if (date != null && date != '') {
    final DateTime fromDate = DateTime.parse(date);
    final tanggal = DateFormat('HH:mm', 'id_ID');
    final String waktu = tanggal.format(fromDate);
    return waktu;
  } else {
    return date;
  }
}

String getMonthName(String date) {
  if (date != null && date != '') {
    final DateTime fromDate = DateTime.parse(date);
    final tanggal = DateFormat('MMMM yyyy', 'id_ID');
    final String waktu = tanggal.format(fromDate);
    return waktu;
  } else {
    return date;
  }
}

bool parseBool({required String string}) {
  if (string.toLowerCase() == 'true') {
    return true;
  } else if (string.toLowerCase() == 'false') {
    return false;
  }

  throw '"$string" can not be parsed to boolean.';
}

String getDate(String date) {
  if (date != null && date != '') {
    final DateTime fromDate = DateTime.parse(date);
    final tanggal = DateFormat('dd', 'id_ID');
    final String waktu = tanggal.format(fromDate);
    return waktu;
  } else {
    return date;
  }
}

String getDayname(String date) {
  if (date != null && date != '') {
    final DateTime fromDate = DateTime.parse(date);
    final tanggal = DateFormat('EEE', 'id_ID');
    final String waktu = tanggal.format(fromDate);
    return waktu;
  } else {
    return date;
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) {
        if (str == 'UPTD') {
          return str.toUpperCase();
        }
        if (str == 'DAN' || str == 'PADA') {
          return str.toLowerCase();
        }

        return str.toCapitalized();
      }).join(' ');
}

Future<void> launchURL(
    {required String url, required BuildContext context}) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialogWidget(
        title: 'Gagal membuka halaman!',
        message: 'Tidak dapat memuat browser.',
      ),
    );
  }
}
