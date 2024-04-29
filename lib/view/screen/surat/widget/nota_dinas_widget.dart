import 'package:flutter/material.dart';
import 'package:portal_pns_flutter/utill/colors_resource.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotaDinasWidget extends StatelessWidget {
  final String notaDinas;
  const NotaDinasWidget({Key? key, required this.notaDinas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
          horizontal: Adaptive.w(3), vertical: Adaptive.w(5)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: Adaptive.w(5), vertical: Adaptive.w(5)),
        width: double.infinity,
        constraints: BoxConstraints(minHeight: 0, maxHeight: Adaptive.h(50)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 3,
                        color: ColorsResource.textColor,
                      ),
                    ),
                  ),
                  child: Text(
                    'Nota Dinas',
                    style: poppinsBold.copyWith(fontSize: 16.sp),
                  ),
                ),
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Icon(
                    Icons.close,
                    size: 18.sp,
                    color: ColorsResource.textColor,
                  ),
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
            SizedBox(height: Adaptive.h(1.5)),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Text(
                notaDinas,
                style: poppinsRegular.copyWith(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
