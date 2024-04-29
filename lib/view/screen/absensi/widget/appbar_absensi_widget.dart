// ignore_for_file: avoid_redundant_argument_values, prefer_const_constructors, omit_local_variable_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:portal_pns_flutter/di_container.dart' as di;
import 'package:portal_pns_flutter/utill/app_constants.dart';
import 'package:portal_pns_flutter/utill/images.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

AppBar AppbarAbsensiWidget({required BuildContext context}) {
  final SharedPreferences _sharedPreferences = di.getIt();

  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Color(0xff41403f),
    ),
    leading: IconButton(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      icon: Icon(
        Icons.arrow_back_ios_new_rounded,
        size: 16.sp,
      ),
      onPressed: () async => Navigator.of(context).pop(true),
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            _sharedPreferences.getString(AppConstants.NAMA).toString(),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: poppinsMedium.copyWith(
              fontSize: 16.sp,
              color: Color(0xff41403f),
            ),
          ),
        ),
        SizedBox(width: Adaptive.w(3)),
        CircleAvatar(
          backgroundImage:
              _sharedPreferences.getString(AppConstants.PROFILE_PICTURE) == null
                  ? AssetImage(Images.avatar)
                  : NetworkImage(_sharedPreferences
                      .getString(AppConstants.PROFILE_PICTURE)
                      .toString()) as ImageProvider,
          backgroundColor: Color(0xff4E95FF),
          radius: Adaptive.w(3),
        ),
        // SizedBox(width: Adaptive.h(0.5))
      ],
    ),
  );
}
