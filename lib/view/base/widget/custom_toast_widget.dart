import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portal_pns_flutter/utill/colors_resource.dart';
import 'package:portal_pns_flutter/utill/images.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomToastWidget extends StatelessWidget {
  final String message;
  final bool isError;
  const CustomToastWidget(
      {Key? key, required this.message, this.isError = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Adaptive.h(2), vertical: Adaptive.h(1.2)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: (isError)
            ? ColorsResource.danger.withOpacity(0.1)
            : ColorsResource.success.withOpacity(0.1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            (isError) ? Icons.cancel_rounded : Icons.check_circle,
            color: (isError) ? ColorsResource.danger : ColorsResource.success,
            size: 16.sp,
          ),
          SizedBox(width: Adaptive.h(1.2)),
          Text(
            message,
            style: poppinsMedium.copyWith(
              color: (isError) ? ColorsResource.danger : ColorsResource.success,
              fontSize: 14.sp,
            ),
          )
        ],
      ),
    );
  }
}
