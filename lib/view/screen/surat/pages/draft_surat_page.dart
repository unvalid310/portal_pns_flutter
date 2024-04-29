// ignore_for_file: sized_box_for_whitespace, prefer_is_empty, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portal_pns_flutter/cubit/surat/surat_cubit.dart';
import 'package:portal_pns_flutter/data/model/msurat.dart';
import 'package:portal_pns_flutter/utill/colors_resource.dart';
import 'package:portal_pns_flutter/view/screen/surat/detail_surat_screen.dart';
import 'package:portal_pns_flutter/view/screen/surat/widget/card_surat_unread_widget.dart';
import 'package:portal_pns_flutter/view/screen/surat/widget/card_surat_widget.dart';
import 'package:portal_pns_flutter/view/screen/surat/widget/shimmer/shimmer_card_surat.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DraftSuratPage extends StatefulWidget {
  const DraftSuratPage({Key? key}) : super(key: key);

  @override
  State<DraftSuratPage> createState() => _DraftSuratPageState();
}

class _DraftSuratPageState extends State<DraftSuratPage> {
  late List<SuratModel> _listSurat;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<SuratCubit>(context, listen: false).getDraftSurat();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuratCubit, SuratState>(
      builder: (context, state) {
        if (state is SuratProgress) {
          return Container(
            width: double.infinity,
            child: ListView.separated(
              itemCount: 10,
              shrinkWrap: true,
              clipBehavior: Clip.none,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => Divider(
                height: Adaptive.h(2),
                thickness: 1.5,
                color: ColorsResource.textMuted.withOpacity(0.1),
              ),
              itemBuilder: (context, index) => ShimmerCardSurat(),
            ),
          );
        }

        if (state is SuratSuccess) {
          _listSurat = state.listSurat;
        }

        return (_listSurat.length > 0)
            ? Container(
                width: double.infinity,
                child: ListView.separated(
                  itemCount: _listSurat.length,
                  shrinkWrap: true,
                  clipBehavior: Clip.none,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => Divider(
                    height: Adaptive.h(2),
                    thickness: 1.5,
                    color: ColorsResource.textMuted.withOpacity(0.1),
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: (_listSurat[index].read_status != '1')
                          ? CardSuratUnreadWidget(
                              surat: _listSurat[index],
                            )
                          : CardSuratWidget(surat: _listSurat[index]),
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (context) => BlocProvider.value(
                              value: BlocProvider.of<SuratCubit>(context),
                              child: DetailSuratScreen(
                                idSurat: _listSurat[index].id,
                                page: 'draft',
                              ),
                            ),
                          ),
                        ).then((value) => null);
                      },
                    );
                  },
                ),
              )
            : Center();
      },
    );
  }
}
