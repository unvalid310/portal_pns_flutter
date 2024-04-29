// ignore_for_file: avoid_redundant_argument_values, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portal_pns_flutter/cubit/auth/auth_cubit.dart';
import 'package:portal_pns_flutter/utill/app_constants.dart';
import 'package:portal_pns_flutter/utill/images.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:portal_pns_flutter/di_container.dart' as di;

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SharedPreferences _sharedPreferences = di.getIt();

    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage:
                _sharedPreferences.getString(AppConstants.PROFILE_PICTURE) ==
                        null
                    ? AssetImage(Images.avatar)
                    : NetworkImage(_sharedPreferences
                        .getString(AppConstants.PROFILE_PICTURE)
                        .toString()) as ImageProvider,
            backgroundColor: Color(0xff4E95FF),
            radius: Adaptive.w(4.5),
          ),
          SizedBox(width: Adaptive.w(2)),
          Expanded(
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    _sharedPreferences.getString(AppConstants.NAMA).toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: poppinsMedium.copyWith(
                      fontSize: 15.sp,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    (_sharedPreferences.getString(AppConstants.USER_KATEGORI) !=
                            'PNS')
                        ? _sharedPreferences
                            .getString(AppConstants.NIP)
                            .toString()
                        : 'Nip. ${_sharedPreferences.getString(AppConstants.NIP).toString()}',
                    style: poppinsLight.copyWith(
                      fontSize: 13.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: Adaptive.w(2)),
          InkWell(
            splashColor: Colors.transparent,
            child: Icon(
              Icons.menu_rounded,
              size: 18.sp,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
