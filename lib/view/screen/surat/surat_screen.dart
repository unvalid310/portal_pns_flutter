import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:portal_pns_flutter/utill/colors_resource.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:portal_pns_flutter/view/screen/surat/pages/draft_surat_page.dart';
import 'package:portal_pns_flutter/view/screen/surat/pages/surat_keluar_page.dart';
import 'package:portal_pns_flutter/view/screen/surat/pages/surat_masuk_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SuratScreen extends StatefulWidget {
  const SuratScreen({Key? key}) : super(key: key);

  @override
  _SuratScreenState createState() => _SuratScreenState();
}

class _SuratScreenState extends State<SuratScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                'SURAT',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: poppinsBold.copyWith(
                  fontSize: 16.sp,
                  color: Color(0xff41403f),
                ),
              ),
            ),
            SizedBox(width: Adaptive.w(3)),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: Adaptive.w(5)),
              width: double.infinity,
              color: Colors.white,
              child: TabBar(
                controller: _tabController,
                labelStyle: poppinsBold.copyWith(
                  fontSize: 15.sp,
                ),
                unselectedLabelStyle: poppinsMedium.copyWith(
                  fontSize: 14.sp,
                ),
                unselectedLabelColor: Colors.grey[800],
                labelColor: ColorsResource.tabIndicator,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: Adaptive.h(0.45),
                    color: ColorsResource.tabIndicator,
                  ),
                  insets: EdgeInsets.only(
                    left: 0,
                    right: Adaptive.w(5),
                    bottom: Adaptive.h(0.7),
                  ),
                ),
                isScrollable: true,
                labelPadding: EdgeInsets.only(left: 0, right: Adaptive.w(5)),
                tabs: [
                  badges.Badge(
                    toAnimate: true,
                    showBadge: true,
                    animationType: badges.BadgeAnimationType.scale,
                    position: badges.BadgePosition.topEnd(
                        top: 0, end: -Adaptive.w(4)),
                    padding: EdgeInsets.symmetric(
                        horizontal: Adaptive.w(2), vertical: Adaptive.h(0.3)),
                    borderRadius: BorderRadius.circular(5),
                    shape: badges.BadgeShape.square,
                    badgeContent: Text(
                      '15',
                      style: poppinsMedium.copyWith(
                        fontSize: 11.sp,
                        color: Colors.white,
                      ),
                    ),
                    child: Tab(
                      text: 'Draft',
                    ),
                  ),
                  badges.Badge(
                    toAnimate: true,
                    showBadge: true,
                    animationType: badges.BadgeAnimationType.scale,
                    position: badges.BadgePosition.topEnd(
                        top: 0, end: -Adaptive.w(4)),
                    padding: EdgeInsets.symmetric(
                        horizontal: Adaptive.w(2), vertical: Adaptive.h(0.3)),
                    borderRadius: BorderRadius.circular(5),
                    shape: badges.BadgeShape.square,
                    badgeContent: Text(
                      '20',
                      style: poppinsMedium.copyWith(
                        fontSize: 11.sp,
                        color: Colors.white,
                      ),
                    ),
                    child: Tab(
                      text: 'Surat Masuk',
                    ),
                  ),
                  Tab(
                    text: 'Surat Keluar',
                  )
                ],
              ),
            ),
            SizedBox(height: Adaptive.h(1)),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  DraftSuratPage(),
                  SuratMasukPage(),
                  SuratKeluarPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
