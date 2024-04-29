import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:portal_pns_flutter/cubit/absensi/absensi_cubit.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

AppBar AppbarRiwayatAbsensiWidget(
    {required BuildContext context, required Function() onPress}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Color(0xff41403f)),
    leading: IconButton(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      icon: Icon(
        Icons.close_rounded,
        size: 18.sp,
      ),
      onPressed: () async => Navigator.of(context).pop(true),
    ),
    title: Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Text(
        'Riwayat Absensi',
        overflow: TextOverflow.ellipsis,
        style: poppinsBold.copyWith(
          fontSize: 16.sp,
          color: Color(0xff41403f),
        ),
      ),
    ),
    actions: [
      IconButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        color: Theme.of(context).primaryColor,
        icon: Icon(
          Icons.calendar_today_outlined,
          size: 16.sp,
        ),
        onPressed: onPress,
      ),
    ],
  );
}
