import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portal_pns_flutter/cubit/berita/berita_cubit.dart';
import 'package:portal_pns_flutter/data/model/mberita.dart';
import 'package:portal_pns_flutter/utill/colors_resource.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:portal_pns_flutter/view/screen/berita/widget/list_berita_vertical_widget.dart';
import 'package:portal_pns_flutter/view/screen/berita/widget/shimmer_list_berita_vertical_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BeritaScreen extends StatefulWidget {
  const BeritaScreen({Key? key}) : super(key: key);

  @override
  _BeritaScreenState createState() => _BeritaScreenState();
}

class _BeritaScreenState extends State<BeritaScreen> {
  bool _isLoading = true;
  String _message = '';
  String _title = '';
  List<Mberita> _berita = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  void initData() async {
    await BlocProvider.of<BeritaCubit>(context).getBeritaList();
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
                'METRO TERKINI',
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
        padding: EdgeInsets.only(
            right: Adaptive.w(5), left: Adaptive.w(5), bottom: Adaptive.w(5)),
        width: double.infinity,
        child: BlocConsumer<BeritaCubit, BeritaState>(
          listener: (context, state) {
            if (state is BeritaProgress) {
              _isLoading = state.isLoading;
            }

            if (state is BeritaSuccess) {
              _berita = state.berita;
            }

            if (state is BeritaError) {
              Map<String, dynamic> _error =
                  (state.message) as Map<String, dynamic>;
              _isLoading = false;
              _message = _error['message'].toString();
              _title = _error['title'].toString();
            }
          },
          builder: (context, state) {
            return (_isLoading)
                ? ShimmerListBeritaVerticalWidget()
                : ListBeritaVerticalWidget(
                    listBerita: _berita,
                    title: _title,
                    message: _message,
                  );
          },
        ),
      ),
    );
  }
}
