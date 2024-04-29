import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:portal_pns_flutter/view/screen/absensi/pages/modal_maps.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LokasiWidget extends StatelessWidget {
  final String address;
  final Position position;
  const LokasiWidget({Key? key, required this.address, required this.position});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Adaptive.h(5)),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Lokasi saat ini :',
                style: poppinsMedium.copyWith(
                  fontSize: 13.sp,
                ),
              ),
              SizedBox(width: Adaptive.w(2)),
              InkWell(
                splashColor: Colors.transparent,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: Adaptive.h(0.3), horizontal: Adaptive.h(0.5)),
                  decoration: BoxDecoration(
                    color: Color(0xff41a433),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        size: 14.sp,
                        color: Colors.white,
                      ),
                      SizedBox(width: Adaptive.w(1)),
                      Text(
                        'Petunjuk Lokasi',
                        style: poppinsLight.copyWith(
                            fontSize: 12.sp, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                onTap: () => showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierLabel: MaterialLocalizations.of(context)
                      .modalBarrierDismissLabel,
                  barrierColor: Colors.black45,
                  transitionDuration: const Duration(milliseconds: 200),
                  pageBuilder: (BuildContext buildContext, Animation animation,
                      Animation secondaryAnimation) {
                    return Center(
                      child: ModalMaps(
                        position: position,
                        address: address,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          SizedBox(height: Adaptive.h(0.5)),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: Adaptive.h(0.4)),
                child: Icon(
                  Icons.location_pin,
                  size: 16.sp,
                ),
              ),
              SizedBox(width: Adaptive.w(2)),
              Expanded(
                child: Text(
                  address,
                  maxLines: 1,
                  softWrap: true,
                  style: poppinsLight.copyWith(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 14.sp,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
