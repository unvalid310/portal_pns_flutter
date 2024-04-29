import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:portal_pns_flutter/data/model/mpejabat.dart';
import 'package:portal_pns_flutter/utill/colors_resource.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:strings/strings.dart';

class DaftarPejabatWidget extends StatefulWidget {
  final List<PejabatModel> pejabat;
  final List<PejabatModel>? listSelectedPejabat;
  const DaftarPejabatWidget(
      {Key? key, required this.pejabat, this.listSelectedPejabat})
      : super(key: key);

  @override
  State<DaftarPejabatWidget> createState() => _DaftarPejabatWidgetState();
}

class _DaftarPejabatWidgetState extends State<DaftarPejabatWidget> {
  List<PejabatModel> _selected = <PejabatModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  void initData() {
    if (widget.listSelectedPejabat?.length != null) {
      setState(() {
        _selected = widget.listSelectedPejabat!;
      });
    }
    print('selected ${widget.listSelectedPejabat?.length}');
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: widget.pejabat.length,
      separatorBuilder: (context, index) => Divider(
        height: Adaptive.h(0.5),
        thickness: 1,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: Adaptive.h(1),
            ),
            decoration: (_selected
                    .where(
                        (element) => element.nama == widget.pejabat[index].nama)
                    .isNotEmpty)
                ? BoxDecoration(
                    color: ColorsResource.primary.withOpacity(0.1),
                  )
                : BoxDecoration(color: Colors.white),
            child: Row(
              children: [
                if (_selected
                    .where(
                        (element) => element.nama == widget.pejabat[index].nama)
                    .isNotEmpty)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Adaptive.w(3)),
                    child: Icon(
                      Icons.check_circle_outline_outlined,
                      size: 18.sp,
                      color: ColorsResource.success,
                    ),
                  ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${camelize(widget.pejabat[index].nama)}',
                        style: poppinsBold.copyWith(
                          fontSize: 16.sp,
                        ),
                      ),
                      Text(
                        (widget.pejabat[index].jabatan != 'WALIKOTA METRO' &&
                                widget.pejabat[index].jabatan !=
                                    'WAKIL WALIKOTA METRO')
                            ? 'Nip. ${widget.pejabat[index].nip}'
                            : widget.pejabat[index].jabatan,
                        style: poppinsMedium.copyWith(
                          fontSize: 14.sp,
                          color: ColorsResource.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            if (_selected.isNotEmpty) {
              _selected.clear();
              setState(() {
                _selected.add(widget.pejabat[index]);
              });
              Navigator.pop(context, _selected);
            } else {
              setState(() {
                _selected.add(widget.pejabat[index]);
              });
              Navigator.pop(context, _selected);
            }
          },
        );
      },
    );
  }
}
