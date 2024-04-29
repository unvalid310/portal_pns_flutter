// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portal_pns_flutter/utill/images.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AlertDialogWidget extends StatelessWidget {
  final String title;
  final String message;
  final bool isError;
  final bool isWarning;
  final Function()? onClose;
  AlertDialogWidget({
    Key? key,
    required this.title,
    required this.message,
    this.isError = false,
    this.isWarning = false,
    this.onClose,
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              (isError)
                  ? Images.danger_animated
                  : (isWarning)
                      ? Images.warning_animated
                      : Images.success_animated,
              width: Adaptive.w(20),
            ),
            SizedBox(height: Adaptive.h(2)),
            Text(
              title,
              style: poppinsMedium.copyWith(
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: Adaptive.h(1)),
            Text(
              message,
              style: poppinsLight.copyWith(
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: Adaptive.h(2)),
            Divider(thickness: 1, height: Adaptive.h(3)),
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: Adaptive.h(1)),
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: Text(
                        'Ok, saya mengerti !',
                        style: poppinsMedium.copyWith(
                          fontSize: 14.sp,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      onTap: onClose ??
                          () {
                            return Navigator.of(context).pop();
                          },
                    ),
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
