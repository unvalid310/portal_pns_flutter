// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portal_pns_flutter/utill/colors_resource.dart';
import 'package:portal_pns_flutter/utill/images.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ConfirmAlertWidget extends StatelessWidget {
  final String title;
  final String message;
  final Function()? onClose;
  final Function()? onSubmit;
  const ConfirmAlertWidget({
    Key? key,
    required this.title,
    required this.message,
    this.onClose,
    this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)), //this right here
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Adaptive.w(5),
          vertical: Adaptive.h(3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(
                  Images.warning_animated,
                  height: 20.sp,
                ),
                SizedBox(width: Adaptive.w(3)),
                Text(
                  title,
                  style: poppinsMedium.copyWith(
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: Adaptive.h(3)),
            Text(
              message,
              textAlign: TextAlign.center,
              style: poppinsLight.copyWith(
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: Adaptive.h(2)),
            Divider(thickness: 1, height: Adaptive.h(3)),
            Container(
              padding: EdgeInsets.only(top: Adaptive.h(1)),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Text(
                      'Ya, Lanjutkan',
                      style: poppinsBold.copyWith(
                        fontSize: 14.sp,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    onTap: onSubmit ??
                        () {
                          return Navigator.of(context).pop();
                        },
                  ),
                  SizedBox(width: Adaptive.w(5)),
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Text(
                      'Tutup',
                      style: poppinsMedium.copyWith(
                        fontSize: 14.sp,
                        color: ColorsResource.textMuted,
                      ),
                    ),
                    onTap: onClose ??
                        () {
                          return Navigator.of(context).pop();
                        },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
