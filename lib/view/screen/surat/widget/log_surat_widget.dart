// ignore_for_file: prefer_if_elements_to_conditional_expressions

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:portal_pns_flutter/data/model/msurat.dart';
import 'package:portal_pns_flutter/helper/string_helper.dart';
import 'package:portal_pns_flutter/utill/colors_resource.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:timelines/timelines.dart';

class LogSuratWidget extends StatelessWidget {
  final List<LogSurat> logSurat;
  const LogSuratWidget({Key? key, required this.logSurat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('count log surat : ${logSurat.length}');

    return Dialog(
      insetPadding: EdgeInsets.symmetric(
          horizontal: Adaptive.w(3), vertical: Adaptive.w(5)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: Adaptive.w(5), vertical: Adaptive.w(5)),
        width: double.infinity,
        constraints: BoxConstraints(minHeight: 0, maxHeight: Adaptive.h(100)),
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
                    'Riwayat Catatan',
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
            SizedBox(height: Adaptive.h(3)),
            Flexible(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  child: FixedTimeline.tileBuilder(
                    clipBehavior: Clip.none,
                    theme: TimelineThemeData(
                      color: ColorsResource.primary,
                      nodePosition: 0.1,
                      indicatorTheme: IndicatorThemeData(
                        size: Adaptive.h(2),
                      ),
                      connectorTheme: const ConnectorThemeData(
                        thickness: 1.5,
                      ),
                    ),
                    builder: TimelineTileBuilder.connectedFromStyle(
                      itemCount: logSurat.length,
                      firstConnectorStyle: ConnectorStyle.transparent,
                      lastConnectorStyle: ConnectorStyle.transparent,
                      nodePositionBuilder: (context, index) => 0.0,
                      indicatorPositionBuilder: (context, index) => 0.03,
                      indicatorStyleBuilder: (context, index) =>
                          IndicatorStyle.outlined,
                      connectorStyleBuilder: (context, index) =>
                          ConnectorStyle.dashedLine,
                      contentsBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(left: 2.h, bottom: 2.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Kepada ',
                                style: poppinsRegular.copyWith(
                                  fontSize: 14.sp,
                                  color: ColorsResource.textColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: '${logSurat[index].kepadaNama}\n',
                                    style: poppinsBold.copyWith(
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Oleh ',
                                  ),
                                  TextSpan(
                                    text: logSurat[index].pengirimNama,
                                    style: poppinsBold.copyWith(
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              dayAndTimeFormat(
                                logSurat[index].waktu,
                              ),
                              style: poppinsRegular.copyWith(
                                fontSize: 12.sp,
                                color: ColorsResource.textMuted,
                              ),
                            ),
                            if (logSurat[index].catatan != '')
                              ExpandableNotifier(
                                child: Container(
                                  margin: EdgeInsets.only(top: Adaptive.h(1)),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Adaptive.w(3),
                                    vertical: Adaptive.h(1),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[350],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Expandable(
                                    collapsed: ExpandableButton(
                                      child: Text(
                                        logSurat[index].catatan!,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        softWrap: true,
                                        style: poppinsMedium.copyWith(
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ),
                                    expanded: ExpandableButton(
                                      child: Text(
                                        logSurat[index].catatan!,
                                        softWrap: true,
                                        style: poppinsMedium.copyWith(
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
