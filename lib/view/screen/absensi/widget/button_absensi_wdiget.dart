import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portal_pns_flutter/utill/images.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ButtonAbsensiWidget extends StatelessWidget {
  final Function()? onTap;
  ButtonAbsensiWidget({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Adaptive.h(3)),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.fromLTRB(
              Adaptive.h(4), Adaptive.h(4.5), Adaptive.h(2.5), Adaptive.h(4.5)),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            Images.ic_absensi,
            width: Adaptive.w(30),
          ),
        ),
        onTap: onTap != null ? onTap : () {},
      ),
    );
  }
}
