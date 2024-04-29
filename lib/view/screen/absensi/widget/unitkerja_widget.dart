// ignore_for_file: omit_local_variable_types, avoid_function_literals_in_foreach_calls, unused_local_variable

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:portal_pns_flutter/helper/string_helper.dart';
import 'package:portal_pns_flutter/utill/app_constants.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:portal_pns_flutter/di_container.dart' as di;

class UnitKerjaWidget extends StatefulWidget {
  final Function(String) lokasi;
  final Function(int) tipeLokasi;
  final Function(String) unitKerja;
  UnitKerjaWidget({
    Key? key,
    required this.lokasi,
    required this.unitKerja,
    required this.tipeLokasi,
  }) : super(key: key);

  @override
  State<UnitKerjaWidget> createState() => _UnitKerjaWidgetState();
}

class _UnitKerjaWidgetState extends State<UnitKerjaWidget> {
  SharedPreferences _sharedPreferences = di.getIt();
  List<String> _unitOrganisasi = [];
  String _unitKerja = '';
  String _lokasi = '';

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    setState(() {
      _lokasi =
          _sharedPreferences.getString(AppConstants.UNIT_KERJA).toString();
    });
    widget.lokasi(
      _sharedPreferences.getString(AppConstants.UNIT_KERJA).toString(),
    );
    widget.unitKerja(
      _sharedPreferences.getString(AppConstants.UNIT_KERJA).toString(),
    );
    _sharedPreferences.getStringList(AppConstants.UNIT_ORGANISASI)!.forEach(
      (element) {
        _unitOrganisasi.add(element);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: Adaptive.h(3)),
        padding: EdgeInsets.symmetric(
            horizontal: Adaptive.w(3), vertical: Adaptive.w(1.5)),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xff41403f).withOpacity(0.5)),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                _lokasi,
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: poppinsMedium.copyWith(
                  fontSize: 14.sp,
                ),
              ),
            ),
            SizedBox(width: Adaptive.w(2)),
            Icon(
              Icons.arrow_drop_down_outlined,
              size: 16.sp,
            ),
          ],
        ),
      ),
      onTap: () async {
        return showMaterialModalBottomSheet(
          context: context,
          builder: (context) => SingleChildScrollView(
            controller: ModalScrollController.of(context),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var item in _unitOrganisasi)
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: Adaptive.w(5), vertical: 0),
                      minVerticalPadding: Adaptive.h(0.5),
                      title: Text(
                        item.toTitleCase(),
                        style: poppinsMedium.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _lokasi = item;
                        });
                        widget.lokasi(_lokasi);
                        widget.tipeLokasi(1);
                        Navigator.pop(context, [item.toTitleCase(), 2]);
                      },
                    ),
                  ListTile(
                    title: Text(
                      'Rapat Dinas',
                      style: poppinsMedium.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _lokasi = 'Rapat Dinas';
                      });
                      widget.lokasi(_lokasi);
                      widget.tipeLokasi(2);
                      Navigator.pop(context, ['Rapat Dinas', 2]);
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Dinas Luar',
                      style: poppinsMedium.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _lokasi = 'Dinas Luar';
                      });
                      widget.lokasi(_lokasi);
                      widget.tipeLokasi(2);
                      Navigator.pop(context, ['Dinas Luar', 2]);
                    },
                  ),
                  SizedBox(height: Adaptive.h(3)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
